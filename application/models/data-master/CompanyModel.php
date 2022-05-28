<?php
defined('BASEPATH') or exit('No direct script access allowed');

class CompanyModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, b.nama as resiko, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("client_company a");
        $this->db->join("resiko b", "a.id_resiko = b.id");
        $this->db->where('a.status <>', 3);
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
                a.nama LIKE '%$cari%' or
                a.alamat LIKE '%$cari%' or
                a.no_telepon LIKE '%$cari%' or
                a.email LIKE '%$cari%' or
                b.nama LIKE '%$cari%' or
                a.remark LIKE '%$cari%' or
                IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getCompany($id)
    {
        $result = $this->db->get_where("client_company", ['id' => $id])->row_array();
        return $result;
    }

    public function getResikoByName($nama)
    {
        $result = $this->db->get_where("resiko", [`nama like %$nama%`])->row_array();
        return $result;
    }

    public function insert_resiko($nama, $status)
    {
        $result = $this->db->insert("resiko", [
            'nama' => $nama,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        $result = $this->db->insert_id();
        return $result;
    }


    public function getIsiCompanyBy($where = [null])
    {
        $this->db->select("a.*, b.nama as resiko, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("client_company a");
        $this->db->join("resiko b", "a.id_resiko = b.id");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($nama, $alamat, $no_telepon, $email, $resiko, $remark, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("client_company", [
            'nama' => $nama,
            'alamat' => $alamat,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'id_resiko' => $resiko,
            'remark' => $remark,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $resiko = $this->getIsiTableById('resiko', ['id' => $resiko])['nama'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama = $nama, alamat = $alamat, no_telepon = $no_telepon, resiko = $resiko, remark = $remark, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $nama, $alamat, $no_telepon, $email, $resiko, $remark, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiCompanyBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('client_company', [
            'nama' => $nama,
            'alamat' => $alamat,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'id_resiko' => $resiko,
            'remark' => $remark,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $resiko = $this->getIsiTableById('resiko', ['id' => $resiko])['nama'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], alamat = $sebelumnya[alamat], no_telepon = $sebelumnya[no_telepon], resiko = $sebelumnya[resiko], remark = $sebelumnya[remark], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, alamat = $alamat, no_telepon = $no_telepon, resiko = $resiko, remark = $remark, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiCompanyBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('client_company', [

            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], alamat = $sebelumnya[alamat], no_telepon = $sebelumnya[no_telepon], resiko = $sebelumnya[resiko], remark = $sebelumnya[remark], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    public function listResiko()
    {
        $return = $this->db->select('a.id, a.nama as text')
            ->from('resiko a')
            ->where('status', '1')
            ->get()
            ->result_array();
        return $return;
    }
}
