<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Organization extends Render_Controller
{

    public function index()
    {
        // Page Settings
        // $this->title = $this->getMenuTitle();
        $this->title = "Organization";
        $this->content = 'admin/member/organization';
        $this->navigation = ['Organization'];
        $this->plugins = ['chartjs', 'datatables', 'select2'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Home';
        $this->breadcrumb_1_url = '#';
        $this->breadcrumb_2 = 'Member';
        $this->breadcrumb_2_url = base_url() . 'Organization';
        $this->data['dataset'] = $this->db->limit(1000)->get('organization')->result();
        // Send data to view
        $this->render();
    }

    public function member()
    {
        // Page Settings
        // $this->title = $this->getMenuTitle();
        $limit = $this->input->get('fill') ?? 0;
        $name = $this->input->get('name') ?? 0;
        $this->title =  $name . " | Organization";
        $this->content = 'admin/member/organization_member';
        $this->navigation = ['Organization'];
        $this->plugins = ['chartjs', 'datatables', 'select2'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Home';
        $this->breadcrumb_1_url = '#';
        $this->breadcrumb_2 = 'Member';
        $this->breadcrumb_2_url = base_url() . 'Organization';
        $this->data['dataset'] = $this->db->limit($limit)->get('individual')->result();
        $this->data['name'] = $name;
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
