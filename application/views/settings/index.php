<?php
$this->load->view('header');
?>
<h2><?php echo $this->lang->line('bambooinvoice_logo');?> <?php echo $page_title;?></h2>

<?php if ($message != ''):?>
	<p class="error"><?php echo $message . form_error('error_string');?></p>
<?php endif;?>

<p><?php echo $this->lang->line('settings_settings_default') . ' ' . $this->lang->line('bambooinvoice_logo'). ' ' . $this->lang->line('settings_will_use');?></p>

<?php echo form_open_multipart('settings', array('id' => 'settingsform', 'onsubmit' => 'return requiredFields("");'));?>


	<div id="settings_sections">
		<div class="controls">
			<a href="#account_settings" id="account_settings_menu"><?php echo $this->lang->line('settings_account_settings');?></a>
			<a href="#invoice_settings" id="invoice_settings_menu"><?php echo $this->lang->line('settings_invoice_settings');?></a>
			<a href="#advanced_settings" id="advanced_settings_menu"><?php echo $this->lang->line('settings_advanced_settings');?></a>
		</div>

		<div class="scroller">
			<div class="content">
				<div class="section" id="account_settings">

					<p>
						<label for="company_name"><span><?php echo $this->lang->line('settings_company_name');?></span></label>
						<?php
							echo form_input(
								array(
									'name' 		=> 'company_name',
									'id' 		=> 'company_name',
									'value' 	=> (form_error('company_name')) ? (form_error('company_name')) : ($row->company_name),
									'maxlength' => '75'
								)
							);
							echo form_error('company_name_error');
						?>
					</p>

					<p>
						<label for="address1"><span><?php echo $this->lang->line('clients_address1');?></span></label>
						<?php
							echo form_input(
								array(
									'name' 		=> 'address1',
									'id' 		=> 'address1',
									'value' 	=> (form_error('address1')) ? (form_error('address1')) : ($row->address1),
									'maxlength' => '100'
								)
							);
							echo form_error('address1_error');
						?>
					</p>

					<p>
						<label for="address2"><span><?php echo $this->lang->line('clients_address2');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'address2',
													'id' 		=> 'address2',
													'value' 	=> (form_error('address2')) ? (form_error('address2')) : ($row->address2),
													'maxlength' => '100'
													)
											);
							echo form_error('address2_error');
						?>
					</p>

					<p>
						<label for="city"><span><?php echo $this->lang->line('clients_city');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'city',
													'id' 		=> 'city',
													'value' 	=> (form_error('city')) ? (form_error('city')) : ($row->city),
													'maxlength' => '50'
													)
											);
							echo form_error('city_error');
						?>
					</p>

					<p>
						<label for="province"><span><?php echo $this->lang->line('clients_province');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'province',
													'id' 		=> 'province',
													'value' 	=> (form_error('province')) ? (form_error('province')) : ($row->province),
													'maxlength' => '25'
													)
											);
							echo form_error('province_error');
						?>
					</p>

					<p>
						<label for="province"><span><?php echo $this->lang->line('clients_country');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'country',
													'id' 		=> 'country',
													'value' 	=> (form_error('country')) ? (form_error('country')) : ($row->country),
													'maxlength' => '25'
													)
											);
							echo form_error('country_error');
						?>
					</p>

					<p>
						<label for="postal_code"><span><?php echo $this->lang->line('clients_postal');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'postal_code',
													'id'  		=> 'postal_code',
													'value' 	=> (form_error('postal_code')) ? (form_error('postal_code')) : ($row->postal_code),
													'maxlength' => '10'
													)
											);
							echo form_error('postal_code_error');
						?>
					</p>

					<p>
						<label for="website"><span><?php echo $this->lang->line('clients_website');?></span></label>
						<?php
							echo form_input(
												array(
													'name' 		=> 'website',
													'id'  		=> 'website',
													'value' 	=> (form_error('website')) ? (form_error('website')) : ($row->website),
													'maxlength' => '150'
													)
											);
							echo form_error('website_error');
						?>
					</p>

					<p>
						<label for="primary_contact"><span><?php echo $this->lang->line('settings_primary_contact');?></span></label>
						<?php
							echo form_input(
												array(
													'name'		=> 'primary_contact',
													'id'		=> 'primary_contact',
													'class'		=> 'requiredfield',
													'value'		=> (form_error('primary_contact')) ? (form_error('primary_contact')) : ($row->primary_contact),
													'maxlength'	=> '75'
													)
											);
							echo form_error('primary_contact_error');
						?>
					</p>

					<p>
						<label for="primary_contact_email"><span><?php echo $this->lang->line('settings_primary_email');?><em class="error">*</em></span></label>
						<?php
							echo form_input(
												array(
													'name'		=> 'primary_contact_email',
													'id'		=> 'primary_contact_email',
													'class'		=> 'requiredfield',
													'value'		=> (form_error('primary_contact_email')) ? (form_error('primary_contact_email')) : ($row->primary_contact_email),
													'maxlength'	=> '75'
													)
											);
							echo form_error('primary_contact_email_error');
						?>
					</p>
					<p class="error"><?php echo $this->lang->line('settings_primary_email_message')?></p>

					<hr />

					<p>
						<label for="password"><span><?php echo $this->lang->line('login_password');?></span></label>
						<input name="password" type="password" id="password" size="30" />
						<?php echo form_error('password_error'); ?>
					</p>

					<p>
						<label for="password_confirm"><span><?php echo $this->lang->line('login_password_confirm');?></span></label>
						<input name="password_confirm" type="password" id="password_confirm" size="30" />
						<?php echo form_error('password_confirm_error'); ?>
					</p>

				</div>

				<div class="section" id="invoice_settings">

					<p>
						<label for="invoice_note_default"><span><?php echo $this->lang->line('settings_default_note');?> <br /><?php echo $this->lang->line('settings_note_max_chars');?></span></label>
						<textarea name="invoice_note_default" id="invoice_note_default" cols="50" rows="5"><?php echo (form_error('invoice_note_default')) ? (form_error('invoice_note_default')) : str_replace('\n', "\n", ($row->invoice_note_default));?></textarea></label><br /><?php echo form_error('invoice_note_default_error'); ?>
					</p>

					<p>
						<label for="tax_code"><span><?php echo $this->lang->line('settings_tax_code');?></span></label>
						<input class="requiredfield" name="tax_code" type="text" id="tax_code" size="50" value="<?php echo (form_error('tax_code')) ? (form_error('tax_code')) : ($row->tax_code);?>" />
						<?php echo form_error('tax_code_error'); ?>
					</p>

					<p>
						<label for="currency_type"><span><?php echo $this->lang->line('settings_currency_type');?></span></label>
						<input class="requiredfield" name="currency_type" type="text" id="currency_type" size="20" value="<?php echo (form_error('currency_type')) ? (form_error('currency_type')) : ($row->currency_type);?>" />
						<?php echo form_error('currency_type_error'); ?>
					</p>

					<p>
						<label for="currency_symbol"><span><?php echo $this->lang->line('settings_currency_symbol');?></span></label>
						<input class="requiredfield" name="currency_symbol" type="text" id="currency_symbol" size="20" value="<?php echo (form_error('currency_symbol')) ? (form_error('currency_symbol')) : ($row->currency_symbol);?>" />
						(ie: $ or &#163; or &#165;) <?php echo form_error('currency_symbol_error'); ?>
					</p>

					<p>
						<label for="days_payment_due"><span><?php echo $this->lang->line('settings_days_payment_due');?></span></label>
						<input class="requiredfield" name="days_payment_due" type="text" id="days_payment_due" size="20" value="<?php echo (form_error('days_payment_due')) ? (form_error('days_payment_due')) : ($row->days_payment_due);?>" />
						(ie: 30) <?php echo form_error('days_payment_due_error'); ?>
					</p>

					<p>
						<label for="tax1_desc"><span><?php echo $this->lang->line('invoice_tax1_description');?></span></label>
						<input name="tax1_desc" type="text" id="tax1_desc" value="<?php echo (form_error('tax1_desc')) ? (form_error('tax1_desc')) : ($row->tax1_desc);?>" />
						<?php echo form_error('tax1_desc_error'); ?><br />
						<label for="tax1_rate"><span><?php echo $this->lang->line('invoice_tax1_rate');?> </span></label>
						<input name="tax1_rate" type="text" id="tax1_rate" value="<?php echo (form_error('tax1_rate')) ? (form_error('tax1_rate')) : ($row->tax1_rate);?>" />
						(ie: 6.25) <?php echo form_error('tax1_rate_error'); ?>
					</p>

					<p>
						<label for="tax2_desc"><span><?php echo $this->lang->line('invoice_tax2_description');?></span></label>
						<input name="tax2_desc" type="text" id="tax2_desc" value="<?php echo (form_error('tax2_desc')) ? (form_error('tax2_desc')) : ($row->tax2_desc);?>" />
						<?php echo form_error('tax2_desc_error'); ?><br />
						<label for="tax2_rate"><span><?php echo $this->lang->line('invoice_tax2_rate');?> </span></label>
						<input name="tax2_rate" type="text" id="tax2_rate" value="<?php echo (form_error('tax2_rate')) ? (form_error('tax2_rate')) : ($row->tax2_rate);?>" />
						(ie: 5.0) <?php echo form_error('tax2_rate_error'); ?>
					</p>

				</div>

				<div class="section" id="advanced_settings">

					<div class="logo_holder">
						<?php if (isset($company_logo)) {echo $company_logo;}?>
					</div>

					<p>
						<label for="userfile"><span><?php echo $this->lang->line('settings_logo');?> (jpg, gif)</span></label> 
						<input name="userfile" type="file" id="userfile" />
						<?php echo form_error('logo_error'); ?>
					</p>

					<p>
						<label for="display_branding"><span><?php echo $this->lang->line('settings_display_branding');?></span></label>
						<input style="width: auto;" class="requiredfield" name="display_branding" type="checkbox" id="display_branding" size="20" value="y" <?php
						if (form_error('display_branding'))
						{
							echo form_error('display_branding');
						}
						elseif ($this->settings_model->get_setting('display_branding') == 'y')
						{
							echo 'checked="checked"';
						}
						?> />
						<?php echo form_error('display_branding_error'); ?>
					</p>

					<p>
						<label for="new_version_autocheck"><span><?php echo $this->lang->line('utilities_automatic_version_check');?></span></label>
						<input style="width: auto;" class="requiredfield" name="new_version_autocheck" type="checkbox" id="new_version_autocheck" size="20" value="y" <?php
						if (form_error('new_version_autocheck'))
						{
							echo form_error('set_checkbox')('new_version_autocheck', 'y');
						}
						elseif ($this->settings_model->get_setting('new_version_autocheck') == 'y')
						{
							echo 'checked="checked"';
						}
						?> />
						<?php echo form_error('new_version_autocheck_error'); ?>
					</p>

					<p>
						<label for="save_invoices"><span><?php echo $this->lang->line('settings_save_invoices');?></span></label>
						<input style="width: auto;" class="requiredfield" name="save_invoices" type="checkbox" id="save_invoices" size="20" value="y" <?php
						if (form_error('save_invoices'))
						{
							echo form_error('save_invoices');
						}
						elseif ($this->settings_model->get_setting('save_invoices') == 'y')
						{
							echo 'checked="checked"';
						}
						?> />
						<?php echo form_error('save_invoices_error'); ?><br />
						<span class="error"><?php echo $this->lang->line('settings_save_invoices_warning');?></span>
					</p>

				</div>
			</div>
		</div>
	</div>

	<p>
		<input type="submit" name="Submit" value="<?php echo $this->lang->line('settings_save_settings');?>" />
	</p>

<?php echo form_close();?>

<?php
$this->load->view('footer');
?>
