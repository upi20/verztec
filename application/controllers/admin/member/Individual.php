<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Individual extends Render_Controller
{

    public function index()
    {
        // Page Settings
        // $this->title = $this->getMenuTitle();
        $this->title = "Individual";
        $this->content = 'admin/member/individual';
        $this->navigation = ['Individual'];
        $this->plugins = ['chartjs', 'datatables', 'select2', 'summernote'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Home';
        $this->breadcrumb_1_url = '#';
        $this->breadcrumb_2 = 'Member';
        $this->breadcrumb_2_url = base_url() . 'Individual';
        $this->data['dataset'] = $this->db->limit(1000)->get('individual')->result();

        $this->data['organizations'] = $this->db->select('distinct(organization) as name')->get('individual')->result();
        $this->data['countries'] = $this->db->select('distinct(country) as name')->get('individual')->result();
        $this->data['cities'] = $this->db->select('distinct(city) as name')->get('individual')->result();
        $this->data['churchs'] = $this->db->select('distinct(church_name) as name')->get('individual')->result();

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
