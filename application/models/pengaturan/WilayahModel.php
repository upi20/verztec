<?php
defined('BASEPATH') or exit('No direct script access allowed');

class WilayahModel extends Render_Model
{

    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // select tabel
        $this->db->select("*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("wilayah a");

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
            $this->db->where("(nama LIKE '%$cari%' or IF(wilayah.status = '0' , 'Tidak Aktif', IF(wilayah.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getWilayah($id)
    {
        $result = $this->db->get_where("wilayah", ['id' => $id])->row_array();
        return $result;
    }


    public function insert($nama, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("wilayah", [
            'nama' => $nama,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
         if ($result) {
            $modul = "Wilayah";
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


    public function update($id, $nama, $status)
    {
        $this->db->trans_start();

        $sebelumnya = $this->getIsiWilayahBy(['id' => $id]);
        
        $this->db->where('id', $id);

        $result = $this->db->update('wilayah', [
            'nama' => $nama,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);

        if ($result) {
            $modul = "Wilayah";
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
        $sebelumnya = $this->getIsiWilayahBy(['id' => $id]);
        $result = $this->db->delete('wilayah', ['id' => $id]);
        if ($result) {
            $modul = "Wilayah";
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    public function getIsiWilayahBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("wilayah a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    // dipakai Registrasi
    public function cari($key)
    {
        $this->db->select('a.id as id, a.nama as text');
        $this->db->from('wilayah a');
        $this->db->where("nama LIKE '%$key%' or jumlah_klik LIKE '%$key%'");
        return $this->db->get()->result_array();
    }
}
