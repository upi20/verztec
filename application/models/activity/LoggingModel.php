<?php
defined('BASEPATH') or exit('No direct script access allowed');

class LoggingModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.jenis_perubahan = '1' , 'Created', IF(a.jenis_perubahan = '2' , 'Modified', IF(a.jenis_perubahan = '3' , 'Deleted', 'Tidak Diketahui'))) as jenis_str, concat(c.nama_depan, ' ', c.nama_belakang) user");
        $this->db->from("activity_log a");
        $this->db->join("users b", "a.by = b.user_id", "left");
        $this->db->join("profile c", "c.id_user = b.user_id", "left");
        $this->db->order_by("a.created_at", "desc");

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
        // if ($draw == 1) {
        //     $this->db->limit(10, 0);
        // }

        // filter
        if ($filter != null) {
            // filter date
            if ($filter['date']['start'] != null && $filter['date']['end'] != null) {
                $this->db->where("(DATE(a.created_at) BETWEEN '{$filter['date']['start']}' AND  '{$filter['date']['end']}')");
            }

            // by modul
            if ($filter['modul'] != '' or $filter['modul'] != null) {
                $this->db->where('a.modul', $filter['modul']);
            }

            // by by
            if ($filter['by'] != '' or $filter['by'] != null) {
                $this->db->where("b.user_id", $filter['by']);
            }
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.modul LIKE '%$cari%' or 
                a.data_baru LIKE '%$cari%' or 
                a.data_lama LIKE '%$cari%' or 
                concat(c.nama_depan, ' ', c.nama_belakang) LIKE '%$cari%' or 
                IF(a.jenis_perubahan = '1' , 'Created', IF(a.jenis_perubahan = '2' , 'Modified', IF(a.jenis_perubahan = '3' , 'Deleted', 'Tidak Diketahui'))) LIKE '%$cari%'
                )");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function list_modul()
    {
        $return = $this->db->select('modul as id, modul as text')
            ->from('activity_log a')
            ->group_by("a.modul")
            ->get()
            ->result_array();
        return $return;
    }

    public function list_by()
    {
        $return = $this->db->select(" a.user_id as id, concat(e.nama_depan, ' ', e.nama_belakang) as text")
            ->from('activity_log d')
            ->join('users a', 'a.user_id = d.by')
            ->join('role_users b', 'a.user_id = b.role_user_id')
            ->join('level c', 'b.role_lev_id = c.lev_id')
            ->join("profile e", "e.id_user = a.user_id", "left")
            ->group_by("d.by")
            ->get()
            ->result_array();
        return $return;
    }

    public function getLogging($id)
    {
        $result = $this->db->get_where("activity_log", ['id' => $id])->row_array();
        return $result;
    }
}
