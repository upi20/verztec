<?php
defined('BASEPATH') or exit('No direct script access allowed');

class TermManagementModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("
            a.*,
            b.*, 
            c.menu_id as parent_id, c.menu_nama as parent,
            IF(a.status = '0' , 'Dibuat', IF(a.status = '1' , 'Aktif', IF(a.status = '2' , 'Tidak Aktif', 'Tidak Diketahui'))) as status_str
            ");
        $this->db->from("term_management a");
        $this->db->join("menu b", "a.id_menu = b.menu_id", "left");
        $this->db->join('menu c', 'c.menu_id = b.menu_menu_id', 'left');
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

        $this->db->order_by("a.created_at", "DESC");
        $this->db->order_by("a.id", "DESC");



        // initial data table
        // if ($draw == 1) {
        //     $this->db->limit(10, 0);
        // }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                c.menu_nama LIKE '%$cari%' or
                b.menu_nama LIKE '%$cari%' or
                a.nama LIKE '%$cari%' or
                a.keterangan LIKE '%$cari%' or
                IF(a.status = '0' , 'Dibuat', IF(a.status = '1' , 'Aktif', IF(a.status = '2' , 'Tidak Aktif', 'Tidak Diketahui'))) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getTermManagement($id)
    {
        $result = $this->db->get_where("term_management", ['id' => $id])->row_array();
        return $result;
    }

    public function getDataParent()
    {
        $exe             = $this->db->get_where('menu', ['menu_menu_id' => 0]);

        return $exe->result_array();
    }


    public function getDataChild($id)
    {
        $exe             = $this->db->get_where('menu', ['menu_menu_id' => $id]);

        return $exe->result_array();
    }


    public function getIsiTermBy($where = [null])
    {
        $this->db->select("
            a.*,
            b.*, 
            c.menu_id as parent_id, c.menu_nama as parent,
            IF(a.status = '0' , 'Dibuat', IF(a.status = '1' , 'Aktif', IF(a.status = '2' , 'Tidak Aktif', 'Tidak Diketahui'))) as status_str
            ");
        $this->db->from("term_management a");
        $this->db->join("menu b", "a.id_menu = b.menu_id", "left");
        $this->db->join('menu c', 'c.menu_id = b.menu_menu_id', 'left');
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($menu=null, $sub_menu = null, $nama=null, $keterangan=null, $status=null)
    {
        $this->db->trans_start();
        if ($sub_menu != null) {
            $id_menu = $sub_menu;
        } else {
            $id_menu = $menu;
        }

        $result = $this->db->insert("term_management", [
            'id_menu' => $id_menu,
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $menu = $this->getIsiTableById('menu', ['menu_id' => $id_menu])['menu_nama'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi menu = $menu, nama = $nama, keterangan = $keterangan, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $menu=null, $sub_menu = null, $nama=null, $keterangan=null, $status=null)
    {
        $this->db->trans_start();
        if ($sub_menu != null) {
            $id_menu = $sub_menu;
        } else {
            $id_menu = $menu;
        }
        $sebelumnya = $this->getIsiTermBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('term_management', [
            'id_menu' => $id_menu,
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $menu = $this->getIsiTableById('menu', ['menu_id' => $id_menu])['menu_nama'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah menu = $sebelumnya[menu_nama], nama = $sebelumnya[nama], $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi menu = $menu, nama = $nama, keterangan = $keterangan, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiTermBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('term_management', [
            'status' => 3,
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah menu = $sebelumnya[menu_nama], nama = $sebelumnya[nama], $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }
}
