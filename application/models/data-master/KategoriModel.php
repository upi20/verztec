<?php
defined('BASEPATH') or exit('No direct script access allowed');

class KategoriModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, b.menu_nama as menu, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kategori_p2pk a");
        $this->db->join("menu b", "b.menu_id = a.id_menu");
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

    public function getKategori($id)
    {
        $result = $this->db->get_where("kategori_p2pk", ['id' => $id])->row_array();
        return $result;
    }

    public function getIsiKategoriBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kategori_p2pk a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($id_menu, $nama, $keterangan, $status)
    {
        $this->db->trans_start();
        // $id_level = $this->insert_level($nama);

        $this->db->reset_query();
        $result = $this->db->insert("kategori_p2pk", [
            'id_menu' => $id_menu,
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


    public function update($id, $id_menu, $nama, $keterangan, $status)
    {
        $this->db->trans_start();

        $sebelumnya = $this->getIsiKategoriBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('kategori_p2pk', [
            'id_menu' => $id_menu,
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status,
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



    public function delete($id)
    {
        // $this->db->where('id', $id);
        $this->db->trans_start();

        $sebelumnya = $this->getIsiKategoriBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('kategori_p2pk', [
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

    public function list_menu()
    {
        $return = $this->db->select('a.menu_id as id, a.menu_nama as text')
            ->from('menu a')
            ->where('menu_status', 'Aktif')
            ->where('menu_menu_id', 0)
            ->get()
            ->result_array();
        return $return;
    }
}
