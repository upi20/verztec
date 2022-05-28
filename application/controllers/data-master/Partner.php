<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Partner extends Render_Controller
{

    public function testing(){
        require APPPATH."/libraries/koolreport/core/autoload.php";
        $this->load->view('test_file');
    }

    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Data Master', 'Partner'];
        $this->plugins = ['datatables', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'Data Master';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Partner';
        $this->breadcrumb_3_url = base_url() . 'data-master/partner';

        $partner_alias = $this->db->select('b.nama as nama')->join('term_management b', 'b.id_menu = a.menu_id')->get_where('menu a', ['a.menu_id' => 106])->row_array();
        $this->data['partner_alias'] = $partner_alias['nama'];
        
        // content
        $this->load->model("pengaturan/ProfileModel", 'profile');
        $this->data['level'] = $this->profile->getLevel();
        $this->data['posisi'] = $this->profile->getPosisi();
        $this->content      = 'data-master/partner';

        // Send data to view
        $this->render();
    }

    public function getID(){
        $this->load->model("pengaturan/ProfileModel", 'profile');
        $ceknew = $this->profile->cekNew();
        $this->output_json($ceknew['id']);

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


    public function export_excel()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        $details = $this->model->getAllData(null, null, null, null, $order)->result_array();
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
        $col_end = "I";
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
            ->setDescription("List Keluarga $date")
            ->setKeywords("Laporan, Report")
            ->setCategory("Laporan, Report");
        // set default font
        $spreadsheet->getDefaultStyle()->getFont()->setName('Calibri');
        $spreadsheet->getDefaultStyle()->getFont()->setSize(11);


        // header 2 ====================================================================================================
        $row += 1;
        $sheet->mergeCells($col_start . $row . ":" . $col_end . $row)
            ->setCellValue("A$row", "List " . $this->getMenuTitle());
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
            'Nama',
            'No Telepon',
            'Email',
            'Alamat',
            'Foto',
            'Total Anggota',
            'Status',
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
            $total_anggota = $this->db->join('users b','b.user_id = a.id_user')->get_where('profile a', ['b.id_partner' => $detail['id']])->num_rows();
            $c = 0;
            $row++;
            $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
            $tanggal = date("d-m-Y", strtotime($tanggal));
            $sheet->setCellValue(chr(65 + $c) . "$row", ($row - 5));
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", " ".$detail['no_telepon']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['email']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['lokasi']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['photo']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $total_anggota);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['status_str']);
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
        // $sheet->getStyle("G" . $start_tabel . ":" . "G" . $row)
        //     ->getNumberFormat()
        //     ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);
        // $sheet->getStyle("I" . $start_tabel . ":" . "I" . $row)
        //     ->getNumberFormat()
        //     ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);

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
        // $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);

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
        $doc_name = "AuditAny_Data_Master_" . str_replace(" ", "_", $this->getMenuTitle());

        // set table header
        $headers = [
            'No',
            'Nama',
            'No Telepon',
            'Email',
            'Alamat',
            'Status',
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
        $details = $this->model->getAllData(null, null, null, null, $order)->result_array();
        $body_table = '';
        foreach ($details as $i => $detail) {
            $tanggal = is_null($detail['updated_at']) || $detail['updated_at'] == '' ?  $detail['created_at'] :  $detail['updated_at'];
            $tanggal = date("d-m-Y", strtotime($tanggal));
            $num = $i + 1;
            $body_table .= '<tr>';
            $body_table .= "<td style=\"text-align:center\">{$num}</td>";
            $body_table .= "<td>{$detail['nama']}</td>";
            $body_table .= "<td>{$detail['no_telepon']}</td>";
            $body_table .= "<td>{$detail['email']}</td>";
            $body_table .= "<td>{$detail['lokasi']}</td>";
            $body_table .= "<td>{$detail['status_str']}</td>";
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
            'doc_name' => $doc_name,
            'orientation' => 'landscape'
        ]);
    }


    public function downloadSample()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        $details = ['0' => [
            'nama' => "Dummy",
            'no_telepon' => "0851258125",
            'email' => "dummy@gmail.com",
            'lokasi' => "Indonesia",
            'status_str' => "Aktif",
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
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
        $col_end = "G";
        $title_excel = "AuditAny_Data_Master_" . str_replace(" ", "_", $this->getMenuTitle()) . "_Sample";
        // Header excel ================================================================================================
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Dokumen Properti
        $spreadsheet->getProperties()
            ->setCreator("Audit System End to End")
            ->setLastModifiedBy("Administrator")
            ->setTitle($title_excel)
            ->setSubject("Administrator")
            ->setDescription("List Partner $date")
            ->setKeywords("Laporan, Report")
            ->setCategory("Laporan, Report");
        // set default font
        $spreadsheet->getDefaultStyle()->getFont()->setName('Calibri');
        $spreadsheet->getDefaultStyle()->getFont()->setSize(11);


        // header 2 ====================================================================================================
        $row += 1;
        $sheet->mergeCells($col_start . $row . ":" . $col_end . $row)
            ->setCellValue("A$row", "List Partner" . $this->getMenuTitle());
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
            'Nama',
            'No Telepon',
            'Email',
            'Lokasi',
            'Status',
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
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['nama']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['no_telepon']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['email']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['lokasi']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['status_str']);
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
        // $sheet->getStyle("G" . $start_tabel . ":" . "G" . $row)
        //     ->getNumberFormat()
        //     ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);
        // $sheet->getStyle("I" . $start_tabel . ":" . "I" . $row)
        //     ->getNumberFormat()
        //     ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);

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
        // $spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
        // $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);

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
            if ($num > 5 && $val[6]) {
                $status = strtolower($val[5]);
                if ($status == 'aktif') {
                    $status_id = 1;
                } else if ($status == 'tidak aktif') {
                    $status_id = 2;
                } else {
                    $status_id = 0;
                }

                $tbh = $this->db->insert('partner', [
                    "nama"   => $val[1] == "" ? NULL : $val[1],
                    "no_telepon"  => $val[2] == "" ? NULL : $val[2],
                    "email"  => $val[3] == "" ? NULL : $val[3],
                    "lokasi"        => $val[4] == "" ? NULL : $val[4],
                    "status"         => $status_id,
                    "created_at"    => date("Y-m-d H:i:s")
                ]);
                $modul = $this->getMenuTitle();
                $by = $this->session->userdata('data')['id'];
                $jenis_perubahan = 1;
                // $status = $status == 1 ? $status = 'Aktif' : ($status == 0 ? $status = 'Tidak Aktif' : 'Tidak Diketahui');
                $data_lama = "Belum ada data";
                $data_baru = "Menambah data baru dengan menggunakan fitur Import dari Excel dengan isi nama = $val[1], lokasi = $val[4], no_telepon = $val[2], email = $val[3], status = $status";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
            $num++;
        }


        // database transaction complete
        $this->db->trans_complete();

        $code = $tbh ? 200 : 500;
        $this->output_json(["data" => $tbh], $code);
    }

    public function getPartner()
    {
        $id = $this->input->get("id");
        $result = $this->model->getPartner($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function getDetail(){
        $id = $this->input->get("id");
        $result = $this->model->getPartner($id);
        $detail = $this->model->getDetail($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result, "detail" => $detail], $code);
    }


    public function insert()
    {
        $nama = $this->input->post("nama");
        $lokasi = $this->input->post("lokasi");
        $status = $this->input->post("status");
        $no_telepon = $this->input->post("no_telepon");
        $email = $this->input->post("email");
        $result = $this->model->insert($nama, $lokasi, $status, $no_telepon, $email);
        if ($result != null) {
            // $send = $this->sendConfirmEmail($nama, $email);
            // // debug
            // if ($this->debug) {
            //     var_dump($send);
            //     die;
            // }
        }
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }


    public function update()
    {
        $id = $this->input->post("id");
        $nama = $this->input->post("nama");
        $lokasi = $this->input->post("lokasi");
        $status = $this->input->post("status");
        $no_telepon = $this->input->post("no_telepon");
        $email = $this->input->post("email");
        $result = $this->model->update($id, $nama, $lokasi, $status, $no_telepon, $email);
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

    private function sendConfirmEmail($nama, $email)
    {
        $this->load->model('loginModel', 'login');
        $content = '<p>Email anda telah didaftarkan sebagai partner di Aplikasi Audit Any. Terimakasih</p>';
        // debug
        if ($this->debug) {
            return [
                'url' => $url
            ];
        }
        // production
        $this->send_email($email, $content, 'Partner');
        return (true);
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


    public function cetak()
    {
        // title name
        $title_name = "Data " . $this->getMenuTitle();
        $id = $this->input->post('id_lihat');
        $result = $this->model->getPartner($id);
        $detail = $this->model->getDetail($id);
        $format = $this->model->getFormatHeader();
        // document name
        $doc_name = "AuditAny_Data_Master_" . str_replace(" ", "_", $this->getMenuTitle());

        // set table header

        $thead_title = '';
        $thead_number = '';

        $thead_title = "<tr>
            <th style='width: 10%; text-align: center; font-size: 14px;'>Posisi</th>
            <th style='width: 16%; text-align: center; font-size: 14px;'>NIK</th>
            <th style='width: 14%; text-align: center; font-size: 14px;'>Kategori</th>
            <th style='width: 16%; text-align: center; font-size: 14px;'>Email</th>
            <th style='width: 16%; text-align: center; font-size: 14px;'>Nama</th>
            <th style='width: 10%; text-align: center; font-size: 14px;'>L/P</th>
        </tr>";
        $thead_number = "<tr>$thead_number</tr>";
        // set body table
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];
        $details = $this->model->getAllData(null, null, null, null, $order)->result_array();
        $body_table = '';
        foreach ($detail as $i => $detail) {
            if($detail['jenis_kelamin'] == 1){
                $jk = 'L';
            }else{
                $jk = 'P';
            }
            $num = $i + 1;
            $body_table .= '<tr style="font-size: 10px;">';
                $body_table .= "<td style='text-align: center;'>{$detail['nama_posisi']}</td>";
                $body_table .= "<td style='width: 16%; text-align: center;'>{$detail['nik']}</td>";
                $body_table .= "<td style='text-align: center;'>{$detail['keterangan_keanggotaan']} ({$detail['keanggotaan']})</td>";
                $body_table .= "<td style='width: 17%; text-align: left;'>{$detail['user_email']}</td>";
                $body_table .= "<td style='text-align: left;'>{$detail['nama_depan']} {$detail['nama_belakang']}</td>";
                $body_table .= "<td style='text-align: center;'>{$jk}</td>";
            $body_table .= '</tr>';
        }

        $logo_1 = base_url('files/laporan-header/'.$format["logo_1"]);// Modify this part (your_img.png
        $type = pathinfo($logo_1, PATHINFO_EXTENSION);
        
        $logo_1 = file_get_contents($logo_1);
        $logo_1 = 'data:image/' . $type . ';base64,' . base64_encode($logo_1);

        $logo_2 = base_url('files/laporan-header/'.$format["logo_2"]);// Modify this part (your_img.png
        $type = pathinfo($logo_2, PATHINFO_EXTENSION);
        
        $logo_2 = file_get_contents($logo_2);
        $logo_2 = 'data:image/' . $type . ';base64,' . base64_encode($logo_2);

        $photo = base_url('files/partner/'.$result["photo"]);// Modify this part (your_img.png
        $type = pathinfo($photo, PATHINFO_EXTENSION);
        
        $photo = file_get_contents($photo);
        $photo = 'data:image/' . $type . ';base64,' . base64_encode($photo);

        // insert html
        $data_head = '<table style="width: 100%; border: 1px; margin-top: -10px; background-color: transparent;">
                <tr>
                    <td style="border-color: black; width: 70%;">
                        <table style="width: 100%; border: 0px;  font-size: 12px; border-color: transparent; background-color: transparent; margin-top: 0px;">
                            <tr>
                                <td style="width: 15%; border-color: transparent; background-color: transparent;">Nama</td>
                                <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["nama"].'</td>
                            </tr>
                            <tr>
                                <td style="width: 15%; border-color: transparent; background-color: transparent;">No. Telepon</td>
                                <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["no_telepon"].'</td>
                            </tr>
                            <tr>
                                <td style="width: 15%; border-color: transparent; background-color: transparent;">Email</td>
                                <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["email"].'</td>
                            </tr>
                            <tr>
                                <td style="width: 15%; border-color: transparent; background-color: transparent;">Alamat</td>
                                <td style="width: 1%; border-color: transparent; background-color: transparent;">:</td>
                                <td style="width: 54%; border-color: transparent; background-color: transparent;">'.$result["lokasi"].'</td>
                            </tr>
                        </table>
                    </td>
                    <td style=" width: 30%;border-color: black;">
                        <table style="width: 100%; border: 0px;">
                            <tr>
                                <td colspan="3" style="border: 0px;border-color: transparent; background-color: transparent;">
                                    <img src="'.$photo.'" style="height: 100px; width: 90%;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>';
        $body_head = '<div style="text-align:center;margin-left: 30px; margin-right: 30px;">';
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
        $build_html = "
        <h3>$title_name</h3>
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
        $akses = ['Super Admin', 'Admin Staff', 'Partner L1'];
        $get_lv = $this->session->userdata('data')['level'];
        if (!in_array($get_lv, $akses)) {
            redirect('my404', 'refresh');
        }

        // id dari menu data master partner
        $this->id_menu = 106;
        $get_menu = $this->db->get_where('term_management', ['id_menu' => $this->id_menu])->row_array();
        $this->modul = $get_menu['nama'];

        $this->load->model("data-master/PartnerModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
