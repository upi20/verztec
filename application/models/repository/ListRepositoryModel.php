<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ListRepositoryModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        // PIlih tabel
        $this->db->select("a.*,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("repository a");
        $this->db->where("a.status <> 3");
        $this->db->order_by('a.created_at', 'desc');

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

        // if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
        //     $this->db->where("c.id_partner", $idpart);
        // }

        // filter
        if ($filter != null) {
            // filter date
            if ($filter['date']['start'] != null && $filter['date']['end'] != null) {
                $this->db->where("(DATE(a.created_at) BETWEEN '{$filter['date']['start']}' AND  '{$filter['date']['end']}')");
            }

            // by by
            if ($filter['judul'] != '') {
                $this->db->where("a.judul", $filter['judul']);
            }
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.judul LIKE '%$cari%' or
                a.keterangan LIKE '%$cari%' or
                a.attachment LIKE '%$cari%'
                )");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getIsiRepositoryBy($where = [null])
    {
        $this->db->select("a.*,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("repository a");
        $this->db->where($where);

        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($kategori, $judul, $keterangan, $status)
    {
        $this->db->trans_start();

        $ubah_attachment = false;
        if (isset($_FILES['attachment'])) {
            if ($_FILES['attachment']['name'] != '') {
                // simpan attachment
                $attachment = $this->saveFile();
                $ubah_attachment = true;
            }

            // $get_attachment = $this->db->select('attachment')->from('repository')->where('id', $id_profile)->get()->row_array();
            // $this->db->reset_query();
            // // delete attachment
            // if ($get_attachment != null) {
            //     if ($get_attachment['attachment'] != null && $get_attachment['attachment'] != '') {
            //         $this->deleteFile($get_attachment['attachment']);
            //     }
            // }
        }
        $data = [
            'kategori' => $kategori,
            'judul' => $judul,
            'keterangan' => $keterangan,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika attachment diubah
        if ($ubah_attachment) {
            $data['attachment'] = $attachment['data'];
        }
        $result = $this->db->insert("repository", $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama artikel = [$judul], keterangan = [$keterangan], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $kategori, $judul, $keterangan, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiRepositoryBy(['a.id' => $id]);

        $ubah_attachment = false;
        if (isset($_FILES['attachment']) != false) {
            if ($_FILES['attachment']['name'] != '') {
                // simpan attachment
                $attachment = $this->saveFile();
                $ubah_attachment = true;

                $get_attachment = $this->db->select('attachment')->from('repository')->where('id', $id)->get()->row_array();
                $this->db->reset_query();
                // delete attachment
                if ($get_attachment != null) {
                    if ($get_attachment['attachment'] != null && $get_attachment['attachment'] != '') {
                        $this->deleteFile($get_attachment['attachment']);
                    }
                }
            }
        }
        $data = [
            'kategori' => $kategori,
            'judul' => $judul,
            'keterangan' => $keterangan,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika attachment diubah
        if ($ubah_attachment) {
            $data['attachment'] = $attachment['data'];
        }
        $this->db->where('id', $id);
        $result = $this->db->update('repository', $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama artikel = $sebelumnya[judul], keterangan = $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Menambah data baru dengan isi nama artikel = [$judul], keterangan = [$keterangan], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiRepositoryBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('repository', [

            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama artikel = $sebelumnya[judul], keterangan = $sebelumnya[keterangan], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    public function list_profile()
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $this->db->select("a.id, concat(a.nama_depan,' ', a.nama_belakang) as text");
        $this->db->from('profile a');
        $this->db->join("users b", "a.id_user = b.user_id", "left");
        $this->db->where('status', '1');
        if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
            $this->db->where("b.id_partner", $idpart);
        }
        $return = $this->db->get()->result_array();
        return $return;
    }

    public function list_judul()
    {
        $this->db->select("a.id, a.judul as text");
        $this->db->from('repository a');
        $this->db->where('status', '1');
        $return = $this->db->get()->result_array();
        return $return;
    }

    private function saveFile()
    {
        $config['upload_path']          = './files/repository/';
        // $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['allowed_types']        = 'pdf|docx|doc|xls|xlsx';
        // $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = false;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('attachment')) {
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
        if (file_exists('./files/repository/' . $file)) {
            $res_foto = unlink('./files/repository/' . $file);
        }
        return $res_foto;
    }
}
