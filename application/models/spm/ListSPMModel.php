<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ListSPMModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        // PIlih tabel
        $this->db->select("a.*,
        b.nama as trainer,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("spm a");
        $this->db->join("trainer b", "a.id_trainer = b.id", "left");
        $this->db->where("a.status", 1);

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

        // filter
        if ($filter != null) {
            // filter date
            if ($filter['date']['start'] != null && $filter['date']['end'] != null) {
                $this->db->where("(DATE(a.created_at) BETWEEN '{$filter['date']['start']}' AND  '{$filter['date']['end']}')");
            }

            // by by
            if ($filter['trainer'] != '') {
                $this->db->where("a.id_trainer", $filter['trainer']);
            }
        }

        // if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
        //     $this->db->where("c.id_partner", $idpart);
        // }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                a.judul LIKE '%$cari%' or
                b.nama LIKE '%$cari%' or
                a.bahan LIKE '%$cari%' or
                a.absensi LIKE '%$cari%' or
                IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getIsiSpmBy($where = [null])
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $this->db->select("a.*,
        b.nama as trainer,
        IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("spm a");
        $this->db->join("trainer b", "a.id_trainer = b.id", "left");
        $this->db->where($where);

        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($judul, $trainer, $status)
    {
        $this->db->trans_start();

        $ubah_bahan = false;
        if (isset($_FILES['bahan']) != false) {
            if ($_FILES['bahan']['name'] != '') {
                // simpan bahan
                $bahan = $this->saveFile('bahan');
                $ubah_bahan = true;
            }
        }
        $ubah_absensi = false;
        if (isset($_FILES['absensi']) != false) {
            if ($_FILES['absensi']['name'] != '') {
                // simpan absensi
                $absensi = $this->saveFile('absensi');
                $ubah_absensi = true;
            }
        }
        $data = [
            'judul' => $judul,
            'id_trainer' => $trainer,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika bahan diubah
        if ($ubah_bahan) {
            $data['bahan'] = $bahan['data'];
        }
        if ($ubah_absensi) {
            $data['absensi'] = $absensi['data'];
        }
        $result = $this->db->insert("spm", $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $id_trainer = $this->getIsiTableById('trainer', ['id' => $trainer]);
            $id_trainer != null ? $id_trainer = $id_trainer['nama'] : $id_trainer = '';
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi nama SPM = [$judul], trainer = [$id_trainer], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $judul, $trainer, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiSpmBy(['a.id' => $id]);

        $ubah_bahan = false;
        if (isset($_FILES['bahan']) != false) {
            if ($_FILES['bahan']['name'] != '') {
                // simpan bahan
                $bahan = $this->saveFile('bahan');
                $ubah_bahan = true;

                $get_bahan = $this->db->select('bahan')->from('spm')->where('id', $id)->get()->row_array();
                $this->db->reset_query();
                // delete bahan
                if ($get_bahan != null) {
                    if ($get_bahan['bahan'] != null && $get_bahan['bahan'] != '') {
                        $this->deleteFile($get_bahan['bahan']);
                    }
                }
            }
        }
        $ubah_absensi = false;
        if (isset($_FILES['absensi']) != false) {
            if ($_FILES['absensi']['name'] != '') {
                // simpan absensi
                $absensi = $this->saveFile('absensi');
                $ubah_absensi = true;

                $get_absensi = $this->db->select('absensi')->from('spm')->where('id', $id)->get()->row_array();
                $this->db->reset_query();
                // delete absensi
                if ($get_absensi != null) {
                    if ($get_absensi['absensi'] != null && $get_absensi['absensi'] != '') {
                        $this->deleteFile($get_absensi['absensi']);
                    }
                }
            }
        }
        $data = [
            'judul' => $judul,
            'id_trainer' => $trainer,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika bahan diubah
        if ($ubah_bahan) {
            $data['bahan'] = $bahan['data'];
        }
        if ($ubah_absensi) {
            $data['absensi'] = $absensi['data'];
        }
        $this->db->where('id', $id);
        $result = $this->db->update('spm', $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $id_trainer = $this->getIsiTableById('trainer', ['id' => $trainer]);
            $id_trainer != null ? $id_trainer = $id_trainer['nama'] : $id_trainer = '';
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah nama SPM = $sebelumnya[judul], trainer = $sebelumnya[trainer], status = $sebelumnya[status_str]";
            $data_baru = "Menambah data baru dengan isi nama SPM = [$judul], trainer = [$id_trainer], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiSpmBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('spm', [

            'status' => '2',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah nama SPM = $sebelumnya[judul], trainer = $sebelumnya[trainer], status = $sebelumnya[status_str]";
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

    public function list_trainer()
    {
        $this->db->select("a.id, a.nama as text");
        $this->db->from('trainer a');
        $this->db->where('a.status', '1');
        $return = $this->db->get()->result_array();
        return $return;
    }

    private function saveFile($input)
    {
        $config['upload_path']          = './files/spm/';
        // $config['allowed_types']        = 'gif|jpg|png|jpeg|JPG|PNG|JPEG';
        $config['allowed_types']        = 'pdf|docx|doc|xlsx|xls|ppt|pptx';
        // $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['overwrite']            = false;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload($input)) {
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
        if (file_exists('./files/spm/' . $file)) {
            $res_foto = unlink('./files/spm/' . $file);
        }
        return $res_foto;
    }
}
