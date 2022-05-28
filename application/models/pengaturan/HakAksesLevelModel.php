<?php
defined('BASEPATH') or exit('No direct script access allowed');

class HakAksesLevelModel extends Render_Model
{
    public function getDataDisplay($id)
    {

        $menus = $this->db->query("select menu.menu_id, menu.menu_menu_id, menu.menu_nama, menu.menu_status, (select COUNT(*) from role_aplikasi where role_aplikasi.rola_menu_id = menu.menu_id and role_aplikasi.rola_lev_id = '$id') as akses from menu where menu_menu_id = '0'")->result_array();
        $result = [];
        foreach ($menus as $menu) {
            $menu_id = $menu['menu_id'];
            $result[] = ['menu' => $menu, 'sub_menu' => $this->db->query("select menu.menu_id, menu.menu_menu_id, menu.menu_nama, menu.menu_status, (select COUNT(*) from role_aplikasi where role_aplikasi.rola_menu_id = menu.menu_id and role_aplikasi.rola_lev_id = '$id') as akses from menu where menu_menu_id = '$menu_id' order by menu.menu_index")->result_array()];
        }

        return $result;
    }

    public function getIsiHABy($where = [null])
    {
        $this->db->select(' a.*, b.*, c.menu_id as parent_id, c.menu_nama as parent, d.lev_nama as level ');
        $this->db->join('menu b', 'b.menu_id = a.rola_menu_id');
        $this->db->join('menu c', 'c.menu_id = b.menu_menu_id', 'left');
        $this->db->join('level d', 'd.lev_id = a.rola_lev_id');
        $exe = $this->db->get_where('role_aplikasi a', $where);
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($level, $menu)
    {
        $this->db->trans_start();
        $execute =  $this->db->insert('role_aplikasi', ['rola_menu_id' => $menu, 'rola_lev_id' => $level]);
        if ($execute) {
            $modul           = $this->getMenuTitle();
            $id              = $this->db->insert_id();
            $by              = $this->getLogId();
            $jenis_perubahan = 1;
            $nama_menu     = $this->getIsiTableById('menu', ['menu_id' => $menu])['menu_nama'];
            $level = $this->getIsiTableById('level', ['lev_id' => $level])['lev_nama'];
            $data_lama       = "Belum ada data";
            $data_baru       = "Menambah data baru dengan isi menu = $nama_menu, level = $level";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $execute;
    }
    public function delete($level, $menu)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiHABy(['rola_menu_id' => $menu, 'rola_lev_id' => $level]);
        $execute =  $this->db->delete('role_aplikasi', ['rola_menu_id' => $menu, 'rola_lev_id' => $level]);
        if ($execute) {
            $modul           = $this->getMenuTitle();
            $by              = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama       = "Isi data sebelumnya adalah menu = $sebelumnya[menu_nama], level = $sebelumnya[level]";
            $data_baru       = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $execute;
    }
}
