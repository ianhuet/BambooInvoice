<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Logout extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	// --------------------------------------------------------------------

	function index()
	{
		$data['page_title'] = $this->lang->line('login_logout');
		$this->load->view('logout/index', $data);
	}

	// --------------------------------------------------------------------

	function logout_routine()
	{
		$this->session->sess_destroy();
		redirect('logout');
	}

	// --------------------------------------------------------------------

	function confirm()
	{
		$data['page_title'] = $this->lang->line('login_logout');
		$this->load->view('logout/logout_confirm', $data);
	}

}
