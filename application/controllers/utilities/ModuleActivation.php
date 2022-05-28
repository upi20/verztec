<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ModuleActivation extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Utilities', 'Module Activation'];
        $this->plugins = ['datatables', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Utilities';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Module Activation';
        $this->breadcrumb_3_url = base_url() . 'utilities/moduleActivation';

        $this->data['getData'] = $this->db->get_where('module_activation')->row_array();
        // content
        $this->content      = 'utilities/module-activation';

        // Send data to view
        $this->render();
    }
    public function simpan()
    {
        $p2pk       = $this->input->post("p2pk");
        $spm        = $this->input->post("spm");
        $repository = $this->input->post("repository");
        $aktifitas  = $this->input->post("aktifitas");

        $data = [
            'p2pk'          => $p2pk,
            'spm'           => $spm,
            'repository'    => $repository,
            'aktifitas'     => $aktifitas
        ];

        $cek = $this->db->get('module_activation')->num_rows();
        if($cek > 0){
            $this->db->update('module_activation', $data);
        }else{
            $this->db->insert('module_activation', $data);
        }
        echo "<script>alert('Pengaturan Module Activation berhasil disimpan')</script>";
        redirect('utilities/moduleActivation', 'refresh');
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
