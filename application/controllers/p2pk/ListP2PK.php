<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ListP2PK extends Render_Controller
{
    public function getCode(){
        $id_kategori = $this->input->post('id_kategori');
        $get = $this->db->select('a.*, b.nama as kode_kategori')->join('kategori_p2pk b', 'b.id = a.id_kategori')->get_where('kode a', ['b.id_menu' => $this->id_menu, 'a.id_kategori' => $id_kategori])->row_array();
        $jumlah = $get['jumlah'];
        $this->db->select('RIGHT(p2pk.kode,'.$jumlah.') as id', FALSE);
        $this->db->order_by('id','DESC');
        $this->db->limit(1);    
        $query = $this->db->get('p2pk');  //cek dulu apakah ada sudah ada kode di tabel.    
        if($query->num_rows() <> 0){      
           $data = $query->row();      
           $kode = intval($data->id) + 1; 
        }
        else{      
           $kode = 1; 
        }

        $batas = str_pad($kode, $jumlah, "0", STR_PAD_LEFT);    
        
        if($get['bulan'] == "Ya"){
            $bulan = date("m");
        }else{
            $bulan = "";
        }

        if($get['tahun'] == "Ya"){
            $tahun = date("y");
        }else{
            $tahun = "";
        }

        $kodetampil = $get['kode'].$get['kode_kategori']."-".$bulan.$tahun."-".$batas;  
        $output['id'] = $kodetampil;
        $this->output->set_content_type('js');
        $this->output->set_output(json_encode($output));
    }

    public function index()
    {

        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['P2PK', '#'];
        $this->plugins = ['datatables', 'select2', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'P2PK';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = $this->getMenuTitle();
        $this->breadcrumb_3_url = base_url() . 'p2pk/listP2PK';

        // content
        $this->data['st_proses'] = $this->ajax_select_list_stp();
        $this->data['summary_p2pk'] = $this->db->get_where('p2pk',['status !=' => 3])->num_rows();
        $this->data['summary_p2pk_au'] = $this->db->get_where('p2pk', ['id_kategori_p2pk' => 1,'status !=' => 3])->num_rows();
        $this->data['summary_p2pk_ak'] = $this->db->get_where('p2pk', ['id_kategori_p2pk' => 3,'status !=' => 3])->num_rows();
        $this->data['summary_p2pk_pic'] = $this->db->group_by('pic')->get_where('p2pk',['status !=' => 3])->num_rows();
        $this->data['summary_p2pk_proses'] = $this->db->get_where('p2pk', ['status' => 1])->num_rows();
        $this->data['summary_p2pk_selesai'] = $this->db->get_where('p2pk', ['status' => 2])->num_rows();
        // $this->data['summary_p2pk_kategori'] = $this->db->get_where('p2pk')->group_by('')->num_rows();
        $this->content      = 'p2pk/listP2PK';

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

        $status = $this->input->post('status');
        $status_proses = $this->input->post('status_proses');
        $client = $this->input->post('client');
        $kategori = $this->input->post('kategori');
        $filter = [
            'status' => $status,
            'status_proses' => $status_proses,
            'client' => $client,
            'kategori' => $kategori,
        ];

        $data = $this->model->getAllData($draw, $length, $start, $_cari, $order, $filter)->result_array();
        $count = $this->model->getAllData(null, null, null, $_cari, $order, $filter)->num_rows();
        $get_lv = $this->session->userdata('data')['level'];
        for ($i = 0; $i < $count; $i++) {
            $data[$i]['lv_login'] = $get_lv;
        }

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function detail($id = null)
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['P2PK', '#'];
        $this->plugins = ['datatables', 'select2', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'P2PK';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = $this->getMenuTitle();
        $this->breadcrumb_3_url = base_url() . 'p2pk/detailP2PK';

        // content
        $this->content      = 'p2pk/detailP2PK';

        $this->data['isi'] = $this->model->getIsiP2pkBy(['a.id' => $id]);
        $planning = $this->model->getIsiPlanningBy(['a.id_p2pk' => $id]);
        $this->data['planning'] = $planning;
        $planning_file = $this->model->getIsiPlanningFileBy(['a.id_p2pk_planning' => $planning != null ? $planning['id'] : null]);
        $this->data['planning_file'] = $planning_file != null ? $planning_file : null;
        $audit = $this->model->getIsiAuditBy(['a.id_p2pk' => $id]);
        $this->data['audit'] = $audit;
        $audit_file = $this->model->getIsiAuditFileBy(['a.id_p2pk_proses_audit' => $audit != null ? $audit['id'] : null]);
        $this->data['audit_file'] = $audit_file != null ? $audit_file : null;
        $dataReport = $this->model->getDataReport($id);
        $dataFinalReport = $this->model->getDataFinalReport($id);
        $this->data['cekFinalReport'] = $this->model->cekFinalReport($id);
        $dataReportHead = $this->model->getDataReportHead($id);
        $this->data['dataReport'] = $dataReport != null ? $dataReport : null;
        $this->data['dataFinalReport'] = $dataFinalReport != null ? $dataFinalReport : null;
        $this->data['dataReportHead'] = $dataReportHead != null ? $dataReportHead : null;
        $idu = $this->session->userdata('data')['id'];
        $ida = $this->db->select("a.id,
        (IFNULL((SELECT jenis_membership.id FROM membership
            join jenis_membership on jenis_membership.id = membership.id_jenis_membership
            WHERE id_profile = a.id and membership.status < 2 limit 1), '')) as membership,
        (IFNULL((SELECT id FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as id_membership,
        (IFNULL((SELECT status FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as st_membership")
            ->from("profile a")
            ->where("a.id_user", $idu)
            ->get()
            ->row_array();
        $this->data['lvmember'] = $ida['membership'];
        $get_lv = $this->session->userdata('data')['level'];
        $this->data['lvuser'] = $get_lv;
        $dataReportApprover = $this->model->getDataReport($id, ['a.id_approval' => $ida['id']]);
        $this->data['dataReportApprover'] = $dataReportApprover;
        if ($get_lv == "Super Admin" || $get_lv == "Partner L2") {
            $this->data['setshow'] = true;
        }

        $this->data['id_selesaikan'] = $id;
        // Send data to view
        $this->render();
    }

    public function insert()
    {
        $kode = $this->input->post("kode");
        $id_kategori = $this->input->post("id_kategori");
        $id_client = $this->input->post("id_client");
        $id_pic = $this->input->post("id_pic");
        $judul = $this->input->post("judul");
        $status = $this->input->post("status");
        $result = $this->model->insert($kode, $id_kategori, $id_client, $id_pic, $judul, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update()
    {
        $id = $this->input->post("id");
        $kode = $this->input->post("kode");
        $id_kategori = $this->input->post("id_kategori");
        $id_client = $this->input->post("id_client");
        $id_pic = $this->input->post("id_pic");
        $judul = $this->input->post("judul");
        $status = $this->input->post("status");
        $result = $this->model->update($id, $kode, $id_kategori, $id_client, $id_pic, $judul, $status);
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

    public function simpan_planning()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_planning = $this->input->post("id_planning");
        $judul = $this->input->post("judul");
        $deskripsi = $this->input->post("deskripsi");
        $id_doc = $this->input->post("id_doc");
        $result = $this->model->simpan_planning($id_p2pk, $id_planning, $judul, $deskripsi, $id_doc);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function simpan_audit()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_audit = $this->input->post("id_audit");
        $judul = $this->input->post("judul");
        $deskripsi = $this->input->post("deskripsi");
        $id_doc = $this->input->post("id_doc-audit");
        $result = $this->model->simpan_audit($id_p2pk, $id_audit, $judul, $deskripsi, $id_doc);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function simpan_pilih_approval()
    {
        $id = $this->session->userdata('data')['id'];
        $user_id = $this->db->select('id')->get_where('profile',['id_user' => $id])->row_array();
        $user_id = $user_id['id'];

        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $id_approval = $this->input->post("id_approval");
        $kode = $this->input->post("kode");
        $report_phase = $this->input->post("report_phase_approval");
        $result = $this->model->simpan_pilih_approval($id_p2pk, $id_p2pk_report, $id_approval);
        if ($result) {
            // send email
            $user = $this->db->select('id_user, user_email, user_email_status')->from('profile')->join('users', 'profile.id_user = users.user_id')->where('id', $id_approval)->get()->row_array();
            $p2pk = $this->db->get_where('p2pk', ['id' => $id_p2pk])->row_array();
            $client = $this->db->get_where('client_company', ['id' => $p2pk['id_client']])->row_array()['nama'];
            $oleh = "Client <b>$client</b> dengan PIC <b>$p2pk[pic]</b>";
            // if ($user != null) {
            //     $email = $user['user_email'];
            //     $result = $this->sendConfirmEmail($id_p2pk, $email, $oleh);
            //     $detail_notifikasi = $kode." - Phase: ".$report_phase. " (".$p2pk['pic'].")";
            //     $send_notification = $this->sendNotification($detail_notifikasi, $oleh, $id_approval, $id); 
            //     // debug
            //     if ($this->debug) {
            //         var_dump($result);
            //         die;
            //     }
            // }
        }
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id_p2pk], $code);
    }

    public function update_pilih_approval()
    {
        $id = $this->session->userdata('data')['id'];
        $user_id = $this->db->select('id')->get_where('profile',['id_user' => $id])->row_array();
        $user_id = $user_id['id'];

        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $id_approval = $this->input->post("id_approval");
        $kode = $this->input->post("kode");
        $report_phase = $this->input->post("report_phase_approval");
        $result = $this->model->update_pilih_approval($id_p2pk, $id_p2pk_report, $id_approval);
        if ($result) {
            // send email
            $user = $this->db->select('id_user, user_email, user_email_status')->from('profile')->join('users', 'profile.id_user = users.user_id')->where('id', $id_approval)->get()->row_array();
            $p2pk = $this->db->get_where('p2pk', ['id' => $id_p2pk])->row_array();
            $client = $this->db->get_where('client_company', ['id' => $p2pk['id_client']])->row_array()['nama'];
            $oleh = "Client <b>$client</b> dengan PIC <b>$p2pk[pic]</b>";
            if ($user != null) {
                $email = $user['user_email'];
                $result = $this->sendConfirmEmail($id_p2pk, $email, $oleh);
                $detail_notifikasi = $kode." - Phase: ".$report_phase. " (".$p2pk['pic'].")";
                $send_notification = $this->sendNotification($detail_notifikasi, $oleh, $id_approval, $id); 
                // debug
                if ($this->debug) {
                    var_dump($result);
                    die;
                }
            }
        }
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id_p2pk], $code);
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

    public function simpan_file_report()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $report_phase = $this->input->post("report_phase");
        $result = $this->model->simpan_file_report($id_p2pk, $id_p2pk_report, $report_phase);
        $code = $result ? 200 : 500;
        $data = [$id_p2pk, $report_phase];
        $this->output_json(["data" => $data], $code);
    }

    public function simpan_file_report_semua()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $report_phase = $this->input->post("report_phase");
        $result = $this->model->simpan_file_report_semua($id_p2pk, $id_p2pk_report, $report_phase);
        $code = $result ? 200 : 500;
        $data = [$id_p2pk, $report_phase];
        $this->output_json(["data" => $data], $code);
    }
         

    public function update_status_file_report()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $report_phase = $this->input->post("report_phase");
        $result = $this->model->update_file_report($id_p2pk, $id_p2pk_report, $report_phase);
        $code = $result ? 200 : 500;
        $data = [$id_p2pk, $report_phase];
        $this->output_json(["data" => $data], $code);
    }

    public function simpan_file_komentar()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id_p2pk_report");
        $report_phase = $this->input->post("report_phase");
        $komentar = $this->input->post("komentar");
        $result = $this->model->simpan_file_komentar($id_p2pk, $id_p2pk_report, $report_phase, $komentar);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id_p2pk], $code);
    }

    public function update_file_komentar()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $id_p2pk_report = $this->input->post("id");
        $report_phase = $this->input->post("report_phase");
        $result = $this->model->update_file_komentar($id_p2pk, $id_p2pk_report, $report_phase);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id_p2pk], $code);
    }

    public function set_st_proses()
    {
        $id_p2pk = $this->input->post("id_p2pk");
        $status = $this->input->post("status");
        $result = $this->model->set_st_proses($id_p2pk, $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id_p2pk], $code);
    }

    public function hapusFile()
    {
        $tbl = $this->input->post("tbl");
        $id = $this->input->post("id");
        $result = $this->model->hapusFile($tbl, $id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }
    public function download_doc($file)
    {
        force_download($file, NULL);
    }
    
    public function ajax_select_list_kategori()
    {
        $return = $this->model->list_kategori($this->id_menu);
        $this->output_json($return);
    }

    public function ajax_select_list_client()
    {
        $return = $this->model->list_client();
        $this->output_json($return);
    }

    public function ajax_select_list_pic()
    {
        $return = $this->model->list_pic();
        $this->output_json($return);
    }

    public function ajax_select_list_resiko()
    {
        $id_client = $this->input->post('id_client');
        $return = $this->model->list_resiko($id_client);
        $this->output_json($return);
    }

    public function ajax_select_list_bod()
    {
        $return = $this->model->getBODList();
        $this->output_json($return);
    }

    public function getTemplate()
    {
        $tahapan = $this->input->get('tahapan');
        $kategori = $this->input->get('kategori');
        $return = $this->db->get_where('template_download', ['tahapan' => $tahapan, 'kategori' => $kategori])->result_array();
        $this->output_json($return);
    }
    
    public function ajax_select_list_stp($id_p2pk = null)
    {
        $return = $this->model->getSTP($id_p2pk);
        // $this->output_json($return);
        return $return;
    }

    private function sendConfirmEmail($id, $email, $oleh)
    {
        $this->load->model('loginModel', 'login');
        $url = base_url() . 'p2pk/listP2PK/detail/' . $id . '#v-report';
        $content = '<p>Anda telah diminta menjadi approval untuk P2PK Report oleh ' . $oleh . ' di aplikasi Audit System End to End. Untuk melihatnya <a href="' . $url .
            '">klik disini</a></p>';
        // debug
        if ($this->debug) {
            return [
                'url' => $url
            ];
        }
        // production
        $this->send_email($email, $content, 'Permintaan Approval');
        return (true);
    }

    public function selesaikan()
    {
        $id = $this->input->post('id');
        $result = $this->model->selesaikan($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $id], $code);
        // echo "<script>alert('P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK')</script>";
        // redirect("p2pk/listP2PK", 'refresh');
    }

    public function export_excel()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];

        $status = $this->input->get('status');
        $status_proses = $this->input->get('status_proses');
        $client = $this->input->get('client');
        $kategori = $this->input->get('kategori');

        $filter = [
            'status' => $status,
            'status_proses' => $status_proses,
            'client' => $client,
            'kategori' => $kategori,
        ];
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
        $col_end = "H";
        $title_excel = "AuditAny_" . str_replace(" ", "_", $this->getMenuTitle());
        // Header excel ================================================================================================
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Dokumen Properti
        $spreadsheet->getProperties()
            ->setCreator("Audit System End to End")
            ->setLastModifiedBy("Administrator")
            ->setTitle($title_excel)
            ->setSubject("Administrator")
            ->setDescription("List " . $this->getMenuTitle())
            ->setKeywords("Laporan, Report")
            ->setCategory("Laporan, Report");
        // set default font
        $spreadsheet->getDefaultStyle()->getFont()->setName('Calibri');
        $spreadsheet->getDefaultStyle()->getFont()->setSize(11);


        // header 2 ====================================================================================================
        $row += 1;
        $sheet->mergeCells($col_start . $row . ":" . $col_end . $row)
            ->setCellValue("A$row", "Data " . $this->getMenuTitle());
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
            'Client',
            'PIC',
            'Judul',
            'Resiko',
            'Status',
            'Status Proses',
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
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['client']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['pic']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['judul']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['resiko']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['status_str']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['status_proses_str']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $tanggal);
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
        // $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(w(60));

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
        error_reporting(0);
        $title_name = "List " . $this->getMenuTitle();
        // document name
        $doc_name = "AuditAny_P2PK_" . str_replace(" ", "_", $this->getMenuTitle());

        
        // set body table
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];

        $filter = [
            'status' => $this->input->get("status"),
            'status_proses' => $this->input->get("status_proses"),
            'client' => $this->input->get("client")
        ];

        $listP2PK = $this->model->getP2PK($filter);

        array_push($listP2PK, ['id' => '-', 'text' => 'Belum ada partner']);
        // insert html
        $body_head = '<div style="text-align:center">';
        $build_html = "<h3>$title_name</h3>";
        foreach ($listP2PK as $bypart) {
            if($bypart['client'] != null){
                $filters = [
                    'id_p2pk' => $bypart['id']
                ];

                // set table header
                $headers = [
                    'Planning - Judul',
                    'Planning - Deskripsi',
                    'Planning - Timeline',
                    'Planning - SDM',
                    'Planning - Diminta',
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

                $detail_planning = $this->model->getAllDataPlanning($filters);
                $body_table = '';
                foreach ($detail_planning as $i => $detail) {

                    $num = $i + 1;
                    $body_table .= '<tr>';
                    $body_table .= "<td>{$detail['judul']}</td>";
                    $body_table .= "<td>{$detail['deskripsi']}</td>";
                    $body_table .= "<td>{$detail['timeline']}</td>";
                    $body_table .= "<td>{$detail['sdm']}</td>";
                    $body_table .= "<td>{$detail['diminta']}</td>";
                    $body_table .= '</tr>';
                }

                $headers2 = [
                    'Proses Audit - Judul',
                    'Proses Audit - Deskripsi',
                    'Proses Audit - Kertas Kerja',
                    'Proses Audit - Pengujian',
                ];
                $thead_title2 = '';
                $thead_number2 = '';
                foreach ($headers2 as $i2 => $head2) {
                    $num2 = $i2 + 1;
                    $thead_title2 .= "<th style=\"text-align:center;\">$head2</th>";
                    $thead_number2 .= "<th style=\"background-color:#E5E7EB; text-align:center; padding-top:2px; padding-bottom:2px;\">$num2</th>";
                }
                $thead_title2 = "<tr>$thead_title2</tr>";
                $thead_number2 = "<tr>$thead_number2</tr>";

                $detail_proses_audit = $this->model->getAllDataProsesAudit($filters);
                $body_table2 = '';
                foreach ($detail_proses_audit as $i => $detail) {

                    $num2 = $i + 1;
                    $body_table2 .= '<tr>';
                    $body_table2 .= "<td>{$detail['judul']}</td>";
                    $body_table2 .= "<td>{$detail['deskripsi']}</td>";
                    $body_table2 .= "<td>{$detail['kertas_kerja']}</td>";
                    $body_table2 .= "<td>{$detail['pengujian']}</td>";
                    $body_table2 .= '</tr>';
                }

                $headers3 = [
                    'Report - Phase',
                    'Report - Approval',
                    'Report - File',
                    'Report - Tanggal Upload',
                    'Report - Tanggal Approval Diminta',
                    'Report - Komentar File',
                    'Report - Komentar Text',
                    'Report - Status',
                ];
                $thead_title3 = '';
                $thead_number3 = '';
                foreach ($headers3 as $i3 => $head3) {
                    $num3 = $i3 + 1;
                    $thead_title3 .= "<th style=\"text-align:center;\">$head3</th>";
                    $thead_number3 .= "<th style=\"background-color:#E5E7EB; text-align:center; padding-top:2px; padding-bottom:2px;\">$num3</th>";
                }
                $thead_title3 = "<tr>$thead_title3</tr>";
                $thead_number3 = "<tr>$thead_number3</tr>";

                $detail_report = $this->model->getAllDataReport($filters);
                $body_table3 = '';
                foreach ($detail_report as $i => $detail) {

                    $num2 = $i + 1;
                    $body_table3 .= '<tr>';
                    $body_table3 .= "<td>{$detail['report_phase']}</td>";
                    $body_table3 .= "<td>{$detail['approval']}</td>";
                    $body_table3 .= "<td>{$detail['file']}</td>";
                    $body_table3 .= "<td>{$detail['tanggal_upload']}</td>";
                    $body_table3 .= "<td>{$detail['tanggal_approval_diminta']}</td>";
                    $body_table3 .= "<td>{$detail['file_komen']}</td>";
                    $body_table3 .= "<td>{$detail['komentar']}</td>";
                    $body_table3 .= "<td>{$detail['status_str']}</td>";
                    $body_table3 .= '</tr>';
                }
                $build_html .= '<br><br><table style="width: 100%;">
                                    <tr>
                                        <td style="width: 20%;">
                                            <h4 style="text-align:left">Client : ' . $bypart['client'] . '</h4>
                                        </td>
                                        <td>
                                            <h4 style="text-align:left">Resiko : ' . $bypart['resiko'] . '</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <h4 style="text-align:left">Judul : ' . $bypart['judul'] . '</h4>
                                        </td>
                                        <td>
                                            <h4 style="text-align:left">Status : ' . $bypart['status_str'] . '</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <h4 style="text-align:left">PIC : ' . $bypart['pic'] . '</h4>
                                        </td>
                                        <td>
                                            <h4 style="text-align:left">Status Proses : ' . $bypart['status_proses_str'] . '</h4>
                                        </td>
                                    </tr>
                                </table><br>';

                $build_html .= "<table>
                                    $thead_title
                                    $body_table
                                </table><br>
                                <table>
                                    $thead_title2
                                    $body_table2
                                </table><br>
                                <table>
                                    $thead_title3
                                    $body_table3
                                </table>
                                <br>
                                <br>
                                <hr>
                ";
            }   
        }
        $footer = '</div>';
        $this->create_pdf([
            'html' => $header_html. $body_head . $build_html . $footer,
            'doc_name' => $doc_name,
            'orientation' => 'landscape',
            'paper_size' => 'A2'
        ]);
    }

    public function export_pdf2()
    {
        // title name
        $title_name = "List " . $this->getMenuTitle();

        // document name
        $doc_name = "AuditAny_" . str_replace(" ", "_", $this->getMenuTitle());

        // set table header
        $headers = [
            'No',
            'Client',
            'PIC',
            'Judul',
            'Resiko',
            'Status',
            'Status Proses',
            'Tanggal',
        ];
        $thead_title = '';
        $thead_number = '';
        foreach ($headers as $i => $head) {
            $num = $i + 1;
            $thead_title .= "<th style=\"text-align:center\">$head</th>";
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

        $status = $this->input->get('status');
        $status_proses = $this->input->get('status_proses');
        $client = $this->input->get('client');
        $filter = [
            'status' => $status,
            'status_proses' => $status_proses,
            'client' => $client,
        ];
        $details = $this->model->getAllData(null, null, null, null, $order, $filter)->result_array();
        $body_table = '';
        foreach ($details as $i => $detail) {
            $num = $i + 1;
            $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
            $tanggal = date("d-m-Y", strtotime($tanggal));
            $body_table .= '<tr>';
            $body_table .= "<td style=\"text-align:center\">{$num}</td>";
            $body_table .= "<td>{$detail['client']}</td>";
            $body_table .= "<td>{$detail['pic']}</td>";
            $body_table .= "<td>{$detail['judul']}</td>";
            $body_table .= "<td>{$detail['resiko']}</td>";
            $body_table .= "<td>{$detail['status_str']}</td>";
            $body_table .= "<td>{$detail['status_proses_str']}</td>";
            $body_table .= "<td>{$tanggal}</td>";
            $body_table .= '</tr>';
        }


        // insert html
        $body_head = '<div style="text-align:center">';
        $build_html = "
        <h3>$title_name</h3>
        <table>
        $thead_title
        $thead_number
        $body_table
        </table>
        ";
        $footer = '</div>';
        $this->create_pdf([
            'html' => $body_head . $build_html . $footer,
            'doc_name' => $doc_name
        ]);
    }

    function __construct()
    {
        parent::__construct();
        // Cek session
        $this->sesion->cek_session();
        $akses = ['Super Admin', 'Admin Staff', 'Partner L1', 'Partner L2'];
        $this->level = $this->session->userdata('data')['level'];

        if (!in_array($this->level, $akses)) {
            redirect('my404', 'refresh');
        }
        
        $modul = $this->db->get_where('module_activation')->row_array();
        if ($modul['p2pk'] == 2) {
            redirect('modulNonAktif', 'refresh');
        }

        $this->member = $this->db->select('c.id')->join('membership b', 'b.id_profile = a.id')->join('jenis_membership c', 'c.id = b.id_jenis_membership')->get_where('profile a', ['id_user' => $this->session->userdata('data')['id']]);
        if($this->member->num_rows() > 0){
            $this->member = $this->member->row_array()['id'];
        }else{
            $this->member = '';
        }
        // id dari menu ListP2PK
        $this->id_menu = 97;
        $get_menu = $this->db->get_where('term_management', ['id_menu' => $this->id_menu])->row_array();
        $this->modul = $get_menu['nama'];

        $this->load->model("p2pk/ListP2PKModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
