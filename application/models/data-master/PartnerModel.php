<?php
defined('BASEPATH') or exit('No direct script access allowed');

class PartnerModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("partner a");
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

        $this->db->order_by('a.id', 'desc');

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.nama LIKE '%$cari%' or
                a.no_telepon LIKE '%$cari%' or
                a.email LIKE '%$cari%' or
                a.lokasi LIKE '%$cari%' or
                IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getPartner($id)
    {
        $result = $this->db->get_where("partner", ['id' => $id])->row_array();
        return $result;
    }

    public function getFormatHeader()
    {
        $result = $this->db->order_by('created_at','desc')->get_where("laporan_header", ['status' => 1])->row_array();
        return $result;
    }

    public function getDetail($id)
    {
        $result = $this->db->select('c.nama as nama_posisi, a.user_email, b.nama_depan, b.nama_belakang, b.jenis_kelamin, a.nik, d.nama as keanggotaan, d.keterangan as keterangan_keanggotaan, b.id as id_profil')->order_by('c.no_urut','asc')->join('posisi c', 'c.id = a.id_posisi', 'left')->join('profile b', 'b.id_user = a.user_id')->join('kategori_keanggotaan d', 'd.id = b.id_keanggotaan', 'left')->get_where("users a", ['a.id_partner' => $id])->result_array();
        return $result;
    }


    public function getIsiPartnerBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("partner a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($nama, $lokasi, $status, $no_telepon, $email)
    {
        $this->db->trans_start();
        // cek apakah ada foto yang dikirim
        $ubah_foto = false;
        if ($_FILES['photo']['name'] != '') {
            // simpan foto
            $foto = $this->saveFile();
            $ubah_foto = true;
        }

        // jika foto diubah
        if ($ubah_foto) {
            $photo = $foto['data'];
        }else{
            $photo = null;
        }

        $result = $this->db->insert("partner", [
            'nama' => $nama,
            'lokasi' => $lokasi,
            'status' => $status,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'photo' => $photo,
            'created_at' => date("Y-m-d H:i:s"),
        ]);

        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = $status == 1 ? $status = 'Aktif' : ($status == 0 ? $status = 'Tidak Aktif' : 'Tidak Diketahui');
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama = $nama, lokasi = $lokasi, no_telepon = $no_telepon, email = $email, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $nama, $lokasi, $status, $no_telepon, $email)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiPartnerBy(['id' => $id]);

        $ubah_foto = false;
        if ($_FILES['photo']['name'] != '') {
            // simpan foto
            $foto = $this->saveFile();
            $ubah_foto = true;
            $get_photo = $this->db->select('photo')->from('partner')->where('id', $id)->get()->row_array();
            $this->db->reset_query();
            // delete foto
            if ($get_photo != null) {
                if ($get_photo['photo'] != null && $get_photo['photo'] != '') {
                    $this->deleteFile($get_photo['photo']);
                }
            }
        }

        // jika foto diubah
        if ($ubah_foto) {
            $photo = $foto['data'];
        }else{
            $get_photo = $this->db->select('photo')->from('partner')->where('id', $id)->get()->row_array();
            $photo = $get_photo['photo'];
        }

        $this->db->where('id', $id);
        $result = $this->db->update('partner', [
            'nama' => $nama,
            'lokasi' => $lokasi,
            'status' => $status,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'photo' => $photo,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = $status == 1 ? $status = 'Aktif' : ($status == 0 ? $status = 'Tidak Aktif' : 'Tidak Diketahui');
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], lokasi = $sebelumnya[lokasi], no_telepon = $sebelumnya[no_telepon], email = $sebelumnya[email], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi nama = $nama, lokasi = $lokasi, no_telepon = $no_telepon, email = $email, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiPartnerBy(['id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('partner', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama = $sebelumnya[nama], lokasi = $sebelumnya[lokasi], no_telepon = $sebelumnya[no_telepon], email = $sebelumnya[email], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    private function saveFile()
    {
        $config['upload_path']          = './files/partner/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('photo')) {
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

    private function deleteFile($file)
    {
        $res_foto = true;
        if (file_exists('./files/partner/' . $file)) {
            $res_foto = unlink('./files/partner/' . $file);
        }
        return $res_foto;
    }
}
