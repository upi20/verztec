<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends Render_Controller
{

    public function index()
    {
        // Page Settings
        // $this->title = $this->getMenuTitle();
        $this->title = "Dashboard";
        $this->content = 'admin/dashboard';
        $this->navigation = ['Dashboard'];
        $this->plugins = ['chartjs', 'datepicker'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Home';
        $this->breadcrumb_1_url = '#';
        $this->breadcrumb_2 = 'Dashboard';
        $this->breadcrumb_2_url = base_url() . 'dashboard';

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
        $this->load->helper('url');

        // model
        $this->load->model("DashboardModel", 'model');
    }
}
