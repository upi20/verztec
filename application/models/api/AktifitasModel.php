<?php
defined('BASEPATH') or exit('No direct script access allowed');

class AktifitasModel extends Render_Model
{
  public function get_list_aktifitas()
  {
    $data = $this->db->select('id, nama, keterangan, tanggal, tempat, created_at')
      ->from('activity')
      ->where('status', 1)
      ->get();
    $return = [
      'data' => $data->result_array(),
      'length' => $data->num_rows(),
    ];
    return $return;
  }

}
