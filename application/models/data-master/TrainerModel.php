<?php
defined('BASEPATH') or exit('No direct script access allowed');

class TrainerModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        // PIlih tabel
        $this->db->select("a.*, 
        concat(b.nama_depan,' ', b.nama_belakang) as profile,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("trainer a");
        $this->db->join("profile b", "a.id_profile = b.id", "left");
        $this->db->join("users c", "b.id_user = c.user_id", "left");
        $this->db->where("a.status <>", 3);

        // order by
        if ($order['order'] != null) {
            $columns = $order['columns'];
            $dir = $order['order'][0]['dir'];
            $order = $order['order'][0]['column'];
            $columns = $columns[$order];

            $order_colum = $columns['data'];
            $this->db->order_by($order_colum, $dir);
        }

        if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
            $this->db->where("c.id_partner", $idpart);
        }

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.nama LIKE '%$cari%' or 
                IFNULL(a.updated_at, a.created_at) LIKE '%$cari%' or 
                IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%'
                )");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getTrainer($id)
    {
        $result = $this->db->get_where("trainer", ['id' => $id])->row_array();
        return $result;
    }

    public function getIsiTrainerBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("trainer a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }


    public function insert($nama, $id_profile, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("trainer", [
            'nama' => $nama,
            'id_profile' => $id_profile,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama = $nama, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $nama, $id_profile, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiTrainerBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('trainer', [
            'nama' => $nama,
            'id_profile' => $id_profile,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiTrainerBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('trainer', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], status = $sebelumnya[status_str]";
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
}
