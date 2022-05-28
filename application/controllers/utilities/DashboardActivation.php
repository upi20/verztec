<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DashboardActivation extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Utilities', 'Dashboard Activation'];
        $this->plugins = ['datatables', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Utilities';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Dashboard Activation';
        $this->breadcrumb_3_url = base_url() . 'utilities/dashboardActivation';

        $this->data['getData'] = $this->db->get_where('dashboard_activation')->row_array();
        // content
        $this->content      = 'utilities/dashboard-activation';

        // Send data to view
        $this->render();
    }
    public function simpan()
    {
        $spm = $this->input->post("spm");
        $p2pk = $this->input->post("p2pk");

        $data = [
            'spm'      => $spm,
            'p2pk'      => $p2pk
        ];

        $cek = $this->db->get('dashboard_activation')->num_rows();
        if($cek > 0){
            $this->db->update('dashboard_activation', $data);
        }else{
            $this->db->insert('dashboard_activation', $data);
        }
        echo "<script>alert('Pengaturan Dashboard Activation berhasil disimpan')</script>";
        redirect('utilities/dashboardActivation', 'refresh');
    }


    function __construct()
    {
        parent::__construct();
        // Cek session
        $this->sesion->cek_session();
        $akses = ['Super Admin', 'Admin Staff', 'Partner L1'];
        $get_lv = $this->session->userdata('data')['level'];
        if (!in_array($get_lv, $akses)) {
            redirect('my404', 'refresh');
        }

        // id dari menu data master version
        $this->id_menu = 101;
        $get_menu = $this->db->get_where('term_management', ['id_menu' => $this->id_menu])->row_array();
        $this->modul = $get_menu['nama'];

        $this->load->model("data-master/VersionModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
