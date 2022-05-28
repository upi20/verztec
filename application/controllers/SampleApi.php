<?php
defined('BASEPATH') or exit('No direct script access allowed');

class SampleApi extends Render_Controller
{

	public function index()
	{
		$this->sesion->cek_login();
		$this->content = 'sample-api';
		$this->render();
	}

	function __construct()
	{
		parent::__construct();
		$this->default_template = 'templates/sample-api';
		$this->load->library('plugin');
		$this->load->helper('url');
	}
}

/* End of file Login.php */
/* Location: ./application/controllers/Login.php */