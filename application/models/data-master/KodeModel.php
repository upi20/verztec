<?php
defined('BASEPATH') or exit('No direct script access allowed');

class KodeModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        // $this->db->select("a.*, b.menu_nama as menu, c.nama as kategori, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->select("a.*, b.menu_nama as menu, a.id, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kode a");
        // $this->db->join("kategori_p2pk c", "c.id = a.id_kategori", "left");
        $this->db->join("menu b", "b.menu_id = a.id_menu", "left");
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

    public function getKode($id, $id_menu)
    {
        if($id_menu == 2){
            $result = $this->db->select('a.*')->join('kategori_keanggotaan b', 'b.id = a.id_kategori','left')->get_where("kode a", ['a.id' => $id])->row_array();
        }else{
            $result = $this->db->select('a.*, b.id_menu')->join('kategori_p2pk b', 'b.id = a.id_kategori','left')->get_where("kode a", ['a.id' => $id])->row_array();
        }
        return $result;
    }

    public function getIsiKodeBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("kode a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($id_menu, $id_kategori, $kode, $bulan, $tahun, $jumlah, $status)
    {
        $this->db->trans_start();

        $this->db->reset_query();

        if($id_menu == 2){
            $get_kategori = $this->db->get_where('kategori_keanggotaan',['id' => $id_kategori])->row_array();
            $kode_kategori = $get_kategori['nama'];
            $keterangan_kategori = $get_kategori['keterangan'];
        }else{
            $get_kategori = $this->db->get_where('kategori_p2pk',['id' => $id_kategori])->row_array();            
            $kode_kategori = $get_kategori['nama'];
            $keterangan_kategori = $get_kategori['keterangan'];
        }
        $result = $this->db->insert("kode", [
            'id_menu' => $id_menu,
            'id_kategori' => $id_kategori,
            'kode_kategori' => $kode_kategori,
            'keterangan_kategori' => $keterangan_kategori,
            'kode' => $kode,
            'bulan' => $bulan,
            'tahun' => $tahun,
            'jumlah' => $jumlah,
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
            $data_baru = "Menambah data baru dengan isi kode = $kode, bulan = $bulan, tahun = $tahun, jumlah = $jumlah, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();

        return $result;
    }


    public function update($id, $id_menu, $id_kategori, $kode, $bulan, $tahun, $jumlah, $status)
    {
        if($id_menu == 2){
            $get_kategori = $this->db->get_where('kategori_keanggotaan',['id' => $id_kategori])->row_array();
            $kode_kategori = $get_kategori['nama'];
            $keterangan_kategori = $get_kategori['keterangan'];
        }else{
            $get_kategori = $this->db->get_where('kategori_p2pk',['id' => $id_kategori])->row_array();            
            $kode_kategori = $get_kategori['nama'];
            $keterangan_kategori = $get_kategori['keterangan'];
        }

        $this->db->trans_start();

        $sebelumnya = $this->getIsiKodeBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('kode', [
            'id_menu' => $id_menu,
            'id_kategori' => $id_kategori,
            'kode_kategori' => $kode_kategori,
            'keterangan_kategori' => $keterangan_kategori,
            'kode' => $kode,
            'bulan' => $bulan,
            'tahun' => $tahun,
            'jumlah' => $jumlah,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah kode = $sebelumnya[kode], bulan = $sebelumnya[bulan], tahun = $sebelumnya[tahun], jumlah = $sebelumnya[jumlah], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi kode = $kode, bulan = $bulan, tahun = $tahun, jumlah = $jumlah, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }



    public function delete($id)
    {
        $this->db->trans_start();

        $sebelumnya = $this->getIsiKodeBy(['id' => $id]);
        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('kode', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah kode = $sebelumnya[kode], bulan = $sebelumnya[bulan], tahun = $sebelumnya[tahun], jumlah = $sebelumnya[jumlah], status = $sebelumnya[status_str]";
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

    public function list_kategori($id_menu=null)
    {
        $return = $this->db->select('a.id, a.keterangan as text')
            ->from('kategori_p2pk a')
            ->where('id_menu', $id_menu)
            ->get()
            ->result_array();
        return $return;
    }

     public function list_kategori_anggota($id_menu=null)
    {
        $return = $this->db->select('a.id, a.keterangan as text')
            ->from('kategori_keanggotaan a')
            ->where('status', 1)
            ->get()
            ->result_array();
        return $return;
    }
    
}
