<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MasterModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        // PIlih tabel
        $this->db->select("a.*,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("activity a");
        $this->db->where("a.status <> 3");

        // order by
        if ($order['order'] != null) {
            $columns = $order['columns'];
            $dir = $order['order'][0]['dir'];
            $order = $order['order'][0]['column'];
            $columns = $columns[$order];

            $order_colum = $columns['data'];
            $this->db->order_by($order_colum, $dir);
        }

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
        //     $this->db->where("c.id_partner", $idpart);
        // }

        // filter
        if ($filter != null) {
            // filter date
            if ($filter['date']['start'] != null && $filter['date']['end'] != null) {
                $this->db->where("(DATE(a.tanggal) BETWEEN '{$filter['date']['start']}' AND  '{$filter['date']['end']}')");
            }

            // by by
            if ($filter['judul'] != '') {
                $this->db->where("a.judul", $filter['judul']);
            }
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.nama LIKE '%$cari%' or
                a.keterangan LIKE '%$cari%' or
                a.tempat LIKE '%$cari%'
                )");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getIsiActivityBy($where = [null])
    {
        $this->db->select("a.*,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("activity a");
        $this->db->where($where);

        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($nama, $keterangan, $tanggal, $tempat, $status)
    {
        $this->db->trans_start();

        $data = [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'tanggal' => $tanggal,
            'tempat' => $tempat,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        $result = $this->db->insert("activity", $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama aktifitas = [$nama], keterangan = [$keterangan], tanggal = $tanggal, tempat = [$tempat], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $nama, $keterangan, $tanggal, $tempat, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiActivityBy(['a.id' => $id]);

        $data = [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'tanggal' => $tanggal,
            'tempat' => $tempat,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        $this->db->where('id', $id);
        $result = $this->db->update('activity', $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama aktifitas = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], tanggal = $sebelumnya[tanggal], tempat = $sebelumnya[tempat], status = $sebelumnya[status_str]";
            $data_baru = "Menambah data baru dengan isi nama aktifitas = [$nama], keterangan = [$keterangan], tanggal = $tanggal, tempat = [$tempat], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiActivityBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('activity', [

            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama aktifitas = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], tanggal = $sebelumnya[tanggal], tempat = $sebelumnya[tempat], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    public function list_profile()
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $this->db->select("a.id, concat(a.nama_depan,' ', a.nama_belakang) as text");
        $this->db->from('profile a');
        $this->db->join("users b", "a.id_user = b.user_id", "left");
        $this->db->where('status', '1');
        if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
            $this->db->where("b.id_partner", $idpart);
        }
        $return = $this->db->get()->result_array();
        return $return;
    }

    public function list_judul()
    {
        $this->db->select("a.id, a.judul as text");
        $this->db->from('activity a');
        $this->db->where('status', '1');
        $return = $this->db->get()->result_array();
        return $return;
    }

    private function saveFile()
    {
        $config['upload_path']          = './files/activity/';
        // $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['allowed_types']        = 'pdf|docx|doc|xls|xlsx';
        // $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = false;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('attachment')) {
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
        if (file_exists('./files/activity/' . $file)) {
            $res_foto = unlink('./files/activity/' . $file);
        }
        return $res_foto;
    }
}
