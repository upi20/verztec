<?php
defined('BASEPATH') or exit('No direct script access allowed');

class PeristiwaModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("dtm_peristiwa a");
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

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.name LIKE '%$cari%' or
                a.kategori LIKE '%$cari%' or
                a.details LIKE '%$cari%' or
                IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getPeristiwa($id)
    {
        $result = $this->db->get_where("dtm_peristiwa", ['id' => $id])->row_array();
        return $result;
    }

    public function getIsiPeristiwaBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("dtm_peristiwa a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }


    public function insert($name, $kategori, $details, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("dtm_peristiwa", [
            'name' => $name,
            'kategori' => $kategori,
            'details' => $details,
            'status' => $status
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = $status == 1 ? $status = 'Aktif' : ($status == 0 ? $status = 'Tidak Aktif' : 'Tidak Diketahui');
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi name = $name, kategori = $kategori, details = $details, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $name, $kategori, $details, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiPeristiwaBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('dtm_peristiwa', [
            'name' => $name,
            'kategori' => $kategori,
            'details' => $details,
            'status' => $status
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = $status == 1 ? $status = 'Aktif' : ($status == 0 ? $status = 'Tidak Aktif' : 'Tidak Diketahui');
            $data_lama = "Isi data sebelumnya adalah name = $sebelumnya[name], kategori = $sebelumnya[kategori], details = $sebelumnya[details], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi name = $name, kategori = $kategori, details = $details, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiPeristiwaBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('dtm_peristiwa', [
            'status' => 3,
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah name = $sebelumnya[name], kategori = $sebelumnya[kategori], details = $sebelumnya[details], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }
}
