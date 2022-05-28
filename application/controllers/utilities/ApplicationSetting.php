<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ApplicationSetting extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Utilities', 'Application setting'];
        $this->plugins = ['datatables', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Data Master';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Version';
        $this->breadcrumb_3_url = base_url() . 'utilities/applicationSetting';

        $this->data['getData'] = $this->db->get_where('pengaturan_aplikasi')->row_array();
        // content
        $this->content      = 'utilities/application-setting';

        // Send data to view
        $this->render();
    }
    public function simpan()
    {
        $nama_aplikasi = $this->input->post("nama_aplikasi");
        $keterangan = $this->input->post("keterangan");
    
        // cek apakah ada logo yang dikirim
        $ubah_logo = false;
        if ($_FILES['logo']['name'] != '') {
            // simpan logo
            $logo = $this->saveFile();
            $ubah_logo = true;

            $get_logo = $this->db->select('logo')->from('pengaturan_aplikasi')->get()->row_array();
            $this->db->reset_query();
            // delete logo
            if ($get_logo != null) {
                if ($get_logo['logo'] != null && $get_logo['logo'] != '') {
                    $this->deleteFile($get_logo['logo']);
                }
            }
        }

        // cek apakah ada favicon yang dikirim
        $ubah_favicon = false;
        if ($_FILES['favicon']['name'] != '') {
            // simpan favicon
            $favicon = $this->saveFile2();
            $ubah_favicon = true;

            $get_favicon = $this->db->select('favicon')->from('pengaturan_aplikasi')->get()->row_array();
            $this->db->reset_query();
            // delete favicon
            if ($get_favicon != null) {
                if ($get_favicon['favicon'] != null && $get_favicon['favicon'] != '') {
                    $this->deleteFile($get_favicon['favicon']);
                }
            }
        }

        $data = [
            'nama_aplikasi' => $nama_aplikasi,
            'keterangan' => $keterangan
        ];
        
        // jika logo diubah
        if ($ubah_logo) {
            $data['logo'] = $logo['data'];
        }

        // jika favicon diubah
        if ($ubah_favicon) {
            $data['favicon'] = $favicon['data'];
        }

        $cek = $this->db->get('pengaturan_aplikasi')->num_rows();
        if($cek > 0){
            $this->db->update('pengaturan_aplikasi', $data);
        }else{
            $this->db->insert('pengaturan_aplikasi', $data);
        }
        echo "<script>alert('Pengaturan aplikasi berhasil disetting')</script>";
        redirect('utilities/applicationSetting', 'refresh');
    }

    private function saveFile()
    {
        $config['upload_path']          = './files/utilities/application-setting/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['file_name']            = md5(uniqid("logo", true));
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('logo')) {
            return [
                'status' => true,
                'data' => $this->upload->data("file_name"),
                'message' => 'Success'
            ];
        } else {
            return [
                'status' => false,
                'data' => null,
                'message' => $this->upload->display_errors('', '')
            ];
        }
    }

    private function saveFile2()
    {
        $config['upload_path']          = './files/utilities/application-setting/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['file_name']            = md5(uniqid("favicon", true));
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('favicon')) {
            return [
                'status' => true,
                'data' => $this->upload->data("file_name"),
                'message' => 'Success'
            ];
        } else {
            return [
                'status' => false,
                'data' => null,
                'message' => $this->upload->display_errors('', '')
            ];
        }
    }

    private function deleteFile($file)
    {
        $res_foto = true;
        if (file_exists('./files/utilities/application-setting/' . $file)) {
            $res_foto = unlink('./files/utilities/application-setting/' . $file);
        }
        return $res_foto;
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
