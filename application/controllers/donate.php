<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Donate extends MY_Controller {

	// Most controllers use "my_controller" for auth and such, but front, changelog, credits
	// donate and help are publicly visible, and aren't extended.
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$data['page_title'] = 'Thanks for the donation';
		$this->load->view('donate/index', $data);
	}

}
