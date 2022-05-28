<?php

use chriskacerguis\RestServer\RestController;

defined('BASEPATH') or exit('No direct script access allowed');

class Aktifitas extends RestController
{
  public function list_aktifitas_get()
  {
    $data = $this->model->get_list_aktifitas();
    $code = $data['data'] == null ?
      RestController::HTTP_NOT_FOUND
      : RestController::HTTP_OK;
    $status = $data['data'] != null;

    $this->response([
      'status' => $status,
      'length' => $data['length'],
      'data' => $data['data']
    ], $code);
  }

  function __construct()
  {
    parent::__construct();
    $key = $this->input->get('key');
    $key = $key ?? $this->input->post('key');
    $this->key = $key;
    if ($key == null) {
      $this->response([
        'status' => false,
        'message' => 'Key Tidak Valid'
      ], RestController::HTTP_UNAUTHORIZED);
      exit();
    }

    // cek key token
    $cek = $this->db->get_where('tokens', ['token' => $key])->num_rows();
    if($cek < 1){
        $this->response([
        'status' => false,
        'message' => 'Key Tidak Valid'
      ], RestController::HTTP_UNAUTHORIZED);
      exit();
    }


    // cek level
    // $userdata = $this->sesion->cek_userdata_api_member($key);
    // if ($userdata == null) {
    //   $this->response([
    //     'status' => false,
    //     'message' => 'Key Tidak Valid'
    //   ], RestController::HTTP_UNAUTHORIZED);
    //   exit();
    // }
    // $this->id = $userdata['id'];

    // import model
    $this->load->model('api/aktifitasModel', 'model');
    $this->check_cors = true;
  }
}
