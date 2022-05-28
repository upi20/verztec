<?php
defined('BASEPATH') or exit('No direct script access allowed');

class KategoriKeanggotaanModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kategori_keanggotaan a");
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

        $this->db->order_by('no_urut', 'asc');

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


    public function getKategoriKeanggotaan($id)
    {
        $result = $this->db->get_where("kategori_keanggotaan", ['id' => $id])->row_array();
        return $result;
    }

    public function getIsiKategoriKeanggotaanBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kategori_keanggotaan a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }


    public function insert($nama, $keterangan, $no_urut, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("kategori_keanggotaan", [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'no_urut' => $no_urut,
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
            $data_baru = "Menambah data baru dengan isi nama = $nama, keterangan = $keterangan, no urut = $no_urut, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $nama, $keterangan, $no_urut, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiKategoriKeanggotaanBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('kategori_keanggotaan', [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'no_urut' => $no_urut,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], no urut = $sebelumnya[no_urut], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, keterangan = $keterangan, no urut = $no_urut, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiKategoriKeanggotaanBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('kategori_keanggotaan', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], keterangan = $sebelumnya[keterangan], no urut = $sebelumnya[no_urut], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }
}
