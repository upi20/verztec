<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Outlet extends RestController
{
  public function simpan_post()
  {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('', '');
    $this->form_validation->set_rules('pemilik', 'Nama Pemilik', 'trim|required');
    $this->form_validation->set_rules('warung', 'Nama Warung', 'trim|required');
    $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');
    $this->form_validation->set_rules('no_hp', 'Nomor Telepon', 'trim|required');
    $this->form_validation->set_rules('patokan', 'Patokan', 'trim|required');

    if ($this->form_validation->run() == FALSE) {
      $this->response([
        'status' => false,
        'data' => null,
        'message' => validation_errors()
      ], 400);
    } else {
      $pemilik = $this->input->post('pemilik');
      $warung = $this->input->post('warung');
      $alamat = $this->input->post('alamat');
      $no_hp = $this->input->post('no_hp');
      $patokan = $this->input->post('patokan');

      $result = $this->model->insertOutlet(
        $this->id,
        $pemilik,
        $warung,
        $alamat,
        $no_hp,
        $patokan,
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
    $this->load->model('api/OutletModel', 'model');
    $this->check_cors = true;
  }
}
