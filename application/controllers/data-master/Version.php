<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Version extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Data Master', 'Version'];
        $this->plugins = ['datatables', 'moment', 'summernote'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Data Master';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Version';
        $this->breadcrumb_3_url = base_url() . 'data-master/version';

        // content
        $this->content      = 'data-master/version';

        // Send data to view
        $this->render();
    }


    public function ajax_data()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getAllData($draw, $length, $start, $_cari, $order)->result_array();
        $count = $this->model->getAllData(null, null, null, $_cari, $order, null)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getVersion()
    {
        $id = $this->input->get("id");
        $result = $this->model->getVersion($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }


    public function insert()
    {
        $nama = $this->input->post("nama");
        $keterangan = $this->input->post("keterangan");
        $tanggal_release = $this->input->post("tanggal_release");
        $status = $this->input->post("status");
        $result = $this->model->insert($nama, $keterangan, $tanggal_release, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }


    public function update()
    {
        $id = $this->input->post("id");
        $nama = $this->input->post("nama");
        $keterangan = $this->input->post("keterangan");
        $tanggal_release = $this->input->post("tanggal_release");
        $status = $this->input->post("status");
        $result = $this->model->update($id, $nama, $keterangan, $tanggal_release, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }


    public function delete()
    {
        $id = $this->input->post("id");
        $result = $this->model->delete($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    // dipakai Registrasi |
    public function cari()
    {
        $key = $this->input->post('q');
        // jika inputan ada
        if ($key) {
            $this->output_json([
                "results" => $this->model->cari($key)
            ]);
        } else {
            $this->output_json([
                "results" => []
            ]);
        }
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
