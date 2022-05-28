<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ebook extends Render_Controller
{

    public function index()
    {
        // Page Settings
        // $this->title = $this->getMenuTitle();
        $this->title = "Ebook";
        $this->content = 'admin/resource/ebook';
        $this->navigation = ['Ebook'];
        $this->plugins = ['chartjs', 'datatables'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Home';
        $this->breadcrumb_1_url = '#';
        $this->breadcrumb_2 = 'Resource';
        $this->breadcrumb_2_url = base_url() . 'Ebook';

        // Send data to view
        $this->render();
    }

    function __construct()
    {
        parent::__construct();
        // Cek session
        $this->sesion->cek_session();
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');;
    }
}
