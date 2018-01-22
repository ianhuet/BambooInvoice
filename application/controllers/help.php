<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Help extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	function index()
	{
		$this->output->cache(5);
		$data['page_title'] = $this->lang->line('menu_help');
		$this->load->view('help/index', $data);
	}

}
