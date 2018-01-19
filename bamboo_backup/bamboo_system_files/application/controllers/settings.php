<?php

class Settings extends MY_Controller {

	function Settings()
	{
		parent::MY_Controller();
		$this->load->library('validation');
		$this->load->helper(array('logo', 'file', 'form', 'path'));
		$this->load->model('settings_model');
	}

	// --------------------------------------------------------------------

	function index()
	{
		$this->_validation(); // Load the validation rules and fields

		$data['extraHeadContent'] = "<script type=\"text/javascript\" src=\"". base_url()."js/glider.js\"></script>\n";
		$data['extraHeadContent'] .= "<script type=\"text/javascript\" src=\"". base_url()."js/settings.js\"></script>\n";
		$data['extraHeadContent'] .= "<link type=\"text/css\" rel=\"stylesheet\" href=\"". base_url()."css/settings.css\" />\n";

		$data['company_logo'] = get_logo($this->settings_model->get_setting('logo'));

		if ( ! $this->validation->run())
		{
			// if company_name was submitted, but we're here in the failed validation statement, then it means there were errors
			if ($this->input->post('company_name'))
			{
				$data['message'] = $this->lang->line('settings_modify_fail');
			}
			else
			{
				$data['message'] = $this->session->flashdata('status');
			}

			// grab existing prefs
			$data['row'] = $this->db->get('settings')->row();
			$data['page_title'] = $this->lang->line('menu_settings');
			$this->load->view('settings/index', $data);
		}
		else
		{
			$save_invoices = ($this->input->post('save_invoices') == 'y') ? 'y' : 'n';

			$data = array(
							'company_name' => $this->input->post('company_name'),
							'address1' => $this->input->post('address1'),
							'address2' => $this->input->post('address2'),
							'city' => $this->input->post('city'),
							'province' => $this->input->post('province'),
							'country' => $this->input->post('country'),
							'postal_code' => $this->input->post('postal_code'),
							'website' => $this->input->post('website'),
							'primary_contact' => $this->input->post('primary_contact'),
							'primary_contact_email' => $this->input->post('primary_contact_email'),
							'invoice_note_default' => $this->input->post('invoice_note_default'),
							'currency_type' => $this->input->post('currency_type'),
							'currency_symbol' => $this->input->post('currency_symbol'),
							'days_payment_due' => (int) $this->input->post('days_payment_due'),
							'tax_code' => $this->input->post('tax_code'),
							'tax1_desc' => $this->input->post('tax1_desc'),
							'tax1_rate' => $this->input->post('tax1_rate'),
							'tax2_desc' => $this->input->post('tax2_desc'),
							'tax2_rate' => $this->input->post('tax2_rate'),
							'save_invoices' => $save_invoices,
							'display_branding' => $this->input->post('display_branding'),
							'new_version_autocheck' => $this->input->post('new_version_autocheck')
						);

			// Euro has conversion issues in DOMPDF, this is a fix for it
			$data['currency_symbol'] = ($data['currency_symbol'] == '€') ? '&#0128;' : $data['currency_symbol'];

			// Logo uploading
			$config['upload_path'] 		= './img/logo/';
			$config['allowed_types'] 	= 'gif|jpg';
			$config['max_size'] 		= '500'; 
			$config['max_width'] 		= '900';
			$config['max_height'] 		= '200'; // these are WAY more then someone should need for a logo

			$this->load->library('upload', $config);

			$extra_message = '';

			if ($this->upload->do_upload())
			{
				$logo_data = $this->upload->data();

				// add the logo into the settings update
				$data['logo'] = $logo_data['file_name'];
				$data['logo_pdf'] = $logo_data['file_name'];
			}

			$extra_message .= ($this->input->post('userfile') != '') ? $this->upload->display_errors('<br />') : '';

			// run the update
			$update_settings = $this->settings_model->update_settings($data);

			if ($this->db->affected_rows() == 1 OR $update_settings === TRUE)
			{
				$this->load->model('clientcontacts_model');

				// was the email address changed, and if so, be sure this isn't the demo, and also
				// update the login email

				if ($this->input->post('primary_contact_email') != '' && $this->settings_model->get_setting('demo_flag') != 'y')
				{
					$this->clientcontacts_model->email_change(1, $this->input->post('primary_contact_email'));
				}

				// was the password getting changed, and if so, be sure this isn't the demo
				if ($this->input->post('password') != '' && $this->input->post('password') == $this->input->post('password_confirm') && $this->settings_model->get_setting('demo_flag') != 'y')
				{
					$this->clientcontacts_model->password_change(1, $this->input->post('password'));
				}

				$this->session->set_flashdata('status', $this->lang->line('settings_modify_success') . ' ' . $extra_message);
			}
			else
			{
				$this->session->set_flashdata('status', $this->lang->line('settings_modify_fail') . ' ' . $extra_message);
			}

			// running a redirect here instead of loading a view because glider.js seems to freeze without the reload
			redirect('settings');
		}
	}

	// --------------------------------------------------------------------

	function _validation()
	{
		$this->form_validation->set_rules('company_name', $this->lang->line('settings_company_name'), "trim|max_length[75]");
		$this->form_validation->set_rules('address1', $this->lang->line('clients_address1'), "trim|max_length[100]");
		$this->form_validation->set_rules('address2', $this->lang->line('clients_address2'), "trim|max_length[100]");
		$this->form_validation->set_rules('city', $this->lang->line('clients_city'), "trim|max_length[50]");
		$this->form_validation->set_rules('province', $this->lang->line('clients_province'), "trim|max_length[25]");
		$this->form_validation->set_rules('country', $this->lang->line('clients_country'), "trim|prep_for_form|max_length[25]");
		$this->form_validation->set_rules('postal_code', $this->lang->line('clients_postal'), "trim|prep_for_form|max_length[10]");
		$this->form_validation->set_rules('website', $this->lang->line('clients_website'), "trim|prep_for_form|max_length[150]");
		$this->form_validation->set_rules('primary_contact', $this->lang->line('settings_primary_contact'), "trim|prep_for_form|required|max_length[75]");
		$this->form_validation->set_rules('primary_contact_email', $this->lang->line('settings_primary_email'), "trim|prep_for_form|required|max_length[50]|valid_email");
		$this->form_validation->set_rules('password', $this->lang->line('login_password'), "min_length[4]|max_length[50]|alpha_dash");
		$this->form_validation->set_rules('password_confirm', $this->lang->line('login_password_confirm'), "matches[password]");
		$this->form_validation->set_rules('logo', $this->lang->line('settings_logo'), "trim|prep_for_form|max_length[50]");
		$this->form_validation->set_rules('invoice_note_default', $this->lang->line('settings_default_note'), "trim|prep_for_form|max_length[2000]");
		$this->form_validation->set_rules('currency_type', $this->lang->line('settings_currency type'), "trim|prep_for_form|max_length[20]");
		$this->form_validation->set_rules('currency_symbol', $this->lang->line('settings_currency symbol'), "ltrim|max_length[9]");
		$this->form_validation->set_rules('days_payment_due', $this->lang->line('settings_payment_days'), "trim|prep_for_form|numeric|max_length[3]");
		$this->form_validation->set_rules('tax_code', $this->lang->line('settings_tax_code'), "trim|prep_for_form|max_length[50]");
		$this->form_validation->set_rules('tax1_desc', $this->lang->line('invoice_tax1_description'), "trim|prep_for_form|max_length[50]");
		$this->form_validation->set_rules('tax1_rate', $this->lang->line('invoice_tax1_rate'), "trim|prep_for_form|max_length[6]");
		$this->form_validation->set_rules('tax2_desc', $this->lang->line('invoice_tax2_description'), "trim|prep_for_form|max_length[50]");
		$this->form_validation->set_rules('tax2_rate', $this->lang->line('invoice_tax2_rate'), "trim|prep_for_form|max_length[6]");
		$this->form_validation->set_rules('save_invoices', $this->lang->line('settings_display_branding'), "trim|alpha|max_length[1]");
		$this->form_validation->set_rules('display_branding', $this->lang->line('settings_display_branding'), "trim|alpha|max_length[1]");
		$this->form_validation->set_rules('new_version_autocheck', $this->lang->line('utilities_automatic_version_check'), "trim|alpha|max_length[1]");

		$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
	}
}
?>