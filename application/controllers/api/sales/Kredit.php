<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Kredit extends RestController
{
  public function index_get()
  {
    $id = $this->get('id');
    $cari = $this->get('cari');
    $data = $this->model->api_warung($this->id, $id, $cari);
    $code = $data['data'] == null ?
      RestController::HTTP_NOT_FOUND
      : RestController::HTTP_OK;
    $status = $data['data'] != null;

    // send response
    $this->response([
      'status' => $status,
      'length' => $data['length'],
      'data' => $data['data']
    ], $code);
  }

  public function simpan_post()
  {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('', '');
    $this->form_validation->set_rules('key', 'Key', 'trim|required');
    $this->form_validation->set_rules('id_stok_keluar', 'ID Stok Keluar', 'trim|required');
    $this->form_validation->set_rules('qty', 'Qty', 'trim|required|numeric');
    $this->form_validation->set_rules('id_produk', 'ID Produk', 'trim|required|numeric');
    $this->form_validation->set_rules('id_satuan_harga', 'ID Satuan Harga', 'trim|required|numeric');
    $this->form_validation->set_rules('harga', 'Harga', 'trim|required|numeric');
    $this->form_validation->set_rules('total_harga', 'Total Harga', 'trim|required|numeric');
    if ($this->form_validation->run() == FALSE) {
      $this->response([
        'status' => false,
        'data' => null,
        'message' => validation_errors()
      ], 400);
    } else {
      $id_stok_keluar = $this->input->post('id_stok_keluar');
      $qty = $this->input->post('qty');
      $id_produk = $this->input->post('id_produk');
      $id_satuan_harga = $this->input->post('id_satuan_harga');
      $id_warung = $this->input->post('id_warung');
      $harga = $this->input->post('harga');
      $total_harga = $this->input->post('total_harga');
      $result = $this->model->insertSalesKredit(
        $id_stok_keluar,
        $qty,
        $id_produk,
        $id_satuan_harga,
        $id_warung,
        $harga,
        $total_harga,
        $this->id
      );

      $code = $result == null ?
        RestController::HTTP_NOT_FOUND
        : RestController::HTTP_OK;
      $status = $result != null;
      $this->response([
        'status' => $status,
        'length' => 1,
        'data' =>  $result
      ], $code);
    }
  }



  // construct
  function __construct()
  {
    parent::__construct();

    $key = $this->input->get('key');
    $key = $key ?? $this->input->post('key');
    if ($key == null) {
      $this->response([
        'status' => false,
        'message' => 'Key Tidak Valid'
      ], RestController::HTTP_UNAUTHORIZED);
      exit();
    }

    // cek level
    // Get data
    $userdata = $this->sesion->cek_userdata_api($key);
    $this->level = $userdata['level'];
    $this->id = $userdata['id'];
    if ($this->level != 'Sales') {
      $this->response([
        'status' => false,
        'message' => 'Akses anda ditolak'
      ], RestController::HTTP_FORBIDDEN);
      exit();
    }

    // import model
    $this->load->model('api/KreditModel', 'model');
  }
}
