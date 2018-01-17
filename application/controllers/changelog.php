<?php

class Changelog extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$data['page_title'] = $this->lang->line('menu_changelog');
		$this->load->view('changelog/index', $data);
	}

}
