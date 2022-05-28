<?php
defined('BASEPATH') or exit('No direct script access allowed');

class TemplateModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("template_download a");
        $this->db->where("a.status <> 3");
        $this->db->order_by('kategori', 'asc');
        $this->db->order_by('no_urut', 'asc');

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
                a.no_urut LIKE '%$cari%' or
                a.nama LIKE '%$cari%' or
                a.berkas LIKE '%$cari%' or
                IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getIsiTemplateBy($where = [null])
    {
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("template_download a");
        $this->db->where($where);

        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function insert($tahapan, $kategori, $no_urut, $nama, $status)
    {
        $this->db->trans_start();

        $ubah_berkas = false;
        if (isset($_FILES['berkas']) != false) {
            if ($_FILES['berkas']['name'] != '') {
                // simpan berkas
                $berkas = $this->saveFile('berkas');
                $ubah_berkas = true;
            }
        }
         $data = [
            'tahapan' => $tahapan,
            'kategori' => $kategori,
            'no_urut' => $no_urut,
            'nama' => $nama,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika bahan diubah
        if ($ubah_berkas) {
            $data['berkas'] = $berkas['data'];
        }
        $result = $this->db->insert("template_download", $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi kategori = [".$kategori."], no urut = [".$no_urut."], nama = [".$nama."], berkas = [".$berkas['data']."], status = ".$status;
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $tahapan, $kategori, $no_urut, $nama, $status)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiTemplateBy(['a.id' => $id]);

        $ubah_berkas = false;
        if (isset($_FILES['berkas']) != false) {
            if ($_FILES['berkas']['name'] != '') {
                // simpan bahan
                $berkas = $this->saveFile('berkas');
                $ubah_berkas = true;

                $get_berkas = $this->db->select('berkas')->from('template_download')->where('id', $id)->get()->row_array();
                $this->db->reset_query();
                // delete berkas
                if ($get_berkas != null) {
                    if ($get_berkas['berkas'] != null && $get_berkas['berkas'] != '') {
                        $this->deleteFile($get_berkas['berkas']);
                    }
                }
            }
        }

        $data = [
            'tahapan' => $tahapan,
            'kategori' => $kategori,
            'no_urut' => $no_urut,
            'nama' => $nama,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ];
        // jika bahan diubah
        if ($ubah_berkas) {
            $data['berkas'] = $berkas['data'];
        }else{
            $berkas['data'] = '';
        }
        $this->db->where('id', $id);
        $result = $this->db->update('template_download', $data);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Aktif' : ($status == 2 ? $status = 'Tidak Aktif' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah  kategori = $sebelumnya[kategori], no urut = $sebelumnya[no_urut], nama = $sebelumnya[nama], berkas = $sebelumnya[berkas], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah data dengan isi kategori = [".$kategori."], no urut = [".$no_urut."], nama = [".$nama."], berkas = [".$berkas['data']."], status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiTemplateBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('template_download', [
            'status' => 3
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah no urut = $sebelumnya[no_urut], nama = $sebelumnya[nama], berkas = $sebelumnya[berkas], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    private function saveFile($input)
    {
        $config['upload_path']          = './files/master/template/';
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
        if (file_exists('./files/master/template/' . $file)) {
            $res_foto = unlink('./files/master/template/' . $file);
        }
        return $res_foto;
    }
}
