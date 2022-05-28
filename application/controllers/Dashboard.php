<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends Render_Controller
{

	public function index()
	{
		// Page Settings
		$this->title = $this->getMenuTitle();
		$this->navigation = ['Dashboard'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Dashboard';
		$this->breadcrumb_2_url = base_url() . 'dashboard';

		$this->content = 'dashboard/admin';
		$this->data['activation'] = $this->db->get_where('dashboard_activation')->row_array();
		$this->data['totalCompany'] = $this->model->getJumlahCompany();
		$this->data['totalResiko'] = $this->model->getJumlahResiko();
		$this->data['totalMembership'] = $this->model->getJumlahMembership();
		$this->data['totalPeristiwa'] = $this->model->getJumlahPeristiwa();
		$this->data['totalPatner'] = $this->model->getJumlahPatner();
		$this->data['totalPengguna'] = $this->model->getJumlahPengguna();
		$this->data['totalPenggunaWilayah'] = $this->model->getJumlahPenggunaWilayah();
		$this->data['kategoriKeanggotaan'] = $this->model->getKategoriKeanggotaan();
		$this->data['wilayah'] = $this->model->getWilayah();
		$jabatan =  array(
			0 => array('nama' => "Pengarah", 'value' => "pengarah"),
			1 => array('nama' => "Komisi", 'value' => "komisi"),
			2 => array('nama' => "Kepanitiaan", 'value' => "kepanitiaan"),
			3 => array('nama' => "Wilayah", 'value' => "wilayah")
		);
		$this->data['jabatan'] = $jabatan;
		// $this->data['jabatan'] = $this->model->getJabatan();
		$this->data['kategorial'] = $this->model->getKategorial();
		$this->data['dataFormal'] = $this->model->getDataFormal();
		$this->data['totalPenggunaKeanggotaan'] = $this->model->getJumlahPenggunaKeanggotaan();

		$this->data['totalLahir'] = $this->model->getJumlahPenggunaLahir();
		$this->data['totalMeninggal'] = $this->model->getJumlahPenggunaMeninggal();
		$this->data['totalUlangTahun'] = $this->model->getJumlahPenggunaUlangTahun();


		$this->data['totalSPM'] = $this->model->getJumlahSPM();
		$this->data['totalRepository'] = $this->model->getJumlahRepository();
		$this->data['totalActivity'] = $this->model->getJumlahActivity();

		// P2PK
		$this->data['totalP2PK'] = $this->model->getJumlahP2PK();
		$this->data['totalP2PKProgres'] = $this->model->getJumlahP2PKProgres();
		$this->data['totalP2PKSelesai'] = $this->model->getJumlahP2PKSelesai();

		$this->data['totalP2PKStatus1'] = $this->model->getJumlahP2PKStatus(1);
		$this->data['totalP2PKStatus2'] = $this->model->getJumlahP2PKStatus(2);
		$this->data['totalP2PKStatus3'] = $this->model->getJumlahP2PKStatus(3);
		$this->data['totalP2PKStatus4'] = $this->model->getJumlahP2PKStatus(4);

		$this->data['totalP2PKStatus5'] = $this->model->getJumlahP2PKStatus2(5);
		$this->data['totalP2PKStatus6'] = $this->model->getJumlahP2PKStatus2(6);
		$this->data['totalP2PKStatus7'] = $this->model->getJumlahP2PKStatus2(7);
		$this->data['totalP2PKStatus8'] = $this->model->getJumlahP2PKStatus2(8);
		$this->data['totalP2PKStatus9'] = $this->model->getJumlahP2PKStatus2(9);
		$this->data['totalP2PKStatus10'] = $this->model->getJumlahP2PKStatus2(10);


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		// Send data to view
		$this->render();
	}

	public function report()
	{
		// Page Settings
		$this->title = $this->getMenuTitle();
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';

		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();

		$this->content = 'dashboard/report';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		// Send data to view
		$this->render();
	}



	public function reportUlangTahun()
	{
		// Page Settings
		$this->title = "Report - Data Ulang Tahun bulan ini";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportUlangTahun';

		$this->data['totalUlangTahun'] = $this->model->getJumlahPenggunaUlangTahun();
		$this->data['totalMeninggal'] = $this->model->getJumlahPenggunaMeninggal();
		$this->data['totalLahir'] = $this->model->getJumlahPenggunaLahir();

		$this->content = 'dashboard/report-ulang-tahun';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		// Send data to view
		$this->render();
	}

	public function cariData()
	{
		// Page Settings
		$this->title = $this->getMenuTitle();
		$this->navigation = ['Dashboard'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Dashboard';
		$this->breadcrumb_1_url = '#';

		$filter_tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $filter_tanggal);

		$this->data['filter_tanggal'] = $filter_tanggal;

		$this->content = 'dashboard/admin';
		$this->data['activation'] = $this->db->get_where('dashboard_activation')->row_array();
		$this->data['totalCompany'] = $this->model->getJumlahCompany();
		$this->data['totalResiko'] = $this->model->getJumlahResiko();
		$this->data['totalMembership'] = $this->model->getJumlahMembership();
		$this->data['totalPeristiwa'] = $this->model->getJumlahPeristiwa();
		$this->data['totalPatner'] = $this->model->getJumlahPatner();
		$this->data['totalPengguna'] = $this->model->getJumlahPengguna();
		$this->data['totalPenggunaWilayah'] = $this->model->getJumlahPenggunaWilayah();
		$this->data['totalPenggunaKeanggotaan'] = $this->model->getJumlahPenggunaKeanggotaan();

		$this->data['totalLahir'] = $this->model->getJumlahPenggunaLahir($tanggal);
		$this->data['totalMeninggal'] = $this->model->getJumlahPenggunaMeninggal($tanggal);
		$this->data['totalUlangTahun'] = $this->model->getJumlahPenggunaUlangTahun();

		$this->data['totalSPM'] = $this->model->getJumlahSPM();
		$this->data['totalRepository'] = $this->model->getJumlahRepository();
		$this->data['totalActivity'] = $this->model->getJumlahActivity();

		// P2PK
		$this->data['totalP2PK'] = $this->model->getJumlahP2PK();
		$this->data['totalP2PKProgres'] = $this->model->getJumlahP2PKProgres();
		$this->data['totalP2PKSelesai'] = $this->model->getJumlahP2PKSelesai();

		$this->data['totalP2PKStatus1'] = $this->model->getJumlahP2PKStatus(1);
		$this->data['totalP2PKStatus2'] = $this->model->getJumlahP2PKStatus(2);
		$this->data['totalP2PKStatus3'] = $this->model->getJumlahP2PKStatus(3);
		$this->data['totalP2PKStatus4'] = $this->model->getJumlahP2PKStatus(4);

		$this->data['totalP2PKStatus5'] = $this->model->getJumlahP2PKStatus2(5);
		$this->data['totalP2PKStatus6'] = $this->model->getJumlahP2PKStatus2(6);
		$this->data['totalP2PKStatus7'] = $this->model->getJumlahP2PKStatus2(7);
		$this->data['totalP2PKStatus8'] = $this->model->getJumlahP2PKStatus2(8);
		$this->data['totalP2PKStatus9'] = $this->model->getJumlahP2PKStatus2(9);
		$this->data['totalP2PKStatus10'] = $this->model->getJumlahP2PKStatus2(10);


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		// Send data to view
		$this->render();
	}

	public function getNotifikasi()
	{
		$id = $this->session->userdata('data')['id'];
		$user_id = $this->db->select('id')->get_where('profile', ['id_user' => $id])->row_array();
		$user_id = $user_id['id'];
		$get = $this->db->order_by('id', 'desc')->get_where('notifikasi', ['ke' => $user_id]);
		$return['data'] = $get->result_array();
		$return['jumlah'] = $get->num_rows();
		$notif_baru = $this->db->order_by('id', 'desc')->get_where('notifikasi', ['ke' => $user_id, 'status' => 0])->num_rows();
		$return['jumlah_baru'] = $notif_baru;
		$this->output_json($return);
	}

	public function clearNotifikasi()
	{
		$id = $this->session->userdata('data')['id'];
		$user_id = $this->db->select('id')->get_where('profile', ['id_user' => $id])->row_array();
		$user_id = $user_id['id'];
		$update['status'] = 1;
		$this->db->where('ke', $user_id);
		$this->db->update('notifikasi', $update);
		$this->output_json(1);
	}

	public function reportStatistikMember()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Member";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikMember';

		$this->data['totalUlangTahun'] = $this->model->getJumlahPenggunaUlangTahun();
		$this->data['totalMeninggal'] = $this->model->getJumlahPenggunaMeninggal();
		$this->data['totalLahir'] = $this->model->getJumlahPenggunaLahir();

		$this->content = 'dashboard/report-statistik-member';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();
		// Send data to view
		$this->render();
	}

	public function reportStatistikWilayah()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Wilayah";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikWilayah';

		$this->content = 'dashboard/report-statistik-wilayah';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();

		$this->data['wilayah'] = $this->db->get_where('wilayah', ['status' => 1])->result_array();
		// Send data to view
		$this->render();
	}

	public function reportStatistikKategorial()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Kategorial";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikKategorial';

		$this->content = 'dashboard/report-statistik-kategorial';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];


		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();

		$this->data['kategorial'] = $this->db->get_where('kategorial', ['status' => 1])->result_array();
		// Send data to view
		$this->render();
	}

	public function reportStatistikKeaktifan()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Keaktifan";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikKeaktifan';

		$this->content = 'dashboard/report-statistik-keaktifan';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		$jabatan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 132])->row_array();
		$this->data['jabatan_alias'] = $jabatan_alias['nama'];

		$pilihan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 139])->row_array();
		$this->data['pilihan_keaktifan_alias'] = $pilihan_alias['nama'];

		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();
		$this->data['pilihanKeaktifan'] = $this->db->get_where('keaktifan_pilihan', ['status' => 1])->result_array();
		// $this->data['keaktifan'] = $jabatan;
		// Send data to view
		$this->render();
	}

	public function reportStatistikKeanggotaan()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Keanggotaan";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikKeanggotaan';

		$this->content = 'dashboard/report-statistik-keanggotaan';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];


		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();

		$this->data['keanggotaan'] = $this->db->get_where('kategori_keanggotaan', ['status' => 1])->result_array();
		// Send data to view
		$this->render();
	}

	public function reportStatistikDataFormal()
	{
		// Page Settings
		$this->title = "Report - Data Statistik Data Formal";
		$this->navigation = ['Report'];
		$this->plugins = ['datatables', 'daterangepicker'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Home';
		$this->breadcrumb_1_url = '#';
		$this->breadcrumb_2 = 'Report';
		$this->breadcrumb_2_url = base_url() . 'dashboard/report';
		$this->breadcrumb_3 = 'Ulang Tahun';
		$this->breadcrumb_3_url = base_url() . 'dashboard/reportStatistikDataFormal';

		$this->content = 'dashboard/report-statistik-data-formal';


		$partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
		$this->data['partner_alias'] = $partner_alias['nama'];

		$kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
		$this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

		$kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
		$this->data['kategorial_alias'] = $kategorial_alias['nama'];

		$wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
		$this->data['wilayah_alias'] = $wilayah_alias['nama'];

		$this->data['totalStatistikWilayah'] = $this->model->getTotalStatistikWilayah();
		$this->data['totalStatistikKeanggotaan'] = $this->model->getTotalStatistikKeanggotaan();
		$this->data['totalStatistikKeaktifan'] = $this->model->getTotalStatistikKeaktifan();
		$this->data['totalStatistikKategorial'] = $this->model->getTotalStatistikKategorial();
		$this->data['totalStatistikDataFormal'] = $this->model->getTotalStatistikDataFormal();

		$this->data['peristiwa'] = $this->db->get_where('dtm_peristiwa', ['status' => 1])->result_array();
		// Send data to view
		$this->render();
	}

	public function getReportKeluarga()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKeluarga($draw, $length, $start, $_cari, $order, $tanggal)->result_array();
		$count = $this->model->getReportKeluarga(null, null, null, $_cari, $order, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data, 'tanggal' => $tanggal_awal = date("Y-m-d", strtotime($tanggal[0]))]);
	}

	public function getReportAnggota()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);


		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportAnggota($draw, $length, $start, $_cari, $order, $tanggal)->result_array();
		$count = $this->model->getReportAnggota(null, null, null, $_cari, $order, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportUlangTahun()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$bulan = $this->input->post('bulan');

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportUlangTahun($draw, $length, $start, $_cari, $order, $bulan)->result_array();
		$count = $this->model->getReportUlangTahun(null, null, null, $_cari, $order, $bulan)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportKelahiran()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$usia = $this->input->post('usia');

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKelahiran($draw, $length, $start, $_cari, $order, $usia)->result_array();
		$count = $this->model->getReportKelahiran(null, null, null, $_cari, $order, $usia)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportKematian()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$usia = $this->input->post('usia');

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKematian($draw, $length, $start, $_cari, $order, $usia)->result_array();
		$count = $this->model->getReportKematian(null, null, null, $_cari, $order, $usia)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportWilayah()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$jenis = $this->input->post('jenis');
		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportWilayah($draw, $length, $start, $_cari, $order, $jenis, $tanggal)->result_array();
		$count = $this->model->getReportWilayah(null, null, null, $_cari, $order, $jenis, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportDataFormal()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$jenis = $this->input->post('jenis');
		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);
		$tanggal_awal = date("Y-m-d", strtotime($tanggal[0]));
		$tanggal_akhir = date("Y-m-d", strtotime($tanggal[1]));

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportDataFormal($draw, $length, $start, $_cari, $order, $jenis, $tanggal)->result_array();
		$count = $this->model->getReportDataFormal(null, null, null, $_cari, $order, $jenis, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data, 'tanggal' => $tanggal_akhir]);
	}

	public function getReportKategorial()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$jenis = $this->input->post('jenis');
		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKategorial($draw, $length, $start, $_cari, $order, $jenis, $tanggal)->result_array();
		$count = $this->model->getReportKategorial(null, null, null, $_cari, $order, $jenis, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportKeaktifan()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$jenis = $this->input->post('jenis');
		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKeaktifan($draw, $length, $start, $_cari, $order, $jenis, $tanggal)->result_array();
		$count = $this->model->getReportKeaktifan(null, null, null, $_cari, $order, $jenis, $tanggal)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	public function getReportKeanggotaan()
	{
		$order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
		$start = $this->input->post('start');
		$draw = $this->input->post('draw');
		$draw = $draw == null ? 1 : $draw;
		$length = $this->input->post('length');
		$cari = $this->input->post('search');

		$status = $this->input->post('status');
		$jenis = $this->input->post('jenis');
		$tanggal = $this->input->post('tanggal');
		$tanggal = explode(' - ', $tanggal);

		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}

		$data = $this->model->getReportKeanggotaan($draw, $length, $start, $_cari, $order, $jenis, $tanggal, $status)->result_array();
		$count = $this->model->getReportKeanggotaan(null, null, null, $_cari, $order, $jenis, $tanggal, $status)->num_rows();

		$this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
	}

	function __construct()
	{
		parent::__construct();
		$this->sesion->cek_session();
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session

		// model
		$this->load->model("DashboardModel", 'model');
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */