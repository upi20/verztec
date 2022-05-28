<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Profile extends Render_Controller
{

    public function getCode(){
        $id = $this->input->post('id');
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');
        $cek = $this->db->get_where('profile a', ['id' => $id])->row_array();
        if($cek['kode'] != null){
            $kode = $cek['kode'];
        }else{
            $id_menu = 2;
            $id_kategori_keanggotaan = 1; // pengunjung
            $get = $this->db->select('a.*, b.nama as kode_kategori')
                        ->join('kategori_keanggotaan b', 'b.id = a.id_kategori')
                        ->get_where('kode a', ['a.status' => 1, 'b.id' => $id_kategori_keanggotaan])
                        ->row_array();
            $jumlah = $get['jumlah'];

            $cek_tahun_bulan = $this->db->get_where('profile', ['kode_tahun_bulan' => $tahun.$bulan])->row_array();
            if($cek_tahun_bulan == null){
                $kode = 1;
            }else{
                $this->db->select('RIGHT(profile.kode,'.$jumlah.') as id', FALSE);
                $this->db->order_by('id','DESC');
                $this->db->where('kode_tahun_bulan',$tahun.$bulan);
                $this->db->limit(1);    
                $query = $this->db->get('profile');  //cek dulu apakah ada sudah ada kode di tabel.    
                if($query->num_rows() <> 0){      
                   $data = $query->row();      
                   $kode = intval($data->id) + 1; 
                }
                else{      
                   $kode = 1; 
                }
            }    
        }
        $batas = str_pad($kode, $jumlah, "0", STR_PAD_LEFT);    
        
        if($bulan == null){
            $bulan = "";
        }

        if($tahun == null){
            $tahun = "";
        }
        // $kodetampil = $get['kode']."-".$tahun.$bulan."-".$batas.$get['kode_kategori'];
        $kodetampil = $get['kode']."-".$tahun.$bulan."-".$batas;
          
        $output['id'] = $kodetampil;
        $output['kode'] = $kode;
        $output['jumlah'] = $jumlah;
        $output['cek_tahun_bulan'] = $cek_tahun_bulan;
        $this->output->set_content_type('js');
        $this->output->set_output(json_encode($output));
    }

    public function getCodeKeluarga(){
        $id         = $this->input->post('id');
        $bulan      = $this->input->post('bulan');
        $tahun      = $this->input->post('tahun');
        $id_menu = 2;
        $id_kategori_keanggotaan = 1; // pengunjung
        $get = $this->db->select('a.*, b.nama as kode_kategori')
                    ->join('kategori_keanggotaan b', 'b.id = a.id_kategori')
                    ->get_where('kode a', ['a.status' => 1, 'b.id' => $id_kategori_keanggotaan])
                    ->row_array();
        $jumlah = $get['jumlah'];
        
        $cek_tahun_bulan = $this->db->get_where('profile', ['kode_tahun_bulan' => $tahun.$bulan])->row_array();
        if($cek_tahun_bulan == null){
            $kode = 1;
        }else{
            $this->db->select('RIGHT(profile.kode,'.$jumlah.') as id', FALSE);
            $this->db->where('kode_tahun_bulan',$tahun.$bulan);
            $this->db->order_by('id','DESC');
            $this->db->limit(1);    
            $query = $this->db->get('profile');  //cek dulu apakah ada sudah ada kode di tabel.    
            if($query->num_rows() <> 0){      
               $data = $query->row();      
               $kode = intval($data->id) + 1; 
            }
            else{      
               $kode = 1; 
            }
        }

        $batas = str_pad($kode, $jumlah, "0", STR_PAD_LEFT);    
        
        if($bulan == null){
            $bulan = "";
        }

        if($tahun == null){
            $tahun = "";
        }

        $kodetampil = $get['kode']."-".$tahun.$bulan."-".$batas;
          
        $output['id'] = $kodetampil;
        $this->output->set_content_type('js');
        $this->output->set_output(json_encode($output));
    }

    public function getCodeDataFormal(){
        $id = $this->input->post('id');
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');
        $cek = $this->db->get_where('data_formal a', ['id' => $id])->row_array();
        if($cek != null){
            $kode = $cek['kode'];
        }else{
            $id_menu = 82;
            $id_kategori = 11; // pengunjung
            $get = $this->db->select('a.*, b.nama as kode_kategori')
                        ->join('kategori_p2pk b', 'b.id = a.id_kategori')
                        ->get_where('kode a', ['a.status' => 1, 'b.id' => $id_kategori])
                        ->row_array();
            $jumlah = $get['jumlah'];

            $cek_tahun_bulan = $this->db->get_where('data_formal', ['kode_tahun_bulan' => $tahun.$bulan])->row_array();
            if($cek_tahun_bulan == null){
                $kode = 1;
            }else{
                $this->db->select('RIGHT(data_formal.kode,'.$jumlah.') as id', FALSE);
                $this->db->order_by('id','DESC');
                $this->db->where('kode_tahun_bulan',$tahun.$bulan);
                $this->db->limit(1);    
                $query = $this->db->get('data_formal');  //cek dulu apakah ada sudah ada kode di tabel.    
                if($query->num_rows() <> 0){      
                   $data = $query->row();      
                   $kode = intval($data->id) + 1; 
                }
                else{      
                   $kode = 1; 
                }
            }    
        }
        $batas = str_pad($kode, $jumlah, "0", STR_PAD_LEFT);    
        
        if($bulan == null){
            $bulan = "";
        }

        if($tahun == null){
            $tahun = "";
        }
        // $kodetampil = $get['kode']."-".$tahun.$bulan."-".$batas.$get['kode_kategori'];
        $kodetampil = $get['kode']."-".$tahun.$bulan."-".$batas;
          
        $output['id'] = $kodetampil;
        $output['kode'] = $kode;
        $output['jumlah'] = $jumlah;
        $output['cek_tahun_bulan'] = $cek_tahun_bulan;
        $this->output->set_content_type('js');
        $this->output->set_output(json_encode($output));
    }

    public function index()
    {
        $akses = ['Super Admin', 'Admin Staff', 'Partner L1', 'Partner L2'];
        $get_lv = $this->session->userdata('data')['level'];

        if (!in_array($get_lv, $akses)) {
            redirect('my404', 'refresh');
        }
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Users', 'Data Member'];
        $this->plugins = ['datatables', 'select2', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Users';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = $this->getMenuTitle();
        $this->breadcrumb_3_url = base_url() . 'pengaturan/profile';

        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $this->data['idpart'] = $idpart;
        $this->data['membership'] = $this->model->listmembership();
        $this->data['peristiwa'] = $this->model->listperistiwa();
        $this->data['jenisalamat'] = $this->model->listjenisalamat();
        $this->data['jenisgelar'] = $this->model->listjenisgelar();
        $this->data['tipekontak'] = $this->model->listtipekontak();
        $this->data['atasanmember'] = $this->model->listatasanmember();
        $filter = [
            'partner' => $idpart == null ? '' : ($idpart != 0 ? $idpart : '')
        ];
        $this->data['partner'] = $this->model->getPathner($filter);
        $this->data['level'] = $this->model->getLevel();

        $this->data['membership'] = $this->db->join('membership b', 'b.id_profile = a.id')->get_where('profile a', ['b.id_jenis_membership' => 1, 'a.status' => 1])->num_rows();
        
        $this->data['level_partner_level_1'] = $this->db->join('users b', 'b.user_id = a.id_user')->join('role_users c', 'c.role_user_id = b.user_id')->get_where('profile a', ['c.role_lev_id' => 125, 'a.status' => 1])->num_rows();

        $this->data['level_partner_level_2'] = $this->db->join('users b', 'b.user_id = a.id_user')->join('role_users c', 'c.role_user_id = b.user_id')->get_where('profile a', ['c.role_lev_id' => 126, 'a.status' => 1])->num_rows();

        $this->data['level_partner_level_reader'] = $this->db->join('users b', 'b.user_id = a.id_user')->join('role_users c', 'c.role_user_id = b.user_id')->get_where('profile a', ['c.role_lev_id' => 123, 'a.status' => 1])->num_rows();

        $this->data['pria'] = $this->db->get_where('profile a', ['jenis_kelamin' => 1, 'a.status' => 1])->num_rows();
        $this->data['wanita'] = $this->db->get_where('profile a', ['jenis_kelamin' => 2, 'a.status' => 1])->num_rows();

        $partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
        $this->data['partner_alias'] = $partner_alias['nama'];

        $kategori_keanggotaan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 128])->row_array();
        $this->data['kategori_keanggotaan_alias'] = $kategori_keanggotaan_alias['nama'];

        $kategorial_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 126])->row_array();
        $this->data['kategorial_alias'] = $kategorial_alias['nama'];

        $membership_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 102])->row_array();
        $this->data['membership_alias'] = $membership_alias['nama'];

        $data_formal = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 109])->row_array();
        $this->data['data_formal_alias'] = $data_formal['nama'];

        $wilayah_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 127])->row_array();
        $this->data['wilayah_alias'] = $wilayah_alias['nama'];

        $jabatan_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 132])->row_array();
        $this->data['jabatan_alias'] = $jabatan_alias['nama'];


        $get_lv = $this->session->userdata('data')['level'];
        if ($get_lv == 'Partner L2') {
            $this->content      = 'pengaturan/profile/list';
        } else {
            // content
            $this->content      = 'pengaturan/profile/list';
        }

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

        $partner = $this->input->post('partner');
        $posisi = $this->input->post('posisi');
        $kategorial = $this->input->post('kategorial');
        $wilayah = $this->input->post('wilayah');
        $keanggotaan = $this->input->post('keanggotaan');
        $usia = $this->input->post('usia');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $level = $this->input->post('level');
        $ulang_tahun = $this->input->post('ulang_tahun');
        $filter = [
            'partner' => $partner,
            'posisi' => $posisi,
            'kategorial' => $kategorial,
            'wilayah' => $wilayah,
            'keanggotaan' => $keanggotaan,
            'usia' => $usia,
            'jenis_kelamin' => $jenis_kelamin,
            'level' => $level,
            'ulang_tahun' => $ulang_tahun,
        ];

        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->select("a.id_partner, b.id as profile")
            ->from('users a')
            ->join('profile b', 'a.user_id = b.id_user', 'left')
            ->where('user_id', $part)
            ->get()->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $idpro = $cek_part[0]['profile'];
        $this->data['idpart'] = $idpart;

        $data = $this->model->getAllData($draw, $length, $start, $_cari, $order, $filter)->result_array();
        $n = 0;
        foreach ($data as $key) {
            $data[$n] += ["part_login" => $idpart, "lv_login" => $this->session->userdata('data')['id'], "id_log" => $idpro];
            $n++;
        }
        $count = $this->model->getAllData(null, null, null, $_cari, $order, null, $filter)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function ajax_select_list_partner()
    {
        $return = $this->model->list_partner();
        $this->output_json($return);
    }

    public function ajax_select_list_posisi()
    {
        $return = $this->model->list_posisi();
        $this->output_json($return);
    }

    public function ajax_select_list_atasan()
    {
        $id_level = $this->input->post('id_level');
        $return = $this->model->list_atasan($id_level);
        $this->output_json($return);
    }
    

    public function export_excel()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];

        $filter = [
            'partner' => $this->input->get("filter-partner"),
            'posisi' => $this->input->get("filter-posisi"),
            'kategorial' => $this->input->get("filter-kategorial"),
            'wilayah' => $this->input->get("filter-wilayah"),
            'keanggotaan' => $this->input->get("filter-keanggotaan"),
            'jenis_kelamin' => null,
            'level' => null,
            'usia' => null,
            'ulang_tahun' => null
        ];  

        $partner = $this->db->get_where('partner', ['id' => $filter['partner']])->result_array();
        $partner != null ? $partner = ' - ' . $partner[0]['nama'] : $partner = '';
        $details = $this->model->getAllData(null, null, null, null, $order, $filter)->result_array();
        $bulan_array = [
            1 => 'Januari',
            2 => 'February',
            3 => 'Maret',
            4 => 'April',
            5 => 'Mei',
            6 => 'Juni',
            7 => 'Juli',
            8 => 'Agustus',
            9 => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember',
        ];
        $today_m = (int)Date("m");
        $today_d = (int)Date("d");
        $today_y = (int)Date("Y");

        $last_date_of_this_month =  date('t', strtotime(date("Y-m-d")));

        $date = $today_d . " " . $bulan_array[$today_m] . " " . $today_y;

        // laporan baru
        $row = 1;
        $col_start = "A";
        $col_end = "T";
        $title_excel = "AuditAny_Users_" . str_replace(" ", "_", $this->getMenuTitle());
        // Header excel ================================================================================================
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Dokumen Properti
        $spreadsheet->getProperties()
            ->setCreator("Audit System End to End")
            ->setLastModifiedBy("Administrator")
            ->setTitle($title_excel)
            ->setSubject("Administrator")
            ->setDescription("List Profile $date")
            ->setKeywords("Laporan, Report")
            ->setCategory("Laporan, Report");
        // set default font
        $spreadsheet->getDefaultStyle()->getFont()->setName('Calibri');
        $spreadsheet->getDefaultStyle()->getFont()->setSize(11);


        // header 2 ====================================================================================================
        $row += 1;
        $sheet->mergeCells($col_start . $row . ":" . $col_end . $row)
            ->setCellValue("A$row", "Data " . $this->getMenuTitle() . $partner);
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray([
            "font" => [
                "bold" => true,
                "size" => 13
            ],
            "alignment" => [
                "horizontal" => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        // Tabel =======================================================================================================
        // Tabel Header
        $row += 2;
        $styleArray = [
            'font' => [
                'bold' => true,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'rgb' => '93C5FD',
                ]
            ],
        ];
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray($styleArray);
        $row++;
        $styleArray['fill']['startColor']['rgb'] = 'E5E7EB';
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray($styleArray);

        // poin-poin header disini
        $headers = [
            'No',
            'Level',
            'Partner',
            'Posisi',
            'Kategori Keanggotaan',
            'NIK',
            'Email',
            'Nama Depan',
            'Nama Belakang',
            'Jenis Kelamin',
            'Membership',
            'Atasan',
            'Tipe Kontak',
            'Kontak',
            'Alamat',
            'Peristiwa',
            'Pendidikan',
            'Kategorial Umur',
            'Wilayah',
            'Tanggal',
        ];

        // apply header
        for ($i = 0; $i < count($headers); $i++) {
            $sheet->setCellValue(chr(65 + $i) . ($row - 1), $headers[$i]);
            $sheet->setCellValue(chr(65 + $i) . $row, ($i + 1));
        }

        // tabel body
        $styleArray = [
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => '000000'],
                ],
            ],
            "alignment" => [
                'wrapText' => TRUE,
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP
            ]
        ];
        $start_tabel = $row + 1;
        foreach ($details as $detail) {
            $c = 0;
            $row++;
            $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
            $tanggal = date("d-m-Y", strtotime($tanggal));
            $sheet->setCellValue(chr(65 + $c) . "$row", ($row - 5));
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['lev_nama']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_partner']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_posisi']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['keanggotaan']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nik']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['email']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_depan']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_belakang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['jk']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['membership']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['atasan']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['tipe_contact_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['contact_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['alamat_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['peristiwa_formal']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['gelar_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['kategorial_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['wilayah_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row",  $tanggal);
        }
        // format
        // nomor center
        $sheet->getStyle($col_start . $start_tabel . ":" . $col_start . $row)
            ->getAlignment()
            ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        // border all data
        $sheet->getStyle($col_start . $start_tabel . ":" . $col_end . $row)
            ->applyFromArray($styleArray);

        // $code_rm = '_-[$RM-ms-MY]* #.##0,00_-;-[$RM-ms-MY]* #.##0,00_-;_-[$RM-ms-MY]* "-"??_-;_-@_-';
        // $sheet->getStyle("F" . $start_tabel . ":" . $col_end . $row)->getNumberFormat()->setFormatCode($code_rm);

        // $sheet->getStyle("F" . $start_tabel . ":" . $col_end . $row)->getNumberFormat()->setFormatCode($code_rm);

        // set alignment
        $sheet->getStyle("A" . $start_tabel . ":" . "A" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("B" . $start_tabel . ":" . "B" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("C" . $start_tabel . ":" . "C" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("C" . $start_tabel . ":D" . $row)
        //     ->getAlignment()
        //     ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);

        // footer
        // $row += 3;
        // $sheet->setCellValue("Q" . $row, "Kasui, $date");

        // $row += 3;
        // $sheet->setCellValue("Q" . $row, "(.....................................)");

        // function for width column
        function w($width)
        {
            return 0.71 + $width;
        }


        // set width column
        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);

        // set  printing area
        $spreadsheet->getActiveSheet()->getPageSetup()->setPrintArea($col_start . '1:' . $col_end . $row);
        $spreadsheet->getActiveSheet()->getPageSetup()
            ->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_PORTRAIT);
        $spreadsheet->getActiveSheet()->getPageSetup()
            ->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_A4);

        // margin
        $spreadsheet->getActiveSheet()->getPageMargins()->setTop(1);
        $spreadsheet->getActiveSheet()->getPageMargins()->setRight(0);
        $spreadsheet->getActiveSheet()->getPageMargins()->setLeft(0);
        $spreadsheet->getActiveSheet()->getPageMargins()->setBottom(0);

        // page center on
        $spreadsheet->getActiveSheet()->getPageSetup()->setHorizontalCentered(true);
        $spreadsheet->getActiveSheet()->getPageSetup()->setVerticalCentered(false);

        // $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        // $writer->save($title_excel);
        // header("Location: " . base_url($title_excel));
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);


        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $title_excel . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }

    public function downloadSample()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        $filter = [
            'partner' => $this->input->get("filter-partner")
        ];

        $partner = $this->db->get_where('partner', ['id' => $filter['partner']])->result_array();
        $part1 = $this->db->get('partner')->result_array();
        $partner != null ? $part = $partner[0]['nama'] : $part = $part1[0]['nama'];
        $details = ['0' => [
            'nik' => "999999999",
            'lev_nama' => "Reader",
            'email' => "dummy@gmail.com",
            'nama_depan' => "Dummy",
            'nama_belakang' => "-",
            'jk' => "Laki-laki",
            'nama_partner' => $part,
            'membership' => "Auditor",
            'atasan' => "Dummy",
            'tipe_contact_sekarang' => "HandPhone",
            'contact_sekarang' => "081352483646546",
            'jenis_alamat_sekarang' => "Domisili",
            'alamat_sekarang' => "Bandung",
            'peristiwa_formal' => "Tanggal Masuk",
            'tgl_formal' => date("Y-m-d"),
            'gelar_sekarang' => "Sarjana",
            'tanggal_gelar_sekarang' => date("Y-m-d"),
            'lembaga_gelar_sekarang' => "Kampus",
            'status_str' => "Aktif",
            'created_at' => date("Y-m-d"),
            'updated_at' => date("Y-m-d")
        ]];
        $bulan_array = [
            1 => 'Januari',
            2 => 'February',
            3 => 'Maret',
            4 => 'April',
            5 => 'Mei',
            6 => 'Juni',
            7 => 'Juli',
            8 => 'Agustus',
            9 => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember',
        ];
        $today_m = (int)Date("m");
        $today_d = (int)Date("d");
        $today_y = (int)Date("Y");

        $last_date_of_this_month =  date('t', strtotime(date("Y-m-d")));

        $date = $today_d . " " . $bulan_array[$today_m] . " " . $today_y;

        // laporan baru
        $row = 1;
        $col_start = "A";
        $col_end = "Q";
        $title_excel = "AuditAny_Users_" . str_replace(" ", "_", $this->getMenuTitle()) . "_Sample";
        // Header excel ================================================================================================
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Dokumen Properti
        $spreadsheet->getProperties()
            ->setCreator("Audit System End to End")
            ->setLastModifiedBy("Administrator")
            ->setTitle($title_excel)
            ->setSubject("Administrator")
            ->setDescription("List Users $date")
            ->setKeywords("Laporan, Report")
            ->setCategory("Laporan, Report");
        // set default font
        $spreadsheet->getDefaultStyle()->getFont()->setName('Calibri');
        $spreadsheet->getDefaultStyle()->getFont()->setSize(11);


        // header 2 ====================================================================================================
        $partner != null ? $partner = ' - ' . $partner[0]['nama'] : $partner = '';
        $row += 1;
        $sheet->mergeCells($col_start . $row . ":" . $col_end . $row)
            ->setCellValue("A$row", "List Users " . $partner);
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray([
            "font" => [
                "bold" => true,
                "size" => 13
            ],
            "alignment" => [
                "horizontal" => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        // Tabel =======================================================================================================
        // Tabel Header
        $row += 2;
        $styleArray = [
            'font' => [
                'bold' => true,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'rgb' => '93C5FD',
                ]
            ],
        ];
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray($styleArray);
        $row++;
        $styleArray['fill']['startColor']['rgb'] = 'E5E7EB';
        $sheet->getStyle($col_start . $row . ":" . $col_end . $row)->applyFromArray($styleArray);

        // poin-poin header disini
        $headers = [
            'No',
            'Level',
            'Partner',
            'NIK',
            'Email',
            'Nama Depan',
            'Nama Belakang',
            'Jenis Kelamin',
            'Tipe Kontak',
            'Kontak',
            'Jenis Alamat',
            'Alamat',
            'Jenis Peristiwa Formal',
            'Tanggal',
            'Gelar',
            'Tanggal Lulus',
            'Lembaga',
            // 'Tanggal',
        ];

        // apply header
        for ($i = 0; $i < count($headers); $i++) {
            $sheet->setCellValue(chr(65 + $i) . ($row - 1), $headers[$i]);
            $sheet->setCellValue(chr(65 + $i) . $row, ($i + 1));
        }

        // tabel body
        $styleArray = [
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => '000000'],
                ],
            ],
            "alignment" => [
                'wrapText' => TRUE,
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP
            ]
        ];
        $start_tabel = $row + 1;
        foreach ($details as $detail) {
            $c = 0;
            $row++;
            $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
            $tanggal = date("d-m-Y", strtotime($tanggal));
            $sheet->setCellValue(chr(65 + $c) . "$row", ($row - 5));
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['lev_nama']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_partner']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nik']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['email']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_depan']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama_belakang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['jk']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['tipe_contact_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['contact_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['jenis_alamat_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['alamat_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['peristiwa_formal']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['tgl_formal']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['gelar_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['tanggal_gelar_sekarang']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['lembaga_gelar_sekarang']);
            // $sheet->setCellValue(chr(65 + ++$c) . "$row",  $tanggal);
        }
        // format
        // nomor center
        $sheet->getStyle($col_start . $start_tabel . ":" . $col_start . $row)
            ->getAlignment()
            ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        // border all data
        $sheet->getStyle($col_start . $start_tabel . ":" . $col_end . $row)
            ->applyFromArray($styleArray);

        // $code_rm = '_-[$RM-ms-MY]* #.##0,00_-;-[$RM-ms-MY]* #.##0,00_-;_-[$RM-ms-MY]* "-"??_-;_-@_-';
        // $sheet->getStyle("F" . $start_tabel . ":" . $col_end . $row)->getNumberFormat()->setFormatCode($code_rm);

        // $sheet->getStyle("F" . $start_tabel . ":" . $col_end . $row)->getNumberFormat()->setFormatCode($code_rm);

        // set alignment
        $sheet->getStyle("A" . $start_tabel . ":" . "A" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("B" . $start_tabel . ":" . "B" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("C" . $start_tabel . ":" . "C" . $row)->getAlignment()->setHorizontal('center');
        // $sheet->getStyle("C" . $start_tabel . ":D" . $row)
        //     ->getAlignment()
        //     ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);

        // footer
        // $row += 3;
        // $sheet->setCellValue("Q" . $row, "Kasui, $date");

        // $row += 3;
        // $sheet->setCellValue("Q" . $row, "(.....................................)");

        // function for width column
        function wd($width)
        {
            return 0.71 + $width;
        }


        // set width column
        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
        // $spreadsheet->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);

        // set  printing area
        $spreadsheet->getActiveSheet()->getPageSetup()->setPrintArea($col_start . '1:' . $col_end . $row);
        $spreadsheet->getActiveSheet()->getPageSetup()
            ->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_PORTRAIT);
        $spreadsheet->getActiveSheet()->getPageSetup()
            ->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_A4);

        // margin
        $spreadsheet->getActiveSheet()->getPageMargins()->setTop(1);
        $spreadsheet->getActiveSheet()->getPageMargins()->setRight(0);
        $spreadsheet->getActiveSheet()->getPageMargins()->setLeft(0);
        $spreadsheet->getActiveSheet()->getPageMargins()->setBottom(0);

        // page center on
        $spreadsheet->getActiveSheet()->getPageSetup()->setHorizontalCentered(true);
        $spreadsheet->getActiveSheet()->getPageSetup()->setVerticalCentered(false);

        // $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        // $writer->save($title_excel);
        // header("Location: " . base_url($title_excel));
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);


        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $title_excel . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }

    public function export_pdf()
    {
        // title name
        $title_name = "List " . $this->getMenuTitle();

        // document name
        $doc_name = "AuditAny_Users_" . str_replace(" ", "_", $this->getMenuTitle());

        // set table header
        $headers = [
            'No',
            'Level',
            // 'Partner',
            'Posisi',
            'Keanggotaan',
            'NIK',
            'Email',
            'Nama Depan',
            'Nama Belakang',
            'Jenis Kelamin',
            'Membership',
            'Atasan',
            'Kontak',
            'Alamat',
            'Peristiwa',
            'Pendidikan',
            'Kategorial Umur',
            'Wilayah',
            // 'Tanggal',
        ];
        $thead_title = '';
        $thead_number = '';
        foreach ($headers as $i => $head) {
            $num = $i + 1;
            $thead_title .= "<th style=\"text-align:center;\">$head</th>";
            $thead_number .= "<th style=\"background-color:#E5E7EB; text-align:center; padding-top:2px; padding-bottom:2px;\">$num</th>";
        }
        $thead_title = "<tr>$thead_title</tr>";
        $thead_number = "<tr>$thead_number</tr>";
        // set body table
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        $filter = [
            'partner' => $this->input->get("filter-partner"),
            'posisi' => $this->input->get("filter-posisi"),
            'kategorial' => $this->input->get("filter-kategorial"),
            'wilayah' => $this->input->get("filter-wilayah"),
            'keanggotaan' => $this->input->get("filter-keanggotaan")
        ];

        $partnerGroup = $this->model->getPathner($filter);
        array_push($partnerGroup, ['id' => '-', 'text' => 'Belum ada partner']);

        // insert html
        $body_head = '<div style="text-align:center">';
        $build_html = "<h3>$title_name</h3>";
        foreach ($partnerGroup as $bypart) {

            $filters = [
                'partner' => $this->input->get("filter-partner"),
                'posisi' => $this->input->get("filter-posisi"),
                'kategorial' => $this->input->get("filter-kategorial"),
                'wilayah' => $this->input->get("filter-wilayah"),
                'keanggotaan' => $this->input->get("filter-keanggotaan"),
                'jenis_kelamin' => null,
                'level' => null,
                'usia' => null,
                'ulang_tahun' => null
            ];

            $details = $this->model->getAllData(null, null, null, null, $order, $filters)->result_array();
            $body_table = '';
            foreach ($details as $i => $detail) {
                $contact = $this->db->select('a.*, b.nama as tipe_contact')->from('contact a')->join('tipe_contact b', 'a.id_tipe_contact = b.id', 'left')->where('a.id_profile', $detail['id'])->where('a.status', 1)->order_by('a.created_at', 'desc')->limit(1)->get()->result_array();
                $alamat = $this->db->select('a.*, b.nama as jenis_alamat')->from('alamat a')->join('jenis_alamat b', 'a.id_jenis_alamat = b.id', 'left')->where('a.id_profile', $detail['id'])->where('a.status', 1)->order_by('a.tanggal_mulai', 'desc')->limit(1)->get()->result_array();
                $data_formal = $this->db->select('a.*, b.name as dtm_peristiwa')->from('data_formal a')->join('dtm_peristiwa b', 'a.dtm_peristiwa_id = b.id', 'left')->where('a.id_profile', $detail['id'])->where('a.status', 1)->order_by('a.tanggal_data_formal', 'desc')->limit(1)->get()->result_array();
                $gelar = $this->db->select('a.*, b.nama as jenis_gelar')->from('gelar a')->join('jenis_gelar b', 'a.id_jenis_gelar = b.id', 'left')->where('a.id_profile', $detail['id'])->where('a.status', 1)->order_by('a.tanggal_lulus', 'desc')->limit(1)->get()->result_array();

                if (empty($contact)) {
                    $vcontact = '<td></td>';
                } else {
                    $vcontact = "<td>{$contact[0]['tipe_contact']} : {$contact[0]['keterangan']}</td>";
                }

                if (empty($alamat)) {
                    $valamat = '<td></td>';
                } else {
                    $valamat = "<td>{$alamat[0]['jenis_alamat']} : {$alamat[0]['alamat']}, {$alamat[0]['domisili']}</td>";
                }

                if (empty($data_formal)) {
                    $vdata_formal = '<td></td>';
                } else {
                    $vdata_formal = "<td>{$data_formal[0]['dtm_peristiwa']} : {$data_formal[0]['keterangan']}, {$data_formal[0]['tempat']}," . date("d-m-Y", strtotime($data_formal[0]['tanggal_data_formal'])) . "</td>";
                }

                if (empty($gelar)) {
                    $vgelar = '<td></td>';
                } else {
                    $vgelar = "<td>{$gelar[0]['jenis_gelar']} tahun " . date("d-m-Y", strtotime($gelar[0]['tanggal_lulus'])) . " dari {$gelar[0]['lembaga']}</td>";
                }

                $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
                $tanggal = date("d-m-Y", strtotime($tanggal));
                $num = $i + 1;
                $body_table .= '<tr>';
                $body_table .= "<td style=\"text-align:center\">{$num}</td>";
                $body_table .= "<td>{$detail['lev_nama']}</td>";
                // $body_table .= "<td>{$detail['nama_partner']}</td>";
                $body_table .= "<td>{$detail['nama_posisi']}</td>";
                $body_table .= "<td>{$detail['keanggotaan']}</td>";
                $body_table .= "<td>{$detail['nik']}</td>";
                $body_table .= "<td>{$detail['email']}</td>";
                $body_table .= "<td>{$detail['nama_depan']}</td>";
                $body_table .= "<td>{$detail['nama_belakang']}</td>";
                $body_table .= "<td>{$detail['jk']}</td>";
                $body_table .= "<td>{$detail['membership']}</td>";
                $body_table .= "<td>{$detail['atasan']}</td>";
                $body_table .= $vcontact;
                $body_table .= $valamat;
                $body_table .= $vdata_formal;
                $body_table .= $vgelar;
                $body_table .= "<td>{$detail['kategorial_sekarang']}</td>";
                $body_table .= "<td>{$detail['wilayah_sekarang']}</td>";
                // $body_table .= "<td>{$tanggal}</td>";
                $body_table .= '</tr>';
            }

            $build_html .= '<h4 style="text-align:left">Partner : ' . $bypart['text'] . '</h4>';
            $build_html .= "<table>
        $thead_title
        $thead_number
        $body_table
        </table>
        ";
        }
        $footer = '</div>';

            $this->create_pdf([
            'html' => $body_head . $build_html . $footer,
            'doc_name' => $doc_name,
            'orientation' => 'landscape',
            'paper_size' => 'A2'
        ]);
    }

    public function import_excel()
    {

        // Fungsi upload file
        $fileName = $_FILES['file']['name'];
        $config['upload_path'] = './assets/'; //path upload
        $config['file_name'] = $fileName;  // nama file
        $config['allowed_types'] = 'xls|xlsx'; //tipe file yang diperbolehkan
        $config['max_size'] = 100000; // maksimal sizze

        $this->load->library('upload'); //meload librari upload
        $this->upload->initialize($config);

        $file_location = "";

        if (!$this->upload->do_upload('file')) {
            echo json_encode(['code' => 1, 'message' => $this->upload->display_errors()]);

            exit();
        } else {
            $file_location = array('upload_data' => $this->upload->data());
            $file_location = $file_location['upload_data']['full_path'];
        }

        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($file_location);
        // hapus file setelah digunakan
        unlink($file_location);
        $array_from_excel = $spreadsheet->getActiveSheet()->toArray();
        $num = 1;
        $no_resi1 = '';
        $error_message = '';
        $kode_penjualan = '';
        // var_dump($array_from_excel);
        // die;
        // get kode admin by session id_user

        $no_resi = [];
        $this->db->trans_start();
        foreach ($array_from_excel as $val) {
            if ($num > 5 && $val[16]) {

                $partner = $this->db->get_where('partner', "nama like '%$val[2]%'")->row_array();
                $tipe_contact = $this->db->get_where('tipe_contact', "nama like '%$val[8]%'")->row_array();
                $jenis_alamat = $this->db->get_where('jenis_alamat', "nama like '%$val[10]%'")->row_array();
                $dtm_peristiwa = $this->db->get_where('dtm_peristiwa', "name like '%$val[12]%'")->row_array();
                $jenis_gelar = $this->db->get_where('jenis_gelar', "nama like '%$val[14]%'")->row_array();
                $level = $this->db->get_where('level', "lev_nama like '%$val[1]%'")->row_array();

                if ($partner == null) {
                    $partner = ['id' => 0];
                }

                if ($tipe_contact == null) {
                    $tipe_contact = ['id' => 0];
                }

                if ($dtm_peristiwa == null) {
                    $dtm_peristiwa = ['id' => NULL];
                }

                if ($jenis_gelar == null) {
                    $jenis_gelar = ['id' => 0];
                }

                if ($jenis_alamat == null) {
                    $jenis_alamat = ['id' => 0];
                }

                if ($level == null) {
                    $level = ['lev_id' => 123];
                }

                $tbh = $this->db->insert('users', [
                    "id_partner"   => $partner['id'],
                    "nik"   => $val[3] == "" ? NULL : $val[3],
                    "user_nama"  => $val[5] == "" ? NULL : $val[5],
                    "user_email"  => $val[4] == "" ? NULL : $val[4],
                    "user_email_status"  => 0,
                    "user_phone"  => is_int($val[9]) == "" ? 0 : $val[9],
                    "user_password"  => $this->b_password->bcrypt_hash('123456'),
                    "user_status"         => 1,
                    "created_at"    => date("Y-m-d H:i:s")
                ]);
                $id_user = $this->db->insert_id();

                $tbh = $this->db->insert('role_users', [
                    "role_user_id "   => $id_user,
                    "role_lev_id"   => $level['lev_id']
                ]);

                // for jenis kelamin
                if ($val[7] == "") {
                    $jk = "";
                } else if ($val[7] == "Laki-laki") {
                    $jk = 1;
                } else if ($val[7] == "Perempuan") {
                    $jk = 2;
                } else {
                    $jk = "";
                }

                $val_jk = $val[7];


                $tbh = $this->db->insert('profile', [
                    "id_user "   => $id_user,
                    "nama_depan"   => $val[5] == "" ? NULL : $val[5],
                    "nama_belakang"  => $val[6] == "" ? NULL : $val[6],
                    "jenis_kelamin"  => $jk,
                    "status"         => 1,
                    "created_at"    => date("Y-m-d")
                ]);
                $id_profile = $this->db->insert_id();

                


                // if ($val[8] != null) {
                //     $membership = $this->db->get_where('jenis_membership', "nama like '%$val[8]%'")->row_array();
                //     if ($membership != null) {
                //         $tbh = $this->db->insert('membership', [
                //             "id_profile "   => $id_profile,
                //             "id_jenis_membership "  => $membership['id'],
                //             'id_approver' => $this->session->userdata('data')['id'],
                //             "tanggal_anggota"    => date("Y-m-d"),
                //             "status"         => 1,
                //             "created_at"    => date("Y-m-d")
                //         ]);
                //         $id_membership = $this->db->insert_id();

                //         if ($val[9] != null) {
                //             $atasan = $this->db->get_where('profile', ["concat(nama_depan, ' ',nama_belakang) like '%$val[9]%'"])->row_array();
                //             if ($atasan != null) {
                //                 $tbh = $this->db->insert('membership_atasan', [
                //                     "id_profile "   => $id_profile,
                //                     "id_membership"   => $id_membership,
                //                     "id_profile_atasan"  => $atasan['id'],
                //                     "status"         => 1,
                //                     "created_at"    => date("Y-m-d")
                //                 ]);
                //             }
                //         }
                //     }
                // }

                $tbh = $this->db->insert('contact', [
                    "id_profile  "   => $id_profile,
                    "id_tipe_contact"   => $tipe_contact['id'],
                    "keterangan"  => $val[9] == "" ? NULL : $val[9],
                    "status"         => 1,
                    "created_at"    => date("Y-m-d")
                ]);

                $tbh = $this->db->insert('alamat', [
                    "id_profile  "   => $id_profile,
                    "id_jenis_alamat"   => $jenis_alamat['id'],
                    "alamat"  => $val[11] == "" ? NULL : $val[11],
                    "domisili"  => "-",
                    "tanggal_mulai"  => null,
                    "tanggal_selesai"  => null,
                    "status"         => 1,
                    "created_at"    => date("Y-m-d")
                ]);

                $tbh = $this->db->insert('data_formal', [
                    "id_profile  "   => $id_profile,
                    "dtm_peristiwa_id"   => $dtm_peristiwa['id'],
                    "tanggal_data_formal"   => $val[13] == "" ? NULL : $val[13],
                    "status"         => 1,
                    "created_at"    => date("Y-m-d")
                ]);

                $tbh = $this->db->insert('gelar', [
                    "id_profile  "   => $id_profile,
                    "id_jenis_gelar"   => $jenis_gelar['id'],
                    "tanggal_lulus"  => $val[15] == "" ? NULL : $val[15],
                    "lembaga"  => $val[16] == "" ? NULL : $val[16],
                    "status"         => 1,
                    "created_at"    => date("Y-m-d")
                ]);

                $modul = $this->getMenuTitle();
                $id = $this->db->insert_id();
                $by = $this->session->userdata('data')['id'];
                $jenis_perubahan = 1;
                if($jk == 1){
                    $jk = "Laki-laki";
                }else{
                    $jk = "Perempuan";
                }
                $data_lama = "Belum ada data";
                $data_baru = "Menambah data baru dengan menggunakan fitur Import dari Excel dengan isi nik = $val[3], nama $val[5], email = $val[4], no telpon = $val[9], jenis_kelamin $jk";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
            $num++;
        }


        // database transaction complete
        $this->db->trans_complete();
        $code = $tbh ? 200 : 500;
        $this->output_json(["data" => $tbh, "jk" => $val_jk], $code);
    }
    
    public function getContact()
    {
        $id = $this->input->post('id');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getContact($id, $order)->result_array();
        $count = $this->model->getContact($id, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function getContact1()
    {
        $idp = $this->input->post('idp');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getContact1($idp, $order)->result_array();
        $count = $this->model->getContact1($idp, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function getKeanggotaan()
    {
        $idp = $this->input->post('idp');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getKeanggotaan($idp, $order)->result_array();
        $count = $this->model->getKeanggotaan($idp, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function getAlamat()
    {
        $idp = $this->input->post('idp');
        $id = $this->input->post('id');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getAlamat($id, $idp, $order)->result_array();
        $count = $this->model->getAlamat($id, $idp, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function getFormal()
    {
        $idp = $this->input->post('idp');
        $id = $this->input->post('id');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getFormal($id, $idp, $order)->result_array();
        $count = $this->model->getFormal($id, $idp, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function getEducation()
    {
        $idp = $this->input->post('idp');
        $id = $this->input->post('id');
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $data = $this->model->getEducation($id, $idp, $order)->result_array();
        $count = $this->model->getEducation($id, $idp, $order)->num_rows();
        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'data' => $data]);
    }

    public function tambah($id = null)
    {
        $akses = ['Super Admin', 'Admin Staff', 'Partner L1', 'Partner L2'];
        $get_lv = $this->session->userdata('data')['level'];
        if (!in_array($get_lv, $akses)) {
            redirect('my404', 'refresh');
        }

       
        
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Users', 'Data Member'];
        $this->plugins = ['datatables', 'select2', 'masonry', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Users';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = $this->getMenuTitle();
        $this->breadcrumb_3_url = base_url() . 'pengaturan/profile/tambah';
        $this->data['isUbah'] = $id != null;

        // content
        $this->content      = 'pengaturan/profile/tambah';

        $ceknew = $this->model->cekNew($id);
        if ($ceknew == null) {
            redirect('/pengaturan/profile');
            return;
        }

        $partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
        $this->data['partner_alias'] = $partner_alias['nama'];

        $membership_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 102])->row_array();
        $this->data['membership_alias'] = $membership_alias['nama'];

        $data_formal = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 109])->row_array();
        $this->data['data_formal_alias'] = $data_formal['nama'];

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
        
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        if ($idpart == null || $idpart == 0 || $idpart == '-' || $this->session->userdata('data')['level'] == 'Super Admin') {
            $idprt = '';
            $stpart = 'kosong';
        } else {
            $idprt = '';
            $stpart = '';
        }
        $this->data['idpart'] = $idpart;
        $this->data['stpart'] = $stpart;

        $this->data['pilihanKeaktifan'] = $this->db->get_where('keaktifan_pilihan',['status' => 1])->result_array();
        $this->data['membership'] = $this->model->listmembership();
        $this->data['peristiwa'] = $this->model->listperistiwa();
        $this->data['institusi'] = $this->db->get_where('institusi',['status' => 1])->result_array();
        $this->data['isiJabatan'] = $this->db->select('a.nama_depan, a.nama_belakang, a.id')->join('membership b', 'b.id_profile = a.id')->get_where('profile a',['b.id_jenis_membership ' => 1, 'b.status' => 1])->result_array();
        $this->data['jenisalamat'] = $this->model->listjenisalamat();
        $this->data['jenisgelar'] = $this->model->listjenisgelar();
        $this->data['tipekontak'] = $this->model->listtipekontak();
        $this->data['kategorial'] = $this->model->list_kategorial();
        $this->data['kategori_keanggotaan'] = $this->model->list_kategori_keanggotaan();
        $this->data['wilayah'] = $this->model->list_wilayah();
        $this->data['atasanmember'] = $this->model->listatasanmember($idprt);
        $this->data['getID'] = $ceknew['id'];
        // $this->data['contact'] = $this->model->getContact($ceknew['id'])->result_array();
        $this->data['profile'] = $ceknew;
        $this->data['isUbah'] = $id != null;
        $this->data['partner'] = $this->model->getPathner();
        $this->data['level'] = $this->model->getLevel();
        $this->data['posisi'] = $this->model->getPosisi();

        $get_calon_suami = $this->model->getCalonSuami($id);

        if($get_calon_suami != null){
            $this->data['get_calon_suami'] = $get_calon_suami;
            $this->data['get_calon_istri'] = $this->model->getCalonIstri($get_calon_suami['keluarga']);
        }else{
            $this->data['get_calon_suami'] = $this->model->getCalonIstri($ceknew['id_partner']);
            $this->data['get_calon_istri'] = $this->model->getCalonSuamiTambah($ceknew['id_partner']);
        }

        // Send data to view
        $this->render();
    }

    public function lihat()
    {
        $id_user = $this->session->userdata('data')['id'];
        $id = $this->db->get_where('profile', ['id_user' => $id_user])->result_array();
        if ($id != null) {
            $id = $id[0]['id'];
        } else {
            $q = $this->db->insert('profile', [
                'id_user' => $id_user,
                'status' => 1
            ]);
            $id = $this->db->insert_id();
        }
        // Page Settings
        $this->title = "Profil Pengguna";
        $this->navigation = ['Profile'];
        $this->plugins = ['datatables', 'select2', 'masonry', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Lihat Profil';
        $this->breadcrumb_2_url = base_url() . 'pengaturan/profile/lihat';
        $this->data['isUbah'] = $id != null;
        $this->data['isLihat'] = $id != null;

        // content
        $this->content      = 'pengaturan/profile/lihat';

        $ceknew = $this->model->cekNew($id);
        if ($ceknew == null) {
            redirect('/pengaturan/profile');
            return;
        }

        $this->data['membership'] = $this->model->listmembership();
        $this->data['peristiwa'] = $this->model->listperistiwa();
        $this->data['jenisalamat'] = $this->model->listjenisalamat();
        $this->data['jenisgelar'] = $this->model->listjenisgelar();
        $this->data['tipekontak'] = $this->model->listtipekontak();
        $this->data['getID'] = $ceknew['id'];
        // $this->data['contact'] = $this->model->getContact($ceknew['id'])->result_array();
        $this->data['profile'] = $ceknew;
        $this->data['isUbah'] = $id != null;
        $this->data['isLihat'] = $id != null;
        $this->data['partner'] = $this->model->getPathner();
        $this->data['level'] = $this->model->getLevel();

        // Send data to view
        $this->render();
    }

    public function insert_contact()
    {
        $id             = $this->input->post("id_contact");
        $id_profile     = $this->input->post("id_profile");
        $tipe_kontak    = $this->input->post("tipe_kontak");
        $keterangan     = $this->input->post("keterangan_kontak");
        $tanggal        = $this->input->post("tanggal");
        $status         = $this->input->post("statusk");
        $result         = $this->model->insert_contact($id, $id_profile, $tipe_kontak, $keterangan, $tanggal, $status);
        $code           = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_contact()
    {
        $id = $this->input->post("id_contact");
        $tipe_kontak = $this->input->post("tipe_kontak");
        $keterangan = $this->input->post("keterangan_kontak");
        $tanggal = $this->input->post("tanggal");
        $status = $this->input->post("statusk");
        $result = $this->model->update_contact($id, $tipe_kontak, $keterangan, $tanggal, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_kategorial()
    {
        $id_kategorial = $this->input->post("kategorial");

        $id_profile = $this->input->post("id_profile");
        $tanggal = $this->input->post("tanggal");

        $cek = $this->db->get_where('profile_kategorial',['id_profile' => $id_profile])->result_array();
        foreach ($cek as $q) {
            if(strtotime($tanggal) > strtotime($q['tanggal'])){
                $status = 2;
                $upd2['status'] = $status;
                $this->db->where('id', $q['id']);
                $this->db->update('profile_kategorial', $upd2);
            }
        }
        $result = $this->model->insert_kategorial($id_kategorial, $id_profile, $tanggal);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_kategorial()
    {
        $id = $this->input->post("id_kategorial");
        $id_kategorial = $this->input->post("kategorial");
        $id_profile = $this->input->post("id_profile");
        $tanggal = $this->input->post("tanggal");
        $cek = $this->db->get_where('profile_kategorial',['id_profile' => $id_profile])->result_array();
        foreach ($cek as $q) {
            if(strtotime($tanggal) > strtotime($q['tanggal'])){
                $status = 2;
                $upd2['status'] = $status;
                $this->db->where('id', $q['id']);
                $this->db->update('profile_kategorial', $upd2);
            }
        }
        $result = $this->model->update_kategorial($id, $id_kategorial, $id_profile, $tanggal);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_kategori_keanggotaan()
    {
        $id_keanggotaan = $this->input->post("id_keanggotaan");

        $id_profile = $this->input->post("id_profile");
        $tanggal = $this->input->post("tanggal");
        $result = $this->model->insert_kategori_keanggotaan($id_keanggotaan, $id_profile, $tanggal);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function ubah_status_kategori_keanggotaan()
    {
        $id_profile_keanggotaan = $this->input->post("id_profile_keanggotaan");

        $id_profile = $this->input->post("idp");
        $status = $this->input->post("status");
        $result = $this->model->ubah_status_kategori_keanggotaan($id_profile_keanggotaan, $id_profile, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function ubah_status_formal()
    {
        $id_formal = $this->input->post("id_formal");

        $id_profile = $this->id_profile;
        $status = $this->input->post("status");
        $result = $this->model->ubah_status_formal($id_formal, $id_profile, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    

    public function update_kategori_keanggotaan()
    {
        $id = $this->input->post("id_profile_keanggotaan");
        $id_keanggotaan = $this->input->post("id_keanggotaan");
        $id_profile = $this->input->post("id_profile");
        $tanggal = $this->input->post("tanggal");
        $result = $this->model->update_kategori_keanggotaan($id, $id_keanggotaan, $tanggal, $id_profile);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_wilayah()
    {
        $id_wilayah = $this->input->post("wilayah");

        $id_profile = $this->input->post("id_profile");
        $tanggal = $this->input->post("tanggal");
        $status_wilayah = $this->input->post("status_wilayah");
        $result = $this->model->insert_wilayah($id_wilayah, $id_profile, $tanggal, $status_wilayah);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_wilayah()
    {
        $id = $this->input->post("id_wilayah");
        $id_profile = $this->input->post("id_profile");
        $id_wilayah = $this->input->post("wilayah");
        $tanggal = $this->input->post("tanggal");
        $status_wilayah = $this->input->post("status_wilayah");
        $result = $this->model->update_wilayah($id, $id_wilayah, $id_profile, $tanggal, $status_wilayah);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_keaktifan()
    {

        $id_jabatan = $this->input->post("id_jabatan");
        $id_profile = $this->input->post("id_profile");
        $tanggal_mulai = $this->input->post("tanggal_mulai");
        $tanggal_selesai = $this->input->post("tanggal_selesai");
        $kode_master = $this->input->post("kode_master");
        $id_master = $this->input->post("id_master");
        if($kode_master == "Pengarah"){
            $return = $this->db->get_where('pengarah',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Komisi"){
            $return = $this->db->get_where('komisi',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Wilayah"){
            $return = $this->db->get_where('wilayah',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Kepanitiaan"){
            $return = $this->db->get_where('kepanitiaan',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }else{
            $text_master = "";
        }
        $result = $this->model->insert_keaktifan($id_jabatan, $id_profile, $tanggal_mulai, $tanggal_selesai, $kode_master, $id_master, $text_master);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_keaktifan()
    {
        $id = $this->input->post("id_keaktifan");
        $id_jabatan = $this->input->post("id_jabatan");
        $id_profile = $this->input->post("id_profile");
        $tanggal_mulai = $this->input->post("tanggal_mulai");
        $tanggal_selesai = $this->input->post("tanggal_selesai");
        $kode_master = $this->input->post("kode_master");
        $id_master = $this->input->post("id_master");
        if($kode_master == "Pengarah"){
            $return = $this->db->get_where('pengarah',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Komisi"){
            $return = $this->db->get_where('komisi',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Wilayah"){
            $return = $this->db->get_where('wilayah',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }elseif($kode_master == "Kepanitiaan"){
            $return = $this->db->get_where('kepanitiaan',['id' => $id_master])->row_array();
            $text_master = $return['nama'];
        }else{
            $text_master = "";
        }
        $result = $this->model->update_keaktifan($id, $id_jabatan, $id_profile, $tanggal_mulai, $tanggal_selesai, $kode_master, $id_master, $text_master);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_alamat()
    {
        $id = $this->input->post("id_alamat");
        $id_profile = $this->input->post("id_profile");
        $jenis_alamat = $this->input->post("jenis_alamat");
        $alamat = $this->input->post("alamat");
        $domisili = $this->input->post("domisili");
        $tanggal_mulai = $this->input->post("tanggal_mulai");
        $tanggal_selesai = $this->input->post("tanggal_selesai");
        $status = $this->input->post("status");
        $result = $this->model->insert_alamat($id, $id_profile, $jenis_alamat, $alamat, $domisili, $tanggal_mulai, $tanggal_selesai, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_alamat()
    {
        $id = $this->input->post("id_alamat");
        $id_profile = $this->input->post("id_profile");
        $jenis_alamat = $this->input->post("jenis_alamat");
        $alamat = $this->input->post("alamat");
        $domisili = $this->input->post("domisili");
        $tanggal_mulai = $this->input->post("tanggal_mulai");
        $tanggal_selesai = $this->input->post("tanggal_selesai");
        $status = $this->input->post("status");
        $result = $this->model->update_alamat($id, $id_profile, $jenis_alamat, $alamat, $domisili, $tanggal_mulai, $tanggal_selesai, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function insert_formal()
    {
        $id = $this->input->post("id_formal");
        $kode = $this->input->post("kode_data_formal");
        $kode_tahun_bulan = date("Ym");
        $id_profile = $this->input->post("id_profile");
        $peristiwa_formal = $this->input->post("peristiwa_formal");
        $keterangan = $this->input->post("peristiwa_keterangan");
        $tempat = $this->input->post("tempat");
        $tanggal_data_formal = $this->input->post("tanggal_data_formal");
        
        $keterangan_2 = $this->input->post("keterangan_2");
        $rencana_tanggal = $this->input->post("rencana_tanggal");

        $id_profile_pasangan = $this->input->post("id_profile_pasangan");

        $id_institusi = $this->input->post("id_institusi");
        $idjabatan = $this->input->post("idjabatan");
        
        $status = $this->input->post("statusf");
        $result = $this->model->insert_formal($id, $kode, $kode_tahun_bulan, $id_profile, $peristiwa_formal, $tempat, $tanggal_data_formal, $status, $keterangan, $keterangan_2, $rencana_tanggal, $id_profile_pasangan, $id_institusi, $idjabatan);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_formal()
    {
        $id = $this->input->post("id_formal");
        $kode = $this->input->post("kode_data_formal");
        $kode_tahun_bulan = date("Ym");
        $id_profile = $this->input->post("id_profile");
        $peristiwa_formal = $this->input->post("peristiwa_formal");
        $keterangan = $this->input->post("peristiwa_keterangan");
        $tempat = $this->input->post("tempat");
        $tanggal_data_formal = $this->input->post("tanggal_data_formal");

        $keterangan_2 = $this->input->post("keterangan_2");
        $rencana_tanggal = $this->input->post("rencana_tanggal");

        $nama_calon_1 = $this->input->post("nama_calon_1");
        $tanggal_lahir_calon_1 = $this->input->post("tanggal_lahir_calon_1");

        $nama_calon_2 = $this->input->post("nama_calon_2");
        $tanggal_lahir_calon_2 = $this->input->post("tanggal_lahir_calon_2");

        $id_institusi = $this->input->post("id_institusi");
        $idjabatan = $this->input->post("idjabatan");

        $status = $this->input->post("statusf");
        $result = $this->model->update_formal($id, $kode, $kode_tahun_bulan, $id_profile, $peristiwa_formal, $tempat, $tanggal_data_formal, $status, $keterangan, $keterangan_2, $rencana_tanggal, $nama_calon_1, $tanggal_lahir_calon_1, $nama_calon_2, $tanggal_lahir_calon_2, $id_institusi, $idjabatan);
        $this->output_json(["data" => $result]);
    }

    public function insert_education()
    {
        $id = $this->input->post("id_education");
        $id_profile = $this->input->post("id_profile");
        $nama = $this->input->post("nama");
        $tanggal_lulus = $this->input->post("tanggal_lulus");
        $lembaga = $this->input->post("lembaga");
        $status = $this->input->post("statuse");
        $result = $this->model->insert_education($id, $id_profile, $nama, $tanggal_lulus, $lembaga, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update_education()
    {
        $id = $this->input->post("id_education");
        $id_profile = $this->input->post("id_profile");
        $nama = $this->input->post("nama");
        $tanggal_lulus = $this->input->post("tanggal_lulus");
        $lembaga = $this->input->post("lembaga");
        $status = $this->input->post("statuse");
        $result = $this->model->update_education($id, $id_profile, $nama, $tanggal_lulus, $lembaga, $status);
        $this->output_json(["data" => $result]);
    }

    public function hapusDaftar()
    {
        $id = $this->input->post("id");
        $tbl = $this->input->post("tbl");
        $result = $this->model->hapusDaftar($id, $tbl);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function ajax_select_list_membership()
    {
        $return = $this->model->listmembership();
        $this->output_json($return);
    }

    public function emailCheck()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('id_user', 'Id User', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $email = $this->input->post('email');
            $id_user = $this->input->post('id_user');
            $result = $this->model->emailCheck($email, $id_user);

            $code = $result == null ? 200 : 409;
            $status = $result == null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Email belum digunakan' : 'Email sudah terdaftar'
            ], $code);
        }
    }

    public function nikCheck()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('nik', 'nik', 'trim|required|numeric');
        $this->form_validation->set_rules('id_user', 'Id User', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $nik = $this->input->post('nik');
            $id_user = $this->input->post('id_user');
            $result = $this->model->nikCheck($nik, $id_user);

            $code = $result == null ? 200 : 409;
            $status = $result == null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Nik belum terdaftar' : 'Nik sudah terdaftar'
            ], $code);
        }
    }

    public function getMembership()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getMembership($draw, $length, $start, $_cari, $order)->result_array();
        $count = $this->model->getMembership(null, null, null, $_cari, $order, null)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getKontak()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getKontak($draw, $length, $start, $_cari, $order)->result_array();
        $count = $this->model->getKontak(null, null, null, $_cari, $order, null)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getKategorial()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');

        $id = $this->input->post('id');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getKategorial($draw, $length, $start, $_cari, $order, $id)->result_array();
        $count = $this->model->getKategorial(null, null, null, $_cari, $order, $id)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getKategoriKeanggotaan()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');

        $id_profile_keanggotaan = $this->input->post('id_profile_keanggotaan');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getKategoriKeanggotaan($draw, $length, $start, $_cari, $order, $id_profile_keanggotaan)->result_array();
        $count = $this->model->getKategoriKeanggotaan(null, null, null, $_cari, $order, $id_profile_keanggotaan)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getKeaktifan()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');
        $id = $this->input->post('id');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getKeaktifan($draw, $length, $start, $_cari, $order, $id)->result_array();
        $count = $this->model->getKeaktifan(null, null, null, $_cari, $order, $id)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function getWilayah()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');
        $order['profile']['id_profile'] = $this->input->post('idp');
        $id = $this->input->post('id');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $data = $this->model->getWilayah($draw, $length, $start, $_cari, $order, $id)->result_array();
        $count = $this->model->getWilayah(null, null, null, $_cari, $order, $id)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function membershipCheck()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('id_jenis', 'id Jenis Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('id_profile', 'Id Profile', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $id_jenis = $this->input->post('id_jenis');
            $id_profile = $this->input->post('id_profile');
            $result = $this->model->membershipCheck($id_jenis, $id_profile);

            $code = $result == null ? 200 : 409;
            $status = $result == null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ?   'Jenis membership belum terdaftar' : 'Jenis membership sudah terdaftar'
            ], $code);
        }
    }

    public function insert_membership()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        // $this->form_validation->set_rules('atasan', 'id Atasan Membership', 'trim|numeric');
        $this->form_validation->set_rules('membership_jenis', 'id Jenis Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('id_profile', 'Id Profile', 'trim|required|numeric');
        $this->form_validation->set_rules('membership_tanggal', 'Tanggal', 'trim|required');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $id_atasan = $this->input->post('atasan');
            $id_jenis = $this->input->post('membership_jenis');
            $id_profile = $this->input->post('id_profile');
            $tanggal = $this->input->post('membership_tanggal');
            $result = $this->model->insert_membership($id_jenis, $id_profile, $tanggal, $id_atasan);
            if ($id_jenis != 1) {
                if ($result) {
                    $get_email = $this->model->list_atasan($id_jenis);
                    // $get_email = $this->db->query("select b.user_email, f.lev_nama, d.nama as member from profile a join users b on a.id_user = b.user_id join membership c on a.id = c.id_profile join jenis_membership d on c.id_jenis_membership = d.id join role_users e on b.user_id = e.role_user_id join level f on e.role_lev_id = f.lev_id where (d.nama like '%BOD%' or d.nama like '%Manager%') and (f.lev_nama like '%Admin Staff%' or f.lev_nama like '%Partner L1%') and a.id = '$id_atasan'")->result_array();
                    foreach ($get_email as $email) {
                        $url = base_url() . 'pengaturan/profile';
                        $content = '<p>Terdapat pengajuan Membership baru di aplikasi Audit System End to End, diharapkan untuk segera konfirmasi pengajuan tersebut. Untuk melihat silahkan <a href="' . $url .
                            '">klik disini</a>.</p>';
                        // debug
                        if ($this->debug) {
                            return [
                                'url' => $url
                            ];
                        }
                        // production
                        $this->send_email($email['user_email'], $content, 'Approval Membership'); //dihide dulu
                    }
                }
            }
            $code = $result != null ? 200 : 400;
            $status = $result != null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Data berhasil ditambahkan' : 'Data gagal ditambahkan'
            ], $code);
        }
    }

    public function sendConfirmEmailNotifikasi($id, $email, $member)
    {
        $this->load->model('loginModel', 'login');
        $content = '<p>Anda telah dinonaktifkan sebagai member '.$member.' dalam Aplikasi Audit System End to End. Terimakasih';
        // production
        $this->send_email($email, $content, 'Member '.$member.' Dinonaktifkan'); //dihide dulu
        return (true);
    }

    public function update_membership()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        // $this->form_validation->set_rules('atasan', 'id Atasan Membership', 'trim|required|numeric');
        // $this->form_validation->set_rules('id_membership', 'id Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('membership_jenis', 'id Jenis Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('id_profile', 'Id Profile', 'trim|required|numeric');
        $this->form_validation->set_rules('membership_tanggal', 'Tanggal', 'trim|required');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $id = $this->input->post('id_membership_pengesah');
            $id_atasan = $this->input->post('atasan');
            $id_jenis = $this->input->post('membership_jenis');
            $id_profile = $this->input->post('id_profile');
            $tanggal = $this->input->post('membership_tanggal');
            $result = $this->model->update_membership($id, $id_jenis, $id_profile, $tanggal, $id_atasan);

            $code = $result != null ? 200 : 400;
            $status = $result != null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Data berhasil ditambahkan' : 'Data gagal ditambahkan'
            ], $code);
        }
    }

    public function set_st_membership()
    {
        $id_atasan = $this->input->post('id_atasan');
        $id_profile = $this->input->post('id_profile');
        $id_membership = $this->input->post('id_membership');
        $status = $this->input->post('status');
        $st = $status == 1 ? 'Disetujui' : 'Ditolak';
        $email = $this->db->query("select b.user_email from profile a join users b on a.id_user = b.user_id where a.id = '".$id_profile."'")->result_array();
        if(count($email) > 0){
            $email = $email[0]['user_email'];
        }else{
            $email = "";
        }

        $result = $this->model->set_st_membership($id_profile, $id_membership, $status, $id_atasan);
        if ($result) {

            $get = $this->db->select('d.nama as membership,c.user_email as email, b.id as profile_id')->join('profile b', 'b.id = a.id_profile')->join('users c', 'c.user_id = b.id_user')->join('jenis_membership d', 'd.id = a.id_jenis_membership')->get_where('membership a', ['a.id' => $id_membership])->row_array();
            $membership = $get['membership'];
            $email = $get['email'];

            // ke pembuat
            $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership.' </p>';
            $this->send_email($this->session->userdata('data')['email'], $content, 'Approval Membership'); //dihide dulu

            // ke yang didaftarkan
            $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil '.$st.' sebagai '.$membership.' </p>';
            $this->send_email($email, $content, 'Approval Membership'); //dihide dulu

            $judul = "Approval Membership";
            $keterangan = 'Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership;
            $ke = $get['profile_id'];
            $dari = $this->session->userdata('data')['id'];
            $send_notification = $this->sendNotification($judul, $keterangan, $ke, $dari);

            // ke approval
            $get = $this->db->select('d.nama as membership,c.user_email as email')->join('membership_atasan z', 'z.id_membership = a.id')->join('profile b', 'b.id = z.id_profile_atasan')->join('users c', 'c.user_id = b.id_user')->join('jenis_membership d', 'd.id = a.id_jenis_membership')->get_where('membership a', ['a.id' => $id_membership])->row_array();
            if($get != null){
                $membership = $get['membership'];
                $email_approval = $get['email'];
            }else{
                $membership = "";
                $email_approval = "";
            }

            $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil '.$st.'  sebagai '.$membership.'. Terimakasih </p>';
            $this->send_email($email_approval, $content, 'Approval Membership'); //dihide dulu
        }
        $code = $result != null ? 200 : 400;
        $st = $result != null;
        $this->output_json([
            'status' => $st,
            'length' => 1,
            'data' =>  $result,
            'message' => $st ? 'Data berhasil diubah' : 'Data gagal diubah'
        ], $code);
    }

    public function set_active_membersip()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('id_membership', 'id Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('st_membership', 'Status Membership', 'trim|required|numeric');
        $this->form_validation->set_rules('id_profile', 'Id Profile', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $id = $this->input->post('id_membership');
            $id_profile = $this->input->post('id_profile');
            $st_membership = $this->input->post('st_membership');
            $result = $this->model->set_active_membersip($id, $id_profile, $st_membership);

            $get = $this->db->select('d.nama as membership,c.user_email as email, b.id as profile_id')->join('profile b', 'b.id = a.id_profile')->join('users c', 'c.user_id = b.id_user')->join('jenis_membership d', 'd.id = a.id_jenis_membership')->get_where('membership a', ['a.id' => $id])->row_array();
            $membership = $get['membership'];
            $email = $get['email'];

            // ke yang didaftarkan
            $content = '<p>Membership dengan email: '.$email.' telah berhasil di non-aktifkan sebagai '.$membership.' </p>';
            $this->send_email($email, $content, 'Non-Aktif Membership'); //dihide dulu
            
            $judul = "Non-Aktif Membership";
            $keterangan = 'Membership dengan email: '.$email.' telah berhasil di non-aktifkan sebagai '.$membership;
            $ke = $get['profile_id'];
            $dari = $this->session->userdata('data')['id'];
            $send_notification = $this->sendNotification($judul, $keterangan, $ke, $dari); 


            $code = $result != null ? 200 : 400;
            $status = $result != null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Data berhasil diaktifkan' : 'Data gagal diaktifkan'
            ], $code);
        }
    }

    public function simpan()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('id', 'id Profile', 'trim|required|numeric');
        // $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        // $this->form_validation->set_rules('nik', 'NIK', 'trim|required|numeric');
        // $this->form_validation->set_rules('nama_depan', 'Nama Depan', 'trim|required');
        // $this->form_validation->set_rules('jk', 'Jenis Kelamin', 'trim|required');
        // $this->form_validation->set_rules('id', 'id Level', 'trim|required|numeric');
        // $this->form_validation->set_rules('current_email', 'Current Email', 'trim|required');
        // $this->form_validation->set_rules('tgl-verifikasi', 'Tanggal', 'trim|required');
        // $this->form_validation->set_rules('approved', 'Approved', 'trim|required');
        $this->form_validation->set_rules('nama_belakang', 'Nama Belakang', 'trim|required');
        // $this->form_validation->set_rules('id_partner', 'Partner', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $kode = $this->input->post('nik');
            $id = $this->input->post('id');
            $kode_keanggotaan = $this->input->post('kode_keanggotaan');
            if($kode_keanggotaan == null){
                $get_kode_keanggotaan = $this->db->order_by('no_urut','asc')->get_where('kategori_keanggotaan',['status' => 1])->row_array();
                $kode_keanggotaan = $get_kode_keanggotaan['nama'];
                $id_keanggotaan = $get_kode_keanggotaan['id'];

                $cek_profile_keanggotaan = $this->db->get_where('profile_keanggotaan', ['id_profile' => $id])->num_rows();
                if($cek_profile_keanggotaan < 1){
                    $save['id_profile'] = $id;
                    $save['id_kategori_keanggotaan'] = $id_keanggotaan;
                    $save['tanggal'] = date("Y-m-d");
                    $save['status'] = 1;
                    $save_keanggotaan = $this->db->insert('profile_keanggotaan', $save);
                }
            }
            $kategori = $this->input->post('id_kategori');
            if($kategori == null or $kategori == ""){
                $kategori = $id_keanggotaan;
            }
            $email = $this->input->post('email');
            $current_email = $this->input->post('current_email');
            $nik = $this->input->post('nik');
            $nama_depan = $this->input->post('nama_depan');
            $nama_belakang = $this->input->post('nama_belakang');
            $jk = $this->input->post('jk');
            $id_partner = $this->input->post('id_partner');
            $id_level = $this->input->post('id_level');
            $change_email = $email != $current_email;
            $id_kategorial = $this->input->post('id_kategorial');
            $id_wilayah = $this->input->post('id_wilayah');
            $id_posisi = $this->input->post('id_posisi');
            $flag = $this->input->post('flag');
            $tanggal_registrasi = $this->input->post('tanggal_registrasi');
            $tanggal_lahir = $this->input->post('tanggal_lahir');
            $tanggal_meninggal = $this->input->post('tanggal_meninggal');

            // $tgl = $this->input->post('tgl-verifikasi');
            // $approved = $this->input->post('approved');
            $result = $this->model->simpan(
                $id,
                $email,
                $nik,
                $nama_depan,
                $nama_belakang,
                $jk,
                $id_partner,
                $id_level,
                $change_email,
                $kode,
                $kode_keanggotaan,
                $kategori,
                $id_kategorial,
                $id_wilayah,
                $id_posisi,
                $flag,
                $tanggal_registrasi,
                $tanggal_lahir,
                $tanggal_meninggal
                // $tgl,
                // $approved,
            );

            // send email
            $user = $this->db->select('id_user, user_email_status')->from('profile')->join('users', 'profile.id_user = users.user_id')->where('id', $id)->get()->row_array();
            $send = $user == null ? 0 : $user['user_email_status'];
            if ($change_email || $send == 0) {
                $id_user = $user['id_user'];
                // $result = $this->sendConfirmEmail($id_user, $email);
                // // debug
                // if ($this->debug) {
                //     var_dump($result);
                //     die;
                // }
            }

            $code = $result != null ? 200 : 400;
            $status = $result != null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Data berhasil ditambahkan' : 'Data gagal ditambahkan'
            ], $code);
        }
    }
    
    private function sendConfirmEmailDelete($id, $email)
    {
        $this->load->model('loginModel', 'login');
        $content = '<p>Email anda telah dihapus dalam Aplikasi Audit System End to End. Terimakasih';
        // debug
        if ($this->debug) {
            return [
                'url' => $url
            ];
        }
        // production
        $this->send_email($email, $content, 'Hapus Akun Berhasil'); //dihide dulu
        return (true);
    }

    private function sendConfirmEmail($id, $email)
    {
        $this->load->model('loginModel', 'login');
        $token = $this->login->insertToken($id);
        $qstring = $this->base64url_encode($token);
        $url = base_url() . 'Login/konfirmasi_email?t=' . $qstring;
        $content = '<p>Anda telah dimasukan kedalam aplikasi Audit System End to End.  Harap Login kedalam aplikasi dengan akun:<br> Email: '.$email.'<br> Password: 123456<br> Untuk kofnirmasi silahkan <a href="' . $url .
            '">klik disini</a></p><br>Token berlaku selama satu hari, sampai jam 24:00 hari ini';
        // debug
        if ($this->debug) {
            return [
                'url' => $url
            ];
        }
        // production
        $this->send_email($email, $content, 'Konfirmasi Email'); //dihide dulu
        return (true);
    }

    public function sendEmailConfirm()
    {
        $return =  $this->sendConfirmEmail($this->input->post('id'), $this->input->post('email'));
        $this->output_json($return);
    }

    public function delete()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('id_profile', 'Id Profile', 'trim|required|numeric');
        $this->form_validation->set_rules('id_user', 'Id user', 'trim|required|numeric');
        if ($this->form_validation->run() == FALSE) {
            $this->output_json([
                'status' => false,
                'data' => null,
                'message' => validation_errors()
            ], 400);
        } else {
            $id_profile = $this->input->post('id_profile');
            $get_member = $this->db->join('users b', 'b.user_id = a.id_user')->get_where('profile a', ['a.id' => $id_profile])->row_array();
            $id_user = $this->input->post('id_user');
            $result = $this->model->delete($id_profile, $id_user);
            if($result){
                $result = $this->sendConfirmEmailDelete($id_user, $get_member['user_email']);
                // debug
                if ($this->debug) {
                    var_dump($result);
                    die;
                }
            }
            $code = $result != null ? 200 : 400;
            $status = $result != null;
            $this->output_json([
                'status' => $status,
                'length' => 1,
                'data' =>  $result,
                'message' => $status ? 'Data berhasil dihapus' : 'Data gagal dihapus'
            ], $code);
        }
    }

    public function set_active_persetujuan_membersip(){
        $id = $this->input->post('id');
        $data['status'] = 0;
        $set = $this->db->where('id', $id);
        $set = $this->db->update('membership', $data);
        $code = $set != null ? 200 : 400;
        $status = $set != null;

        $get = $this->db->select('d.nama as membership,c.user_email as email, b.id as profile_id')->join('profile b', 'b.id = a.id_profile')->join('users c', 'c.user_id = b.id_user')->join('jenis_membership d', 'd.id = a.id_jenis_membership')->get_where('membership a', ['a.id' => $id])->row_array();
        $membership = $get['membership'];
        $email = $get['email'];

        // ke pembuat
        $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership.' </p>';
        $this->send_email($this->session->userdata('data')['email'], $content, 'Pengajuan Membership'); //dihide dulu

        // ke yang didaftarkan
        $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership.' </p>';
        $this->send_email($email, $content, 'Pengajuan Membership'); //dihide dulu

        $judul = "Pengajuan Membership";
        $keterangan = 'Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership;
        $ke = $get['profile_id'];
        $dari = $this->session->userdata('data')['id'];
        $send_notification = $this->sendNotification($judul, $keterangan, $ke, $dari);

        // ke approval
        $get = $this->db->select('d.nama as membership,c.user_email as email, b.id as profile_id')->join('membership_atasan z', 'z.id_membership = a.id')->join('profile b', 'b.id = z.id_profile_atasan')->join('users c', 'c.user_id = b.id_user')->join('jenis_membership d', 'd.id = a.id_jenis_membership')->get_where('membership a', ['a.id' => $id])->row_array();
        if($get != null){
            $membership = $get['membership'];
            $email_approval = $get['email'];
            $ke = $get['profile_id'];
        }else{
            $ke = "";
            $membership = "";
            $email_approval = "";
        }
        

        $content = '<p>Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership.'. Harap cek aplikasi untuk menerima atau menolak ajuan membership tersebut di link dibawah ini.<br> 
            <a href="'.base_url().'pengaturan/profile/tambah/'.$ke.'">Klik Disini</a><br>Terimakasih </p>';
        $this->send_email($email_approval, $content, 'Pengajuan Membership'); //dihide dulu

        $judul = "Pengajuan Membership";
        $keterangan = 'Pengajuan membership dengan email: '.$email.' telah berhasil dimintakan persetujuan sebagai '.$membership;
        $dari = $this->session->userdata('data')['id'];
        $send_notification = $this->sendNotification($judul, $keterangan, $ke, $dari);
       

        $this->output_json([
            'status' => $status,
            'length' => 1,
            'message' => $status ? 'Data berhasil' : 'Data gagal'
        ], $code);
    }

    private function setActivityLog($modul = null, $by = null, $jenis_perubahan = null, $data_lama = null, $data_baru = null)
    {
        $data = [
            'modul' => $modul,
            'by' => $by,
            'jenis_perubahan' => $jenis_perubahan,
            'data_lama' => $data_lama,
            'data_baru' => $data_baru,
        ];
        $exe = $this->db->insert('activity_log', $data);
        return $exe;
    }

    public function sendNotification($judul, $keterangan, $ke, $dari){
        $data['dari'] = $dari;
        $data['ke'] = $ke;
        $data['judul'] = $judul;
        $data['keterangan'] = $keterangan;
        $data['status'] = 0;
        $data['created_at'] = date("Y-m-d h:i:s");
        $save = $this->db->insert('notifikasi', $data);
        return $save;
    }

    public function ajax_select_list_kategori()
    {
        $id_menu = 2;
        $return = $this->model->list_kategori($id_menu);
        $this->output_json($return);
    }

    public function getPeristiwaFormal(){
        $id = $this->input->post('id');
        $return = $this->db->get_where('dtm_peristiwa', ['id' => $id])->row_array();
        $this->output_json($return);
    }

    public function ajax_select_list_kategorial()
    {
        $return = $this->model->list_kategorial();
        $this->output_json($return);
    }

    public function ajax_select_list_wilayah()
    {
        $return = $this->model->list_wilayah();
        $this->output_json($return);
    }

    public function ajax_select_list_keanggotaan()
    {
        $return = $this->model->list_keanggotaan();
        $this->output_json($return);
    }

    public function ajax_select_list_jabatan()
    {
        $return = $this->model->list_jabatan();
        $this->output_json($return);
    }
    public function ajax_select_list_master()
    {
        $kode_master = $this->input->post('kode_master');
        if($kode_master == "Pengarah"){
            $return = $this->model->list_pengarah();
        }elseif($kode_master == "Komisi"){
            $return = $this->model->list_komisi();
        }elseif($kode_master == "Wilayah"){
            $return = $this->model->list_wilayah();
        }elseif($kode_master == "Kepanitiaan"){
            $return = $this->model->list_kepanitiaan();
        }else{
            $return = array();
        }

        $this->output_json($return);
    }

    

    public function cetakFormal($id=null)
    {
        // title name
        $result = $this->model->getDetailFormal($id);
        if($result != null){
            $get_peristiwa = $this->db->get_where('dtm_peristiwa', ['id' => $result['dtm_peristiwa_id']])->row_array();
            if($get_peristiwa != null){
                $peristiwa_kategori = $get_peristiwa['kategori'];                    
                $peristiwa_nama = $get_peristiwa['name'];                    
            }else{
                $peristiwa_kategori = null;
                $peristiwa_nama = null;
            }
            $this->load->model("data-master/PartnerModel", 'partner');
            $format = $this->partner->getFormatHeader();

            $title_name = $peristiwa_nama;

            $logo_1 = base_url('files/laporan-header/'.$format["logo_1"]);// Modify this part (your_img.png
            $type = pathinfo($logo_1, PATHINFO_EXTENSION);
            
            $logo_1 = file_get_contents($logo_1);
            $logo_1 = 'data:image/' . $type . ';base64,' . base64_encode($logo_1);

            $logo_2 = base_url('files/laporan-header/'.$format["logo_2"]);// Modify this part (your_img.png
            $type = pathinfo($logo_2, PATHINFO_EXTENSION);
            
            $logo_2 = file_get_contents($logo_2);
            $logo_2 = 'data:image/' . $type . ';base64,' . base64_encode($logo_2);

            $file_photo = base_url('files/data-formal/photo/'.$result['photo']);// Modify this part (your_img.png
            $type = pathinfo($file_photo, PATHINFO_EXTENSION);
            
            $file_photo = file_get_contents($file_photo);
            $file_photo = 'data:image/' . $type . ';base64,' . base64_encode($file_photo);
            
            if($peristiwa_kategori == 2){ //pernikahan
                $get_calon_suami = $this->model->getCalonSuami($result['id_profile']);
                if($get_calon_suami != null){
                    $id_posisi = $get_calon_suami['id_posisi'];  
                    $get_calon_istri = $this->model->getCalonIstri($get_calon_suami['keluarga']);
                    if($get_calon_istri != null){
                        $id_posisi = $get_calon_istri['id_posisi'];  
                    }else{
                        $id_posisi = null;
                        echo "<script>alert('Mohon maaf, posisi anda bukan Istri atau Calon Istri. Harap segera cek data anda ')</script>";
                    }
                }else{
                    $get_calon_suami = $this->model->getCalonSuamiAlias($result['id_profile']);
                    if($get_calon_suami == null){
                        $id_posisi = null;
                        echo "<script>alert('Mohon maaf, posisi anda bukan Suami atau Calon Suami. Harap segera cek data anda ')</script>";
                    }else{
                        $get_calon_istri = $this->model->getCalonIstriAlias($get_calon_suami['keluarga']);
                        if($get_calon_istri != null){
                            $id_posisi = $get_calon_istri['id_posisi'];  
                        }else{
                            $id_posisi = null;
                            echo "<script>alert('Mohon maaf, posisi anda bukan Istri atau Calon Istri. Harap segera cek data anda ')</script>";
                        }
                    }
                }
                

                // fungsi cetak
                $data_head = '
                    <table style="width: 100%; border: 0px; margin-top: -10px; background-color: transparent;">
                        <tr>
                            <td style="border-color: white; width: 100%;">
                                <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Nama</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$get_calon_suami["nama_depan"].' '.$get_calon_suami["nama_belakang"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Tanggal Lahir</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.date('d-m-Y', strtotime($get_calon_suami["tanggal_lahir"])).'</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <h5>Dengan</h5>
                    <table style="width: 100%; border: 0px; margin-top: -10px; background-color: transparent;">
                        <tr>
                            <td style="border-color: white; width: 100%;">
                                <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Nama</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$get_calon_istri["nama_depan"].' '.$get_calon_istri["nama_belakang"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Lahir</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.date('d-m-Y', strtotime($get_calon_istri["tanggal_lahir"])).'</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br>
                     <table style="width: 100%; border: 0px; margin-top: -10px; background-color: transparent;">
                        <tr>
                            <td style="border-color: white; width: 100%;">
                                <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Institusi</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["institusi"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Jabatan</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["nama_depan"].' '.$result["nama_belakang"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Catatan</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["keterangan"].' <br>'.$result["keterangan_2"].'</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br>                 
                    <img src="'.$file_photo.'" style="height: 80px; width: 80px; float: right;">       
                ';

            }else{ // pribadi
                $get_data_pribadi = $this->model->getDataPribadi($result['id_profile']);
                if($get_data_pribadi != null){
                    
                    //fungsi cetak
                    $data_head = '
                    <table style="width: 100%; border: 0px; margin-top: -10px; background-color: transparent;">
                        <tr>
                            <td style="border-color: white; width: 100%;">
                                <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Nama</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$get_data_pribadi["nama_depan"].' '.$get_data_pribadi["nama_belakang"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Tanggal Lahir</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.date('d-m-Y', strtotime($get_data_pribadi["tanggal_lahir"])).'</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br>
                     <table style="width: 100%; border: 0px; margin-top: -10px; background-color: transparent;">
                        <tr>
                            <td style="border-color: white; width: 100%;">
                                <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Institusi</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["institusi"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Jabatan</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["nama_depan"].' '.$result["nama_belakang"].'</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%; border-color: transparent; background-color: transparent;">Catatan</td>
                                        <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                        <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["keterangan"].' <br>'.$result["keterangan_2"].'</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br>                 
                    <img src="'.$file_photo.'" style="height: 80px; width: 80px; float: right;">       
                ';
                }else{
                    $id_posisi = null;
                }
            }
            

        }else{

        }


        

        
        // document name
        $doc_name = "AuditAny_Data_Master_" . str_replace(" ", "_", "Peristiwa Formal");

        // set table header

        $thead_title = '';
        $thead_number = '';

        // $thead_title = "<tr>
        //     <th style='width: 10%; text-align: center; font-size: 14px;'>Posisi</th>
        //     <th style='width: 16%; text-align: center; font-size: 14px;'>NIK</th>
        //     <th style='width: 14%; text-align: center; font-size: 14px;'>Kategori</th>
        //     <th style='width: 16%; text-align: center; font-size: 14px;'>Email</th>
        //     <th style='width: 16%; text-align: center; font-size: 14px;'>Nama</th>
        //     <th style='width: 10%; text-align: center; font-size: 14px;'>L/P</th>
        // </tr>";
        $thead_number = "<tr>$thead_number</tr>";
        // set body table
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        // $details = $this->model->getAllData(null, null, null, null, $order)->result_array();
        $body_table = '';
        // foreach ($detail as $i => $detail) {
        //     if($detail['jenis_kelamin'] == 1){
        //         $jk = 'L';
        //     }else{
        //         $jk = 'P';
        //     }
        //     $num = $i + 1;
        //     $body_table .= '<tr style="font-size: 10px;">';
        //         $body_table .= "<td style='text-align: center;'>{$detail['nama_posisi']}</td>";
        //         $body_table .= "<td style='width: 16%; text-align: center;'>{$detail['nik']}</td>";
        //         $body_table .= "<td style='text-align: center;'>{$detail['keanggotaan']}</td>";
        //         $body_table .= "<td style='width: 17%; text-align: left;'>{$detail['user_email']}</td>";
        //         $body_table .= "<td style='text-align: left;'>{$detail['nama_depan']} {$detail['nama_belakang']}</td>";
        //         $body_table .= "<td style='text-align: center;'>{$jk}</td>";
        //     $body_table .= '</tr>';
        // }

        


        // insert html
        $page_header = '
            <div style="margin-left: 30px; margin-right: 30px;">
                <table style="width: 100%; border 0px; border-color: white; background-color: white;  border-collapse: collapse; margin-top: -30px;">
                    <tr style=" border-color: white; background-color: white; ">
                        <td style="border-color: white; background-color: white; ">
                            <img src="'.$logo_1.'" style="height: 80px; width: 80px;">
                            <div style="margin-top: -100px;">
                                <h3 style="text-align: center;">'.$format["judul"].'</h3>
                                <p style="text-align: center; font-size: 10px; margin-top: -15px;">'.$format["keterangan_1"].'</p>
                                <p style="text-align: center; font-size: 10px; margin-top: -10px;">'.$format["keterangan_2"].'</p>
                            </div>
                            <img src="'.$logo_2.'" style="height: 80px; width: 80px; margin-top: -95px; float: right;">                        
                        </td>
                    </tr>
                </table>
                <div style="margin-top: -10px;"></div>
                <hr>
            </div>
        ';


        $body_head = '<div style="text-align:center;margin-left: 30px; margin-right: 30px;">';
        $build_html = "
            <h3>$title_name</h3>
            <h4 style='margin-top: -10px;'>No:............................</h4>
            $data_head
            <br>
            <table>
            $thead_title
            $body_table
            </table>
        ";
        $footer = '</div>';

        $this->create_pdf([
            'html' => $page_header. $body_head . $build_html . $footer,
            'doc_name' => $doc_name,
            'orientation' => 'portrait'
        ]);
    }

    function __construct()
    {
        parent::__construct();
        // Cek session
        $this->sesion->cek_session();

        // id dari menu Repository
        $this->id_menu = 104;
        $get_menu = $this->db->get_where('term_management', ['id_menu' => $this->id_menu])->row_array();
        $this->modul = $get_menu['nama'];

        $this->member = $this->db->select('c.id, a.id as id_profile')->join('membership b', 'b.id_profile = a.id')->join('jenis_membership c', 'c.id = b.id_jenis_membership')->get_where('profile a', ['a.id_user' => $this->session->userdata('data')['id'], 'b.status' => 1]);
        $cek_member = $this->member->num_rows();
        if($cek_member > 0){
            $member = $this->member->row_array();
            $this->member = $member['id'];
            $this->id_profile = $member['id_profile'];
        }else{
            $this->id_profile = '';
            $this->member = '';
        }

        $this->load->model("pengaturan/ProfileModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
