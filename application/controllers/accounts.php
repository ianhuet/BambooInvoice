<?php

class Accounts extends MY_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model('clientcontacts_model');
	}

	// --------------------------------------------------------------------

	function index($message = '')
	{
		$this->load->library('form_validation');

		$data['accounts'] = $this->clientcontacts_model->get_admin_contacts();

		$data['page_title'] = $this->lang->line('menu_accounts');
		$data['message'] = $message;

		$this->form_validation->set_rules('username', 'lang:login_username', 'required');
		$this->form_validation->set_rules('first_name', 'lang:login_password', 'required');
		$this->form_validation->set_rules('last_name', 'lang:login_password', 'required');
		$this->form_validation->set_rules('login_password', 'lang:login_password', 'required');
		$this->form_validation->set_rules('login_password_confirm', 'lang:login_password_confirm', 'required');

		$client_contact_validation = array(
			array(
				'field'   => 'username',
				'label'   => 'lang:login_username',
				'rules'   => 'required|max_length[127]|valid_email'
			),
			array(
				'field'   => 'first_name',
				'label'   => 'lang:clients_first_name',
				'rules'   => 'trim|htmlspecialchars|required|max_length[25]'
			),
			array(
				'field'   => 'last_name',
				'label'   => 'lang:clients_last_name',
				'rules'   => 'trim|htmlspecialchars|required|max_length[25]'
			), 
			array(
				'field'   => 'login_password',
				'label'   => 'lang:login_password',
				'rules'   => 'required|max_length[25]'
			),
			array(
				'field'   => 'login_password_confirm',
				'label'   => 'lang:login_password_confirm',
				'rules'   => 'matches[login_password]'
			),
		);

		$this->form_validation->set_rules($client_contact_validation);

		if ($this->form_validation->run() == FALSE)
		{
			$this->load->view('accounts/index', $data);
		}
		else
		{
			$client_id = $this->clientcontacts_model->addClientContact(
				0, 
				$this->input->post('first_name'), 
				$this->input->post('last_name'), 
				$this->input->post('username'), 
				$this->input->post('phone'),
				$this->input->post('title'),
				1 // turn on login access
			);

			// normally clients don't get passwords, so we need to manually set it now
			$this->clientcontacts_model->password_change($client_id, $this->input->post('login_password'));

			redirect('accounts');
		}
	}

	// --------------------------------------------------------------------

	function delete()
	{
		$id = ($this->input->get_post('id')) ? (int) $this->input->get_post('id') : $this->uri->segment(3);

		if ($this->clientcontacts_model->deleteClientContact($id))
		{
			$this->index($this->lang->line('accounts_admin_account_delete_success'));
		}
		else
		{
			$this->index($this->lang->line('accounts_admin_account_delete_fail'));
		}
	}

	// --------------------------------------------------------------------

	function _validation()
	{
		$this->form_validation->set_rules('clientName', $this->lang->line('clients_name'), 'trim|required|max_length[75]|htmlspecialchars');
		$this->form_validation->set_rules('website', $this->lang->line('clients_website'), 'trim|htmlspecialchars|max_length[150]');
		$this->form_validation->set_rules('address1', $this->lang->line('clients_address1'), 'trim|htmlspecialchars|max_length[100]');
		$this->form_validation->set_rules('address2', $this->lang->line('clients_address2'), 'trim|htmlspecialchars|max_length[100]');
		$this->form_validation->set_rules('city', $this->lang->line('clients_cityt'),'trim|htmlspecialchars|max_length[50]');
		$this->form_validation->set_rules('province', $this->lang->line('clients_province'),'trim|htmlspecialchars|max_length[25]');
		$this->form_validation->set_rules('country', $this->lang->line('clients_country'),'trim|htmlspecialchars|max_length[25]');
		$this->form_validation->set_rules('postal_code', $this->lang->line('clients_postal'), 'trim|htmlspecialchars|max_length[10]');
		$this->form_validation->set_rules('tax_status', $this->lang->line('invoice_tax_status'), 'trim|htmlspecialchars|exact_length[1]|numeric|required');

		$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
	}

	// --------------------------------------------------------------------

	function _validation_client_contact()
	{
		$this->form_validation->set_rules('client_id', $this->lang->line('clients_id'), 'trim|required|htmlspecialchars|numeric');
		$this->form_validation->set_rules('first_name', $this->lang->line('clients_first_name'), 'trim|required|htmlspecialchars|max_length[25]');
		$this->form_validation->set_rules('last_name', $this->lang->line('clients_last_name'), 'trim|required|htmlspecialchars|max_length[25]');
		$this->form_validation->set_rules('email', $this->lang->line('clients_email'), 'trim|required|htmlspecialchars|max_length[127]|valid_email');
		$this->form_validation->set_rules('phone', $this->lang->line('clients_phone'), 'trim|htmlspecialchars|max_length[20]');
		$this->form_validation->set_rules('title', $this->lang->line('clients_title'), 'trim|htmlspecialchars');

		$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
	}
}
