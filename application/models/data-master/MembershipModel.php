<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MembershipModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("jenis_membership a");
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

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(a.nama LIKE '%$cari%' or a.keterangan LIKE '%$cari%' or IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getMembership($id)
    {
        $result = $this->db->get_where("jenis_membership", ['id' => $id])->row_array();
        return $result;
    }

    public function getIsiMembershipBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("jenis_membership a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($nama, $keterangan, $status)
    {
        $this->db->trans_start();
        // $id_level = $this->insert_level($nama);

        $this->db->reset_query();
        $result = $this->db->insert("jenis_membership", [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status,
            // 'id_level' =>  0,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama = $nama, keterangan = $keterangan, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();

        return $result;
    }


    public function update($id, $nama, $keterangan, $status)
    {
        $this->db->trans_start();
        // $id_level = $this->db->select('id_level')
        //     ->from('jenis_membership')
        //     ->where('id', $id)
        //     ->get()->row_array();
        // $id_level = isset($id_level['id_level']) ? $id_level['id_level'] : null;
        // if ($id_level == null) {
        //     $id_level = $this->insert_level($nama);
        // } else {
        //     $this->update_level($id_level, $nama);
        // }

        $sebelumnya = $this->getIsiMembershipBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('jenis_membership', [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status,
            // 'id_level' => 0,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, keterangan = $keterangan, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    private function insert_level($nama)
    {
        $this->db->insert('level', [
            'lev_nama' => $nama,
            'lev_keterangan' => "Level Untuk Jenis Membership $nama",
            'lev_status' => 'Aktif'
        ]);

        return  $this->db->insert_id();
    }

    private function update_level($id, $nama)
    {
        $this->db->where('lev_id', $id);
        return $this->db->update('level', [
            'lev_nama' => $nama,
            'lev_keterangan' => "Level Untuk Jenis Membership $nama",
            'lev_status' => 'Aktif'
        ]);
    }

    private function delete_level($id)
    {
        $this->db->where('lev_id', $id);
        return  $this->db->delete('level');
    }

    public function delete($id)
    {
        // $this->db->where('id', $id);
        $this->db->trans_start();
        // $id_level = $this->db->select('id_level')
        //     ->from('jenis_membership')
        //     ->where('id', $id)
        //     ->get()->row_array();
        // $id_level = isset($id_level['id_level']) ? $id_level['id_level'] : null;
        // if ($id_level != null) {
        //     $this->delete_level($id);
        // }

        $sebelumnya = $this->getIsiMembershipBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('jenis_membership', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }
}
