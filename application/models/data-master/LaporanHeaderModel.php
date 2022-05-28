<?php
defined('BASEPATH') or exit('No direct script access allowed');

class LaporanHeaderModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("laporan_header a");
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
                a.judul LIKE '%$cari%' or
                a.keterangan_1 LIKE '%$cari%' or
                a.keterangan_2 LIKE '%$cari%' or
                IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getLaporanHeader($id)
    {
        $result = $this->db->get_where("laporan_header", ['id' => $id])->row_array();
        return $result;
    }



    public function getIsiLaporanHeaderBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("laporan_header a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($judul, $keterangan_1, $keterangan_2, $status)
    {

        // cek apakah ada foto yang dikirim
        $ubah_logo_1 = false;
        if ($_FILES['logo_1']['name'] != '') {
            // simpan foto
            $logo_1 = $this->saveFile1();
            $ubah_logo_1 = true;
        }

        if($ubah_logo_1 == true){
            $logo_1 = $logo_1['data'];
        }else{
            $logo_1 = "";
        }

        $ubah_logo_2 = false;
        if ($_FILES['logo_2']['name'] != '') {
            // simpan foto
            $logo_2 = $this->saveFile1();
            $ubah_logo_2 = true;
        }

        if($ubah_logo_2 == true){
            $ubah_logo_2 = $ubah_logo_2['data'];
        }else{
            $ubah_logo_2 = "";
        }

        $this->db->trans_start();
        $result = $this->db->insert("laporan_header", [
            'logo_1' => $logo_1,
            'logo_2' => $logo_2,
            'judul' => $judul,
            'keterangan_1' => $keterangan_1,
            'keterangan_2' => $keterangan_2,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        if ($result) {
            // $modul = $this->getMenuTitle();
            // $id = $this->db->insert_id();
            // $by = $this->getLogId();
            // $jenis_perubahan = 1;
            // $resiko = $this->getIsiTableById('resiko', ['id' => $resiko])['nama'];
            // $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            // $data_lama = "Belum ada data";
            // $data_baru = "Menambah data baru dengan isi nama = $nama, alamat = $alamat, no_telepon = $no_telepon, resiko = $resiko, remark = $remark, status = $status";
            // $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $judul, $keterangan_1, $keterangan_2, $status)
    {
        $this->db->trans_start();

          // cek apakah ada foto yang dikirim
        $ubah_logo_1 = false;
        if ($_FILES['logo_1']['name'] != '') {
            // simpan foto
            $logo_1 = $this->saveFile1();
            $ubah_logo_1 = true;
        }

        if($ubah_logo_1 == true){
            $logo_1 = $logo_1['data'];
        }else{
            $logo_1 = "";
        }

        $ubah_logo_2 = false;
        if ($_FILES['logo_2']['name'] != '') {
            // simpan foto
            $logo_2 = $this->saveFile2();
            $ubah_logo_2 = true;
        }

        if($ubah_logo_2 == true){
            $logo_2 = $logo_2['data'];
        }else{
            $logo_2 = "";
        }


        $sebelumnya = $this->getIsiLaporanHeaderBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('laporan_header', [
            'logo_1' => $logo_1,
            'logo_2' => $logo_2,
            'judul' => $judul,
            'keterangan_1' => $keterangan_1,
            'keterangan_2' => $keterangan_2,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            // $modul = $this->getMenuTitle();
            // $id = $this->db->insert_id();
            // $by = $this->getLogId();
            // $jenis_perubahan = 2;
            // $resiko = $this->getIsiTableById('resiko', ['id' => $resiko])['nama'];
            // $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            // $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], alamat = $sebelumnya[alamat], no_telepon = $sebelumnya[no_telepon], resiko = $sebelumnya[resiko], remark = $sebelumnya[remark], status = $sebelumnya[status_str]";
            // $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, alamat = $alamat, no_telepon = $no_telepon, resiko = $resiko, remark = $remark, status = $status";
            // $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiLaporanHeaderBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('laporan_header', [

            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            // $modul = $this->getMenuTitle();
            // $id = $this->db->insert_id();
            // $by = $this->getLogId();
            // $jenis_perubahan = 3;
            // $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], alamat = $sebelumnya[alamat], no_telepon = $sebelumnya[no_telepon], resiko = $sebelumnya[resiko], remark = $sebelumnya[remark], status = $sebelumnya[status_str]";
            // $data_baru = "Menghapus data lama";
            // $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    private function saveFile1()
    {
        $config['upload_path']          = './files/laporan-header/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('logo_1')) {
            return [
                'status' => true,
                'data' => $this->upload->data("file_name"),
                'message' => 'Success'
            ];
        } else {
            return [
                'status' => false,
                'data' => null,
                'message' => $this->upload->display_errors('', '')
            ];
        }
    }

    private function saveFile2()
    {
        $config['upload_path']          = './files/laporan-header/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('logo_2')) {
            return [
                'status' => true,
                'data' => $this->upload->data("file_name"),
                'message' => 'Success'
            ];
        } else {
            return [
                'status' => false,
                'data' => null,
                'message' => $this->upload->display_errors('', '')
            ];
        }
    }
}
