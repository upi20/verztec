<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Logging extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = $this->getMenuTitle();
        $this->navigation = ['Logging'];
        $this->plugins = ['datatables', 'daterangepicker', 'select2', 'moment'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = $this->getMenuTitle();
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'Logging';
        $this->breadcrumb_3_url = base_url() . 'activity/logging/list';

        // content
        $this->data['menu'] = $this->input->get('menu');
        $this->content      = 'activity/logging/list';

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

        $date_start = $this->input->post('date_start');
        $date_end = $this->input->post('date_end');
        $modul = $this->input->post('modul');
        $by = $this->input->post('by');
        $filter = [
            'date' => [
                'start' => $date_start,
                'end' => $date_end,
            ],
            'modul' => $modul,
            'by' => $by,
        ];

        $data = $this->model->getAllData($draw, $length, $start, $_cari, $order, $filter)->result_array();
        $count = $this->model->getAllData(null, null, null, $_cari, $order, $filter)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }

    public function export_excel()
    {
        // data body
        $order = [
            'order' => $this->input->post('order'),
            'columns' => $this->input->post('columns')
        ];

        $date_start = $this->input->get('filter-start');
        $date_end = $this->input->get('filter-end');
        $modul = $this->input->get('modul');
        $by = $this->input->get('by');
        $filter = [
            'date' => [
                'start' => $date_start,
                'end' => $date_end,
            ],
            'modul' => $modul,
            'by' => $by,
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
        $col_end = "G";
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
            ->setDescription("List Activity")
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
            'Tanggal',
            'Modul',
            'By',
            'Jenis Perubahan',
            'Data Lama',
            'Data Baru',
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
            $sheet->setCellValue(chr(65 + $c) . "$row", ($row - 5));
            $sheet->setCellValue(chr(65 + ++$c) . "$row", date("d-m-Y", strtotime($detail['created_at'])));
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['modul']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['user']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['jenis_str']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['data_lama']);
            $sheet->setCellValue(chr(65 + ++$c) . "$row", $detail['data_baru']);
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
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(w(60));
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(w(60));

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
        $doc_name = "AuditAny_" . str_replace(" ", "_", $this->getMenuTitle());

        // set table header
        $headers = [
            'No',
            'Tanggal',
            'Modul',
            'By',
            'Jenis Perubahan',
            'Data Lama',
            'Data Baru',
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

        $date_start = $this->input->get('filter-start');
        $date_end = $this->input->get('filter-end');
        $modul = $this->input->get('modul');
        $by = $this->input->get('by');
        $filter = [
            'date' => [
                'start' => $date_start,
                'end' => $date_end,
            ],
            'modul' => $modul,
            'by' => $by,
        ];
        $details = $this->model->getAllData(null, null, null, null, $order, $filter)->result_array();
        $body_table = '';
        foreach ($details as $i => $detail) {
            $num = $i + 1;
            $body_table .= '<tr>';
            $body_table .= "<td style=\"text-align:center\">{$num}</td>";
            $body_table .= "<td>" . date("d-m-Y", strtotime($detail['created_at'])) . "</td>";
            $body_table .= "<td>{$detail['modul']}</td>";
            $body_table .= "<td>{$detail['user']}</td>";
            $body_table .= "<td>{$detail['jenis_str']}</td>";
            $body_table .= "<td>{$detail['data_lama']}</td>";
            $body_table .= "<td>{$detail['data_baru']}</td>";
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

    public function getLogging()
    {
        $id = $this->input->get("id");
        $result = $this->model->getLogging($id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function ajax_select_list_modul()
    {
        $return = $this->model->list_modul();
        $this->output_json($return);
    }
    public function ajax_select_list_by()
    {
        $return = $this->model->list_by();
        $this->output_json($return);
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

        $this->load->model("activity/LoggingModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
