<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ListP2PKModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        $idu = $this->session->userdata('data')['id'];
        $idp = $this->db->select("a.id,
        (IFNULL((SELECT jenis_membership.nama FROM membership
            join jenis_membership on jenis_membership.id = membership.id_jenis_membership
            WHERE id_profile = a.id and membership.status < 2 limit 1), '')) as membership,
        (IFNULL((SELECT id FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as id_membership,
        (IFNULL((SELECT status FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as st_membership")
            ->from("profile a")
            ->where("a.id_user", $idu)
            ->get()
            ->row_array();

        // PIlih tabel
        $this->db->select("a.*,
        a.pic as id_pic,
        d.keterangan as kategori,
        concat(e.nama_depan, ' ', e.nama_belakang) as pic,
        a.id_kategori_p2pk as id_kategori,
        b.nama as client,
        c.nama as resiko,
        IF(a.status = '2' , 'Selesai', IF(a.status = '1' , 'Proses', 'Tidak Diketahui')) as status_str,
        IF(a.status_proses = '1' , 'Planning Dalam Proses', 
            IF(a.status_proses = '2' , 'Planning Selesai', 
            IF(a.status_proses = '3' , 'Proses Audit Dalam Proses', 
            IF(a.status_proses = '4' , 'Proses Audit Selesai', 
            IF(a.status_proses = '5' , 'Report Phase 1 Dalam Proses', 
            IF(a.status_proses = '6' , 'Report Phase 1 Selesai', 
            IF(a.status_proses = '7' , 'Report Phase 2 Dalam Proses', 
            IF(a.status_proses = '8' , 'Report Phase 2 Selesai', 
            IF(a.status_proses = '9' , 'Report Final Report Dalam Proses', 
            IF(a.status_proses = '10' , 'Report Final Report Selesai', 'Tidak Diketahui')))))))))) as status_proses_str,
        ");
        $this->db->from("p2pk a");
        $this->db->join("client_company b", "a.id_client = b.id", "left");
        $this->db->join("resiko c", "b.id_resiko = c.id", "left");
        $this->db->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left");
        $this->db->join("profile e", "e.id = a.pic", "left");
        $this->db->where("a.status <> 3");

        if ($idp['membership'] == "BOD") {
            $this->db->select("dpr.id_approval");
            $this->db->join('p2pk_report pr', 'a.id = pr.id_p2pk', 'left');
            $this->db->join('p2pk_report_detail dpr', 'pr.id = dpr.id_p2pk_report', 'left');
            $this->db->where('id_approval', $idp['id']);
            $this->db->where('dpr.status_kondisi_approval', 2);
            $this->db->group_by('a.id');
        }


        // order by
        if ($order['order'] != null) {
            $columns = $order['columns'];
            $dir = $order['order'][0]['dir'];
            $order = $order['order'][0]['column'];
            $columns = $columns[$order];

            $order_colum = $columns['data'];
            $this->db->order_by($order_colum, $dir);
        }
        $this->db->order_by("a.id", "DESC");
        $this->db->order_by("a.created_at", "DESC");

        // initial data table
        // if ($draw == 1) {
        //     $this->db->limit(50, 0);
        // }

        // filter
        if ($filter != null) {
            // by by
            if ($filter['status'] != '') {
                $this->db->where("a.status", $filter['status']);
            }
            if ($filter['status_proses'] != '') {
                $this->db->where("a.status_proses", $filter['status_proses']);
            }
            if ($filter['client'] != '') {
                $this->db->where("a.id_client", $filter['client']);
            }
            if ($filter['kategori'] != '') {
                $this->db->where("a.id_kategori_p2pk", $filter['kategori']);
            }
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(
                d.keterangan LIKE '%$cari%' or
                a.judul LIKE '%$cari%' or
                b.nama LIKE '%$cari%' or
                c.nama LIKE '%$cari%' or
                a.pic LIKE '%$cari%' or
                IF(a.status = '2' , 'Selesai', IF(a.status = '1' , 'Proses', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getAllDataPlanning($filter = null)
    {
        $idu = $this->session->userdata('data')['id'];
        $get_planning = $this->db->get_where('p2pk_planning', ['id_p2pk' => $filter['id_p2pk']])->result_array();
        return $get_planning;
    }

    public function getAllDataProsesAudit($filter = null)
    {
        $idu = $this->session->userdata('data')['id'];
        $get_proses_audit = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $filter['id_p2pk']])->result_array();
        return $get_proses_audit;
    }

    public function getAllDataReport($filter = null)
    {
        $report = $this->db->get_where('p2pk_report', ['id_p2pk' => $filter['id_p2pk']])->row_array();
        $this->db->reset_query();
        $get = $this->db->select("a.*,b.id_p2pk, concat(c.nama_depan, ' ',c.nama_belakang) as approval,
        IF(a.status = 1, 'Waiting for Document', IF(a.status = 2, 'Document Upploaded', IF(a.status = 3, 'Comment Uploaded', IF(a.status = 4, 'Final report uploaded', 'Tidak diketahui')))) as status_str")
            ->from('p2pk_report_detail a')
            ->join('p2pk_report b', 'a.id_p2pk_report = b.id', 'left')
            ->join('profile c', 'a.id_approval = c.id', 'left')
            ->where('b.id_p2pk', $filter['id_p2pk'])
            ->order_by('a.report_phase');
        if ($report['status'] < 3) {
            $get = $this->db->limit(1);
        } else {
            $get = $this->db->limit(3);
        }
        $get = $this->db->get()
            ->result_array();
        return $get;
    }
    
    public function getP2PK($filter){
        // filter
        $where = array();
        if ($filter != null) {
            // by by
            if ($filter['status'] != '') {
                $where += array('a.status' => $filter['status']);
                // $this->db->where("a.status", $filter['status']);
            }
            if ($filter['status_proses'] != '') {
                $where += array('a.status_proses' => $filter['status_proses']);
                // $this->db->where("a.status_proses", $filter['status_proses']);
            }
            if ($filter['client'] != '') {
                $where += array('a.id_client' => $filter['client']);
                // $this->db->where("a.id_client", $filter['client']);
            }
        }
        $get = $this->db->select("a.*, b.nama as client, c.nama as resiko, IF(a.status = '2' , 'Selesai', IF(a.status = '1' , 'Proses', 'Tidak Diketahui')) as status_str,
        IF(a.status_proses = '1' , 'Planning Dalam Proses', 
            IF(a.status_proses = '2' , 'Planning Selesai', 
            IF(a.status_proses = '3' , 'Proses Audit Dalam Proses', 
            IF(a.status_proses = '4' , 'Proses Audit Selesai', 
            IF(a.status_proses = '5' , 'Report Phase 1 Dalam Proses', 
            IF(a.status_proses = '6' , 'Report Phase 1 Selesai', 
            IF(a.status_proses = '7' , 'Report Phase 2 Dalam Proses', 
            IF(a.status_proses = '8' , 'Report Phase 2 Selesai', 
            IF(a.status_proses = '9' , 'Report Final Report Dalam Proses', 
            IF(a.status_proses = '10' , 'Report Final Report Selesai', 'Tidak Diketahui')))))))))) as status_proses_str,")
                        ->join('client_company b', 'b.id = a.id_client')
                        ->join('resiko c', 'c.id = b.id_resiko')
                        ->get_where('p2pk a',$where)->result_array();
        return $get;
    }

    public function getDataReport($id_p2pk = null, $where = [])
    {
        $cek = $this->db->get_where('p2pk_report', ['id_p2pk' => $id_p2pk])->num_rows();
        if ($cek == 0) {
            $this->db->insert('p2pk_report', [
                'id_p2pk' => $id_p2pk,
                'report_phase' => 1,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s"),
            ]);
            $id_p2pk_report = $this->db->insert_id();
            $this->db->insert('p2pk_report_detail', [
                'id_p2pk_report' => $id_p2pk_report,
                'report_phase' => 1,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s"),
            ]);
            $this->db->insert('p2pk_report_detail', [
                'id_p2pk_report' => $id_p2pk_report,
                'report_phase' => 2,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s"),
            ]);
        }
        $report = $this->db->get_where('p2pk_report', ['id_p2pk' => $id_p2pk])->row_array();
        $this->db->reset_query();
        $get = $this->db->select("a.*, z.kode, a.report_phase, b.id_p2pk, concat(c.nama_depan, ' ',c.nama_belakang) as approval,
        IF(a.status = 1, 'Waiting for document', IF(a.status = 2, 'Document upploaded', IF(a.status = 3, 'Submitted for approval', IF(a.status = 4, 'Waiting for comment', IF(a.status = 5, 'Approval comment uploaded', IF(a.status = 6, 'Final report uploaded', 'Tidak diketahui')))))) as status_str")
            ->from('p2pk_report_detail a')
            ->join('p2pk_report b', 'a.id_p2pk_report = b.id', 'left')
            ->join('profile c', 'a.id_approval = c.id', 'left')
            ->join('p2pk z', 'z.id = b.id_p2pk')
            ->where('b.id_p2pk', $id_p2pk)
            // ->where('a.status_kondisi_approval', 2)
            ->where($where)
            ->order_by('a.report_phase');
        if ($report['status'] < 3) {
            $get = $this->db->limit(1);
        } else {
            $get = $this->db->limit(2);
        }
        $get = $this->db->get()
            ->result_array();
        return $get;
    }

    public function cekFinalReport($id_p2pk = null){
        $get = $this->db->join('p2pk_report b', 'b.id = a.id_p2pk_report')->get_where('p2pk_report_detail a', ['a.status_kondisi_file_komentar' => 2, 'b.id_p2pk' => $id_p2pk])->num_rows();
        return $get;
    }

    public function getDataFinalReport($id_p2pk = null, $where = [])
    {
        $get = $this->db->select("*")->from('p2pk_report a')->join('p2pk_report_detail b', 'a.id = b.id_p2pk_report', 'left')->where(['a.id_p2pk' => $id_p2pk, 'b.report_phase' => '3'])->get();
        $cek = $get->num_rows();
        if ($cek == 0) {
            $this->db->reset_query();
            $get = $this->db->select("*")->from('p2pk_report a')->where(['a.id_p2pk' => $id_p2pk])->get();
            $id_p2pk_report = $get->row_array()['id'];
            $this->db->insert('p2pk_report_detail', [
                'id_p2pk_report' => $id_p2pk_report,
                'report_phase' => 3,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s"),
            ]);
        }
        $report = $this->db->get_where('p2pk_report', ['id_p2pk' => $id_p2pk])->row_array();
        $this->db->reset_query();
        $get = $this->db->select("a.*,b.id_p2pk, concat(c.nama_depan, ' ',c.nama_belakang) as approval,
       IF(a.status = 1, 'Waiting for document', IF(a.status = 2, 'Document upploaded', IF(a.status = 3, 'Submitted for approval', IF(a.status = 4, 'Final report uploaded', IF(a.status = 5, 'Approval comment uploaded', IF(a.status = 6, 'Final report uploaded', 'Tidak diketahui')))))) as status_str")
            ->from('p2pk_report_detail a')
            ->join('p2pk_report b', 'a.id_p2pk_report = b.id', 'left')
            ->join('profile c', 'a.id_approval = c.id', 'left')
            ->where('b.id_p2pk', $id_p2pk)
            ->where('a.report_phase', '3')
            ->where($where)
            ->order_by('a.report_phase');
        $get = $this->db->limit(1);
        $get = $this->db->get()
            ->row_array();
        return $get;
    }

    public function getDataReportHead($id_p2pk = null)
    {
        $get = $this->db->select("a.*,
        IF(a.status = 1, 'Phase 1 Waiting for Document', IF(a.status = 2, 'Phase 1 Submitted for Approval', IF(a.status = 3, 'Phase 2 Waiting for Document', IF(a.status = 4, 'Phase 2 Submitted for Approval', IF(a.status = 5, 'Phase 2 Comment Uploaded', IF(a.status = 6, 'Final Report Submitted', 'Tidak diketahui')))))) as status_str")
            ->from('p2pk_report a')
            ->where('a.id_p2pk', $id_p2pk)
            ->get()
            ->result_array();
        return $get;
    }

    public function getBODList($where = [])
    {
        $this->db->select("a.id, concat(a.nama_depan, ' ',a.nama_belakang, ' (', (select partner.nama from profile join users on profile.id_user = users.user_id join partner on users.id_partner = partner.id where profile.id = a.id limit 1), ')') as text")
            ->from("profile a")
            ->join("membership b", "a.id = b.id_profile", "left")
            ->join("jenis_membership c", "b.id_jenis_membership  = c.id", "left")
            ->join("users d", "a.id_user = d.user_id", "left")
            ->join("partner e", "e.id = d.id_partner", "left")
            ->where("a.status", "1")
            ->where("b.status", "1")
            ->where("c.id like", "1");
        $this->db->where($where);
        // if ($this->session->userdata('data')['level'] != 'Super Admin') {
        //     $this->db->where("e.id", $idprt);
        // }
        $return = $this->db->get()->result_array();
        return $return;
    }

    public function getIsiP2pkBy($where = [null])
    {
        $this->db->select("a.*,
        concat(e.nama_depan, ' ', e.nama_belakang) as pic,
        d.keterangan as kategori,
        b.nama as client,
        c.nama as resiko,
        IF(a.status = '2' , 'Selesai', IF(a.status = '1' , 'Proses', 'Tidak Diketahui')) as status_str,
        IF(a.status_proses = '1' , 'Planning Dalam Proses', 
        IF(a.status_proses = '2' , 'Planning Selesai', 
        IF(a.status_proses = '3' , 'Proses Audit Dalam Proses', 
        IF(a.status_proses = '4' , 'Proses Audit Selesai', 
        IF(a.status_proses = '5' , 'Report Phase 1 Dalam Proses', 
        IF(a.status_proses = '6' , 'Report Phase 1 Selesai', 
        IF(a.status_proses = '7' , 'Report Phase 2 Dalam Proses', 
        IF(a.status_proses = '8' , 'Report Phase 2 Selesai', 
        IF(a.status_proses = '9' , 'Report Final Report Dalam Proses', 
        IF(a.status_proses = '10' , 'Report Final Report Selesai', 'Tidak Diketahui')))))))))) as status_proses_str");
        $this->db->from("p2pk a");
        $this->db->join("client_company b", "a.id_client = b.id", "left");
        $this->db->join("resiko c", "b.id_resiko = c.id", "left");
        $this->db->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left");
        $this->db->join("profile e", "e.id = a.pic", "left");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = ' ';
        }

        return $exe;
    }

    public function getIsiPlanningBy($where = [null])
    {
        $this->db->select("*");
        $this->db->from("p2pk_planning a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = null;
        }

        return $exe;
    }

    public function getIsiPlanningFileBy($where = [null])
    {
        $this->db->select("*");
        $this->db->from("p2pk_planning_file a");
        $this->db->where($where);
        $this->db->where('status <>', 3);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->result_array();
        } else {
            $exe = null;
        }

        return $exe;
    }

    public function getIsiAuditBy($where = [null])
    {
        $this->db->select("*");
        $this->db->from("p2pk_proses_audit a");
        $this->db->where($where);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->row_array();
        } else {
            $exe = null;
        }

        return $exe;
    }

    public function getIsiAuditFileBy($where = [null])
    {
        $this->db->select("*");
        $this->db->from("p2pk_proses_audit_file a");
        $this->db->where($where);
        $this->db->where('status <>', 3);
        $exe = $this->db->get();
        if ($exe->num_rows() > 0) {
            $exe = $exe->result_array();
        } else {
            $exe = null;
        }

        return $exe;
    }

    public function insert($kode, $id_kategori, $id_client, $id_pic, $judul, $status)
    {
        $this->db->trans_start();
        $result = $this->db->insert("p2pk", [
            'kode' => $kode,
            'id_kategori_p2pk' => $id_kategori,
            'id_client' => $id_client,
            'pic' => $id_pic,
            'judul' => $judul,
            'status' => $status,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 1;
            $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $kode)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Proses' : ($status == 2 ? $status = 'Selesai' : 'Tidak Diketahui')));
            $data_lama = "Belum ada data";
            $data_baru = "Menambah data baru dengan isi kode = $kode, kategori = $kategori, client = $client, pic = $pic, judul = $judul, status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function update($id, $kode, $id_kategori, $id_client, $id_pic, $judul, $status)
    {
        $this->db->trans_start();
        // $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id]);
        $sebelumnya = $this->db->select("a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan,' ', e.nama_belakang) as pic, a.judul, IF(a.status = '2' , 'Selesai', IF(a.status = '1' , 'Proses', 'Tidak Diketahui')) as status_str")
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $kode)
                ->get()
                ->row_array();
        $this->db->where('id', $id);
        $result = $this->db->update('p2pk', [
            'kode' => $kode,
            'id_kategori_p2pk' => $id_kategori,
            'id_client' => $id_client,
            'pic' => $id_pic,
            'judul' => $judul,
            'status' => $status,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $kode)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
            $status = ($status == 0 ? $status = 'Dibuat' : ($status == 1 ? $status = 'Proses' : ($status == 2 ? $status = 'Selesai' : 'Tidak Diketahui')));
            $data_lama = "Isi data sebelumnya adalah kode = $sebelumnya[kode], kategori = $sebelumnya[kategori], client = $sebelumnya[client], pic = $sebelumnya[pic], $sebelumnya[judul], status = $sebelumnya[status_str]";
            $data_baru = "Mengubah isi data sebelumnya menjadi kode = $kode, kategori = $kategori, client = $client, pic = $pic, judul = $judul status = $status";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }


    public function delete($id)
    {
        $this->db->trans_start();
        $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id]);
        $this->db->where('id', $id);
        $result = $this->db->update('p2pk', [

            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $id = $this->db->insert_id();
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            $data_lama = "Isi data sebelumnya adalah kode = $sebelumnya[kode], kategori = $sebelumnya[id_kategori_p2pk], client = $sebelumnya[client], pic = $sebelumnya[pic], judul = $sebelumnya[judul], status = $sebelumnya[status_str]";
            $data_baru = "Menghapus data lama";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->trans_complete();
        return $result;
    }

    public function simpan_planning_backup($id_p2pk, $id_planning, $judul, $deskripsi, $id_doc)
    {
        $this->db->trans_start();

        $cek_new = $this->db->get_where('p2pk_planning', ['id_p2pk' => $id_p2pk]);
        if ($cek_new->num_rows() == 0) {
            $result = $this->db->insert('p2pk_planning', [
                'id_p2pk' => $id_p2pk,
                'judul' => $judul,
                'deskripsi' => $deskripsi,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s")
            ]);
            $id_planning = $this->db->insert_id();
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 1;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $pic = $this->getIsiTableById('profile', ['id' => $p2pk['id_pic']]);
                $pic = $pic['nama_depan'] . ' ' . $pic['nama_belakang'];
                $data_lama = "Belum ada data planning P2PK dari client = $client, pic = $pic";
                $data_baru = "Menambah data planning P2PK baru dengan isi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
            $this->db->reset_query();
        } else {
            $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id_p2pk]);
            $splanning = $this->getIsiPlanningBy(['a.id_p2pk' => $id_p2pk]);
            $this->db->where('id', $id_planning);
            $result = $this->db->update('p2pk_planning', [
                'id_p2pk' => $id_p2pk,
                'judul' => $judul,
                'deskripsi' => $deskripsi,
                'status' => 1,
                'updated_at' => date("Y-m-d H:i:s")
            ]);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $pic = $this->getIsiTableById('profile', ['id' => $p2pk['id_pic']]);
                $pic = $pic['nama_depan'] . ' ' . $pic['nama_belakang'];
                $data_lama = "Isi data planning sebelumnya dari client = $sebelumnya[client], pic = $sebelumnya[pic] adalah judul = $splanning[judul], deskripsi = [$splanning[deskripsi]]";
                $data_baru = "Mengubah data planning P2PK sebelumnya menjadi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
        }

        $config['upload_path']          = './files/p2pk/planning/';
        $config['allowed_types']        = 'pdf|docx|doc';
        $config['overwrite']            = false;
        $config['max_size']             = 10485760;
        $this->load->library('upload', $config);
        $jumlah_doc = count($_FILES['doc']['name']);
        for ($i = 0; $i < $jumlah_doc; $i++) {
            if (!empty($_FILES['doc']['name'][$i])) {

                $_FILES['file']['name'] = $_FILES['doc']['name'][$i];
                $_FILES['file']['type'] = $_FILES['doc']['type'][$i];
                $_FILES['file']['tmp_name'] = $_FILES['doc']['tmp_name'][$i];
                $_FILES['file']['error'] = $_FILES['doc']['error'][$i];
                $_FILES['file']['size'] = $_FILES['doc']['size'][$i];

                if ($this->upload->do_upload('file')) {
                    $uploadData = $this->upload->data();
                    $filename = $uploadData['file_name'];
                }
                $doc_id = $id_doc[$i] != null ? $id_doc[$i] : null;
                if ($doc_id == null | $doc_id == '') {
                    $result = $this->db->insert('p2pk_planning_file', [
                        'id_p2pk_planning' => $id_planning,
                        'nama' => $filename,
                        'file' => $filename,
                        'status' => 1,
                        'created_at' => date("Y-m-d H:i:s")
                    ]);
                    if ($result) {
                        $modul = $this->getMenuTitle();
                        $by = $this->getLogId();
                        $jenis_perubahan = 1;
                        $data_lama = "Belum ada data Attachment Planning P2PK dengan judul $judul";
                        $data_baru = "Upload data Attachment dengan file = [$filename] untuk Planning P2PK dengan judul = $judul";
                        $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                    }
                    $this->db->reset_query();
                } else {
                    $get_doc = $this->db->select('file')->from('p2pk_planning_file')->where('id', $doc_id)->get()->row_array();
                    $this->db->reset_query();
                    // delete attach
                    if ($get_doc != null) {
                        if ($get_doc['file'] != null && $get_doc['file'] != '') {
                            $this->deleteFile('planning', $get_doc['file']);
                        }
                    }
                    $this->db->where('id', $doc_id);
                    $result = $this->db->update('p2pk_planning_file', [
                        'id_p2pk_planning' => $id_planning,
                        'nama' => $filename,
                        'file' => $filename,
                        'status' => 1,
                        'updated_at' => date("Y-m-d H:i:s")
                    ]);
                    if ($result) {
                        $modul = $this->getMenuTitle();
                        $by = $this->getLogId();
                        $jenis_perubahan = 2;
                        $data_lama = "data Attachment Planning P2PK dengan judul $judul sebelumnya adalah file = $get_doc[file]";
                        $data_baru = "Mengganti data Attachment sebelumnya dengan file = [$filename] untuk Planning P2PK dengan judul = $judul";
                        $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                    }
                    $this->db->reset_query();
                }
            }
        }

        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function simpan_audit_backup($id_p2pk, $id_audit, $judul, $deskripsi, $id_doc)
    {
        $this->db->trans_start();

        $cek_new = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $id_p2pk]);
        if ($cek_new->num_rows() == 0) {
            $result = $this->db->insert('p2pk_proses_audit', [
                'id_p2pk' => $id_p2pk,
                'judul' => $judul,
                'deskripsi' => $deskripsi,
                'status' => 1,
                'created_at' => date("Y-m-d H:i:s")
            ]);
            $id_audit = $this->db->insert_id();
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 1;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $pic = $this->getIsiTableById('profile', ['id' => $p2pk['id_pic']]);
                $pic = $pic['nama_depan'] . ' ' . $pic['nama_belakang'];
                $data_lama = "Belum ada data proses audit P2PK dari client = $client, pic = $pic";
                $data_baru = "Menambah data proses audit P2PK baru dengan isi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
            $this->db->reset_query();
        } else {
            $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id_p2pk]);
            $saudit = $this->getIsiAuditBy(['a.id_p2pk' => $id_p2pk]);
            $this->db->where('id', $id_audit);
            $result = $this->db->update('p2pk_proses_audit', [
                'id_p2pk' => $id_p2pk,
                'judul' => $judul,
                'deskripsi' => $deskripsi,
                'status' => 1,
                'updated_at' => date("Y-m-d H:i:s")
            ]);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $pic = $this->getIsiTableById('profile', ['id' => $p2pk['id_pic']]);
                $pic = $pic['nama_depan'] . ' ' . $pic['nama_belakang'];
                $data_lama = "Isi data proses audit sebelumnya dari client = $sebelumnya[client], pic = $sebelumnya[pic] adalah judul = $saudit[judul], deskripsi = [$saudit[deskripsi]]";
                $data_baru = "Mengubah data proses audit P2PK sebelumnya menjadi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            }
        }

        $config['upload_path']          = './files/p2pk/audit/';
        $config['allowed_types']        = 'pdf|docx|doc';
        $config['overwrite']            = false;
        $config['max_size']             = 10485760;
        $this->load->library('upload', $config);
        $jumlah_doc = count($_FILES['doc-audit']['name']);
        for ($i = 0; $i < $jumlah_doc; $i++) {
            if (!empty($_FILES['doc-audit']['name'][$i])) {

                $_FILES['file']['name'] = $_FILES['doc-audit']['name'][$i];
                $_FILES['file']['type'] = $_FILES['doc-audit']['type'][$i];
                $_FILES['file']['tmp_name'] = $_FILES['doc-audit']['tmp_name'][$i];
                $_FILES['file']['error'] = $_FILES['doc-audit']['error'][$i];
                $_FILES['file']['size'] = $_FILES['doc-audit']['size'][$i];

                if ($this->upload->do_upload('file')) {
                    $uploadData = $this->upload->data();
                    $filename = $uploadData['file_name'];
                }
                $doc_id = $id_doc[$i] != null ? $id_doc[$i] : null;
                if ($doc_id == null | $doc_id == '') {
                    $result = $this->db->insert('p2pk_proses_audit_file', [
                        'id_p2pk_proses_audit' => $id_audit,
                        'nama' => $filename,
                        'file' => $filename,
                        'status' => 1,
                        'created_at' => date("Y-m-d H:i:s")
                    ]);
                    if ($result) {
                        $modul = $this->getMenuTitle();
                        $by = $this->getLogId();
                        $jenis_perubahan = 1;
                        $data_lama = "Belum ada data Attachment Proses Audit P2PK dengan judul $judul";
                        $data_baru = "Upload data Attachment dengan file = [$filename] untuk Proses Audit P2PK dengan judul = $judul";
                        $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                    }
                    $this->db->reset_query();
                } else {
                    $get_doc = $this->db->select('file')->from('p2pk_proses_audit_file')->where('id', $doc_id)->get()->row_array();
                    $this->db->reset_query();
                    // delete attach
                    if ($get_doc != null) {
                        if ($get_doc['file'] != null && $get_doc['file'] != '') {
                            $this->deleteFile('audit', $get_doc['file']);
                        }
                    }
                    $this->db->where('id', $doc_id);
                    $result = $this->db->update('p2pk_proses_audit_file', [
                        'id_p2pk_proses_audit' => $id_audit,
                        'nama' => $filename,
                        'file' => $filename,
                        'status' => 1,
                        'updated_at' => date("Y-m-d H:i:s")
                    ]);
                    if ($result) {
                        $modul = $this->getMenuTitle();
                        $by = $this->getLogId();
                        $jenis_perubahan = 2;
                        $data_lama = "data Attachment Proses Audit P2PK dengan judul $judul sebelumnya adalah file = $get_doc[file]";
                        $data_baru = "Mengganti data Attachment sebelumnya dengan file = [$filename] untuk Proses Audit P2PK dengan judul = $judul";
                        $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                    }
                    $this->db->reset_query();
                }
            }
        }

        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function simpan_planning($id_p2pk, $id_planning, $judul, $deskripsi, $id_doc)
    {
        $this->db->trans_start();


        $ubah_timeline = false;
        if (isset($_FILES['timeline']) != false) {
            if ($_FILES['timeline']['name'] != '') {
                // simpan timeline
                $timeline = $this->saveFile('planning', 'timeline');
                $ubah_timeline = true;

                $get_timeline = $this->db->select('timeline')->from('p2pk_planning')->where('id', $id_planning)->get()->row_array();
                $this->db->reset_query();
                // delete timeline
                if ($get_timeline != null) {
                    if ($get_timeline['timeline'] != null && $get_timeline['timeline'] != '') {
                        $this->deleteFile('planning', $get_timeline['timeline']);
                    }
                }
            }
        }

        $ubah_sdm = false;
        if (isset($_FILES['sdm']) != false) {
            if ($_FILES['sdm']['name'] != '') {
                // simpan sdm
                $sdm = $this->saveFile('planning', 'sdm');
                $ubah_sdm = true;

                $get_sdm = $this->db->select('sdm')->from('p2pk_planning')->where('id', $id_planning)->get()->row_array();
                $this->db->reset_query();
                // delete sdm
                if ($get_sdm != null) {
                    if ($get_sdm['sdm'] != null && $get_sdm['sdm'] != '') {
                        $this->deleteFile('planning', $get_sdm['sdm']);
                    }
                }
            }
        }

        $ubah_diminta = false;
        if (isset($_FILES['diminta']) != false) {
            if ($_FILES['diminta']['name'] != '') {
                // simpan diminta
                $diminta = $this->saveFile('planning', 'diminta');
                $ubah_diminta = true;

                $get_diminta = $this->db->select('diminta')->from('p2pk_planning')->where('id', $id_p2pk)->get()->row_array();
                $this->db->reset_query();
                // delete diminta
                if ($get_diminta != null) {
                    if ($get_diminta['diminta'] != null && $get_diminta['diminta'] != '') {
                        $this->deleteFile('planning', $get_diminta['diminta']);
                    }
                }
            }
        }

        $data = [
            'id_p2pk' => $id_p2pk,
            'judul' => $judul,
            'deskripsi' => $deskripsi,
            'status' => 1
        ];
        if ($ubah_timeline) {
            $data['timeline'] = $timeline['data'];
        }else{
            $timeline['data'] = 'Tidak ada perubahan';
        }

        if ($ubah_sdm) {
            $data['sdm'] = $sdm['data'];
        }else{
            $sdm['data'] = 'Tidak ada perubahan';
        }

        if ($ubah_diminta) {
            $data['diminta'] = $diminta['data'];
        }else{
            $diminta['data'] = 'Tidak ada perubahan';
        }

        $cek_new = $this->db->get_where('p2pk_planning', ['id_p2pk' => $id_p2pk]);
        if ($cek_new->num_rows() == 0) {
            $data['created_at'] = date("Y-m-d H:i:s");
            $result = $this->db->insert('p2pk_planning', $data);
            $id_planning = $this->db->insert_id();
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 1;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();

                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

                $data_lama = "Belum ada data planning P2PK dari kode = $get_detail[kode], client = $client, pic = $pic, kode = $get_detail[kode]";
                $data_baru = "Menambah data planning P2PK baru dengan isi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic, file timeline = ".$timeline['data']." file sdm = ".$sdm['data'].", file diminta = ".$diminta['data'].", kode = $get_detail[kode]";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();

                $cek_file = $this->db->get_where('p2pk_planning', ['id_p2pk' => $id_p2pk, 'timeline != ' => NULL, 'diminta != ' => NULL, 'sdm != ' => NULL])->result_array();
                if(!empty($cek_file)){
                    $this->set_st_proses($id_p2pk, 2);
                }
            }
            $this->db->reset_query();
        } else {
            $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id_p2pk]);
            $splanning = $this->getIsiPlanningBy(['a.id_p2pk' => $id_p2pk]);
            $data['updated_at'] = date("Y-m-d H:i:s");
            $this->db->where('id', $id_planning);
            $result = $this->db->update('p2pk_planning', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

                $data_lama = "Isi data planning sebelumnya dari client = $sebelumnya[client], pic = $sebelumnya[pic] adalah judul = $splanning[judul], deskripsi = [$splanning[deskripsi]], kode = $get_detail[kode]";
                $data_baru = "Mengubah data planning P2PK dengan isi judul = $judul, deskripsi = [$deskripsi] dari client = $client, pic = $pic, file timeline = ".$timeline['data'].", file sdm = ".$sdm['data'].", file diminta = ".$diminta['data'].", kode = $get_detail[kode]";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();

                $cek_file = $this->db->get_where('p2pk_planning', ['id_p2pk' => $id_p2pk, 'timeline != ' => NULL, 'diminta != ' => NULL, 'sdm != ' => NULL])->result_array();
                if(!empty($cek_file)){
                    $this->set_st_proses($id_p2pk, 2);
                }

            }
        }

        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function simpan_audit($id_p2pk, $id_audit, $judul, $deskripsi, $id_doc)
    {
        $this->db->trans_start();

        $ubah_kertas_kerja = false;
        if (isset($_FILES['kertas_kerja']) != false) {
            if ($_FILES['kertas_kerja']['name'] != '') {
                // simpan kertas_kerja
                $kertas_kerja = $this->saveFile('audit', 'kertas_kerja');
                $ubah_kertas_kerja = true;

                $get_kertas_kerja = $this->db->select('kertas_kerja')->from('p2pk_proses_audit')->where('id', $id_audit)->get()->row_array();
                $this->db->reset_query();
                // delete kertas_kerja
                if ($get_kertas_kerja != null) {
                    if ($get_kertas_kerja['kertas_kerja'] != null && $get_kertas_kerja['kertas_kerja'] != '') {
                        $this->deleteFile('audit', $get_kertas_kerja['kertas_kerja']);
                    }
                }
            }
        }

        $ubah_pengujian = false;
        if (isset($_FILES['pengujian']) != false) {
            if ($_FILES['pengujian']['name'] != '') {
                // simpan pengujian
                $pengujian = $this->saveFile('audit', 'pengujian');
                $ubah_pengujian = true;

                $get_pengujian = $this->db->select('pengujian')->from('p2pk_proses_audit')->where('id', $id_audit)->get()->row_array();
                $this->db->reset_query();
                // delete pengujian
                if ($get_pengujian != null) {
                    if ($get_pengujian['pengujian'] != null && $get_pengujian['pengujian'] != '') {
                        $this->deleteFile('audit', $get_pengujian['pengujian']);
                    }
                }
            }
        }

        $data = [
            'id_p2pk' => $id_p2pk,
            'judul' => $judul,
            'deskripsi' => $deskripsi,
            'status' => 1
        ];
        if ($ubah_kertas_kerja) {
            $data['kertas_kerja'] = $kertas_kerja['data'];
        }else{
            $kertas_kerja['data'] = 'Tidak ada perubahan';
        }

        if ($ubah_pengujian) {
            $data['pengujian'] = $pengujian['data'];
        }else{
            $pengujian['data'] = 'Tidak ada perubahan';
        }

        $cek_new = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $id_p2pk]);
        if ($cek_new->num_rows() == 0) {
            $data['created_at'] = date("Y-m-d H:i:s");
            $result = $this->db->insert('p2pk_proses_audit', $data);
            $id_audit = $this->db->insert_id();
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 1;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

                $data_lama = "Belum ada data proses audit P2PK dari client = $client, pic = $p2pk[pic], kode = $get_detail[kode]";
                $data_baru = "Menambah data proses audit P2PK baru dengan isi judul = $judul, deskripsi = [$deskripsi], file kertas kerja = ".$kertas_kerja['data'].", file pengujian = ".$pengujian['data']." dari client = $client, pic = $pic, kode = $get_detail[kode]";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();
                $cek_file = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $id_p2pk, 'kertas_kerja != ' => NULL, 'pengujian != ' => NULL])->result_array();
                if(!empty($cek_file)){
                    $this->set_st_proses($id_p2pk, 4);
                }
            }
            $this->db->reset_query();
        } else {
            $sebelumnya = $this->getIsiP2pkBy(['a.id' => $id_p2pk]);
            $saudit = $this->getIsiAuditBy(['a.id_p2pk' => $id_p2pk]);
            $data['updated_at'] = date("Y-m-d H:i:s");
            $this->db->where('id', $id_audit);
            $result = $this->db->update('p2pk_proses_audit', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
                $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
                $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

                $data_lama = "Isi data proses audit sebelumnya dari kode = $get_detail[kode] client = $sebelumnya[client], pic = $sebelumnya[pic] adalah judul = $saudit[judul], deskripsi = [$saudit[deskripsi]]";
                $data_baru = "Mengubah data proses audit P2PK sebelumnya menjadi judul = $judul, deskripsi = [$deskripsi], file kertas kerja = ".$kertas_kerja['data'].", file pengujian = ".$pengujian['data']." dari client = $client, pic = $pic, kode = $get_detail[kode]";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();

               $cek_file = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $id_p2pk, 'kertas_kerja != ' => NULL, 'pengujian != ' => NULL])->result_array();
                if(!empty($cek_file)){
                    $this->set_st_proses($id_p2pk, 4);
                }
            }
        }

        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function simpan_pilih_approval($id_p2pk, $id_p2pk_report, $id_approval)
    {
        $this->db->trans_start();

        $sebelumnya = $this->getIsiTableById('p2pk_report_detail', ['id' => $id_p2pk_report]);
        $sapproval = $this->getBODList(['a.id' => $sebelumnya['id_approval']]);
        $sapproval != null ? $sapproval = $sapproval[0]['text'] : $sapproval = 'Belum Memilih';
        $sebelumnya['id_approval'] != 0 ? $sebelumnya = $sapproval : $sebelumnya = 'Belum Memilih';

        $this->db->where('id', $id_p2pk_report);
        $result = $this->db->update('p2pk_report_detail', [
            'id_approval' => $id_approval,
            'tanggal_approval_diminta' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status' => 2,
            'status_kondisi_approval' => 1,
        ]);
        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
            $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
            // $approval = $this->getBODList(['a.id' => $id_approval])[0]['text'];
            // $data_lama = "Approval sebelumnya dari client = $client, pic = $p2pk[pic] adalah $sebelumnya";
            // $data_baru = "Client = $client, pic = $p2pk[pic] memilih approval $approval";

            $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();
            $get_p2pk_detail = $this->db->join('profile b', 'b.id = a.id_approval')->get_where('p2pk_report_detail a', ['a.id' => $id_p2pk_report])->row_array();

            $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

            $data_lama = "Kode = $get_detail[kode], Client = $client, PIC = $pic, approval sebelumnya -";
            $data_baru = "Kode = $get_detail[kode], Client = $client, PIC = $pic memilih approval = ".$get_p2pk_detail['nama_depan'];

            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            $this->db->reset_query();
            $report_phase = $this->db->get_where('p2pk_report_detail', ['id' => $id_p2pk_report])->row_array()['report_phase'];
            if ($report_phase == 1) {
                $this->set_st_proses($id_p2pk, 5);
            } elseif ($report_phase == 2) {
                $this->set_st_proses($id_p2pk, 7);
            } elseif ($report_phase == 3) {
                $this->set_st_proses($id_p2pk, 9);
            }
        }
        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function update_pilih_approval($id_p2pk, $id_p2pk_report, $id_approval)
    {
        $this->db->trans_start();

        $sebelumnya = $this->getIsiTableById('p2pk_report_detail', ['id' => $id_p2pk_report]);
        $sapproval = $this->getBODList(['a.id' => $sebelumnya['id_approval']]);
        $sapproval != null ? $sapproval = $sapproval[0]['text'] : $sapproval = 'Belum Memilih';
        $sebelumnya['id_approval'] != 0 ? $sebelumnya = $sapproval : $sebelumnya = 'Belum Memilih';

        $this->db->where('id', $id_p2pk_report);

        $result = $this->db->update('p2pk_report_detail', [
            'id_approval' => $id_approval,
            'tanggal_approval_diminta' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status_kondisi_upload_file' => 2,
            'status_kondisi_approval' => 2,
            'status' => 3
        ]);

        if ($result) {
            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
            $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
            $approval = $this->getBODList(['a.id' => $id_approval])[0]['text'];

            $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.id', $id_p2pk)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
                $kode = $detail['kode'];

            $data_lama = "Approval sebelumnya dari kode = $kode,  client = $client, pic = $pic adalah $sebelumnya";
            $data_baru = "Kode = $kode, client = $client, pic = $pic memilih approval $approval";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            $this->db->reset_query();
            $report_phase = $this->db->get_where('p2pk_report_detail', ['id' => $id_p2pk_report])->row_array()['report_phase'];
            if ($report_phase == 1) {
                $this->set_st_proses($id_p2pk, 5);
            } elseif ($report_phase == 2) {
                $this->set_st_proses($id_p2pk, 7);
            } elseif ($report_phase == 3) {
                $this->set_st_proses($id_p2pk, 9);
            }
        }
        $this->db->trans_complete();
        return $id_p2pk;
    }

    public function simpan_file_report_semua($id_p2pk, $id_p2pk_report, $report_phase)
    {
        // $this->db->trans_start();

        $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
        $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];

        $data = [
            'tanggal_upload' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status' => 4,
            'status_kondisi_upload_file' => 2,
        ];
        
        $this->selesaikan($id_p2pk);

        $this->db->where('id', $id_p2pk_report);
        $set = $this->db->update('p2pk_report_detail', $data);
        if ($set) {
            $this->db->reset_query();
            $data = [];
            $data['updated_at'] = date("Y-m-d H:i:s");
            if ($report_phase == 1) {
                $data['status'] = 2;
            } else if ($report_phase == 2) {
                $data['status'] = 4;
            } else {
                $data['status'] = 6;
                $data['report_phase'] = 3;
            }
            $this->db->where('id_p2pk', $id_p2pk);
            $result = $this->db->update('p2pk_report', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.id', $id_p2pk)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
                $kode = $detail['kode'];

                $data_lama = "-";
                $data_baru = "Client = $client, pic = $pic mengapload file report";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();
                if ($report_phase == 1) {
                    $this->set_st_proses($id_p2pk, 5);
                } elseif ($report_phase == 2) {
                    $this->set_st_proses($id_p2pk, 7);
                } elseif ($report_phase == 3) {
                    $this->set_st_proses($id_p2pk, 10);
                }
            }
        }

        // $this->db->trans_complete();

        // DATA P2PK PLANNING
        // $data_p2pk_planning = $this->db->get_where('p2pk_planning', ['id_p2pk' => $id_p2pk])->row_array();

        // $save_1['kategori'] = "P2PK";
        // $save_1['judul'] = $kode." - ".$data_p2pk_planning['judul'];
        // $save_1['keterangan'] = "P2PK PLANNING FILE TIMELINE - ".$data_p2pk_planning['deskripsi'];
        // $save_1['attachment'] = "files/p2pk/planning/".$data_p2pk_planning['timeline'];
        // $save_1['status'] = 1;
        // $this->db->insert('repository', $save_1);

        // $save_2['kategori'] = "P2PK";
        // $save_2['judul'] = $kode." - ".$data_p2pk_planning['judul'];
        // $save_2['keterangan'] = "P2PK PLANNING FILE SDM - ".$data_p2pk_planning['deskripsi'];
        // $save_2['attachment'] = "files/p2pk/planning/".$data_p2pk_planning['sdm'];
        // $save_2['status'] = 1;
        // $this->db->insert('repository', $save_2);

        // $save_3['kategori'] = "P2PK";
        // $save_3['judul'] = $kode." - ".$data_p2pk_planning['judul'];
        // $save_3['keterangan'] = "P2PK PLANNING FILE DIMINTA - ".$data_p2pk_planning['deskripsi'];
        // $save_3['attachment'] = "files/p2pk/planning/".$data_p2pk_planning['diminta'];
        // $save_3['status'] = 1;
        // $this->db->insert('repository', $save_3);

        // DATA P2PK PROSES AUDIT
        // $data_p2pk_proses_audit = $this->db->get_where('p2pk_proses_audit', ['id_p2pk' => $id_p2pk])->row_array();

        // $save_4['kategori'] = "P2PK";
        // $save_4['judul'] = $kode." - ".$data_p2pk_proses_audit['judul'];
        // $save_4['keterangan'] = "P2PK PROSES AUDIT FILE KERTAS KERJA - ".$data_p2pk_proses_audit['deskripsi'];
        // $save_4['attachment'] = "files/p2pk/audit/".$data_p2pk_proses_audit['kertas_kerja'];
        // $save_4['status'] = 1;
        // $this->db->insert('repository', $save_4);

        // $save_5['kategori'] = "P2PK";
        // $save_5['judul'] = $kode." - ".$data_p2pk_proses_audit['judul'];
        // $save_5['keterangan'] = "P2PK PROSES AUDIT FILE PENGUJIAN - ".$data_p2pk_proses_audit['deskripsi'];
        // $save_5['attachment'] = "files/p2pk/audit/".$data_p2pk_proses_audit['pengujian'];
        // $save_5['status'] = 1;
        // $this->db->insert('repository', $save_5);

        $data_p2pk_report = $this->db->join('p2pk_report b', 'a.id_p2pk_report = b.id')->order_by('a.id', 'desc')->get_where('p2pk_report_detail a', ['b.id_p2pk' => $id_p2pk])->row_array();
        // foreach($data_p2pk_report as $q){
            $save_6['kategori'] = "P2PK";
            $save_6['judul'] = $kode." - Report";
            $save_6['keterangan'] = "P2PK FILE FINAL REPORT - ".$data_p2pk_report['file'];
            $save_6['attachment'] = "files/p2pk/report/".$data_p2pk_report['file'];
            $save_6['status'] = 1;
            $this->db->insert('repository', $save_6);   
        // }

        return $id_p2pk;
    }

    public function simpan_file_report($id_p2pk, $id_p2pk_report, $report_phase)
    {
        // $this->db->trans_start();

        $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
        $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
        $ubah_fileReport = false;
        if (isset($_FILES['fileReport']) != false) {
            if ($_FILES['fileReport']['name'] != '') {
                // simpan fileReport
                $fileReport = $this->saveReport('fileReport', $client . "_"  . $p2pk['pic'] . "_" . $_FILES['fileReport']['name']);
                $ubah_fileReport = true;

                $get_fileReport = $this->db->select('file')->from('p2pk_report_detail')->where('id', $id_p2pk_report)->get()->row_array();
                $this->db->reset_query();
                // delete fileReport
                if ($get_fileReport != null) {
                    if ($get_fileReport['file'] != null && $get_fileReport['file'] != '') {
                        $this->deleteFile('report', $get_fileReport['file']);
                    }
                }
            }
        }

        if($report_phase == 3){
            $status = 6;
        }else{
            $status = 1;
        }

        $data = [
            'tanggal_upload' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status' => $status,
            'status_kondisi_upload_file' => 1,
        ];
        if ($ubah_fileReport) {
            $data['file'] = $fileReport['data'];
        }

        // if ($report_phase == 3) {
        //     $data['status'] = 4;
        //     $this->selesaikan($id_p2pk);
        // }

        $this->db->where('id', $id_p2pk_report);
        $set = $this->db->update('p2pk_report_detail', $data);
        if ($set) {
            $this->db->reset_query();
            $data = [];
            $data['updated_at'] = date("Y-m-d H:i:s");
            if ($report_phase == 1) {
                $data['status'] = 2;
            } else if ($report_phase == 2) {
                $data['status'] = 4;
            } else {
                $data['status'] = 6;
                $data['report_phase'] = 3;
            }
            $this->db->where('id_p2pk', $id_p2pk);
            $result = $this->db->update('p2pk_report', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $get_detail = $this->db->get_where('p2pk',['id' => $id_p2pk])->row_array();
                $get_p2pk_detail = $this->db->get_where('p2pk_report_detail', ['id' => $id_p2pk_report])->row_array();
                // $pic = $this->getIsiTableById('profile', ['id' => $p2pk['id_pic']]);
                // $pic = $pic['nama_depan'] . ' ' . $pic['nama_belakang'];
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.kode', $get_detail['kode'])
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];

                $data_lama = "Kode = $get_detail[kode], Client = $client, PIC = $pic, file report sebelumnya = ".$get_p2pk_detail['file'];
                $data_baru = "Kode = $get_detail[kode], Client = $client, PIC = $pic mengapload file report = ".$fileReport['data'];
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();
                if ($report_phase == 1) {
                    $this->set_st_proses($id_p2pk, 5);
                } elseif ($report_phase == 2) {
                    $this->set_st_proses($id_p2pk, 7);
                } elseif ($report_phase == 3) {
                    $this->set_st_proses($id_p2pk, 9);
                }
            }
        }

        // $this->db->trans_complete();
        return $id_p2pk;
    }

    public function update_file_report($id_p2pk, $id_p2pk_report, $report_phase)
    {
        $data = [
            'status_kondisi_upload_file' => 2,
        ];
        $this->db->where('id', $id_p2pk_report);
        $set = $this->db->update('p2pk_report_detail', $data);

        return $id_p2pk;
    }

    public function simpan_file_komentar($id_p2pk, $id_p2pk_report, $report_phase, $komentar)
    {
        // $this->db->trans_start();
        $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
        $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
        $ubah_fileKomentar = false;
        if (isset($_FILES['fileKomentar']) != false) {
            if ($_FILES['fileKomentar']['name'] != '') {
                // simpan fileKomentar
                $fileKomentar = $this->saveReport('fileKomentar', $client . "_"  . $p2pk['pic'] . "_" . $_FILES['fileKomentar']['name']);
                $ubah_fileKomentar = true;

                $get_fileKomentar = $this->db->select('file_komen')->from('p2pk_report_detail')->where('id', $id_p2pk_report)->get()->row_array();
                $this->db->reset_query();
                // delete fileKomentar
                if ($get_fileKomentar != null) {
                    if ($get_fileKomentar['file_komen'] != null && $get_fileKomentar['file_komen'] != '') {
                        $this->deleteFile('report', $get_fileKomentar['file_komen']);
                    }
                }
            }
        }

        $data = [
            'komentar' => $komentar,
            'tanggal_komentar_submit' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status' => 4,
            'status_kondisi_file_komentar' => 1,
        ];
        if ($ubah_fileKomentar) {
            $data['file_komen'] = $fileKomentar['data'];
        }

        $this->db->where('id', $id_p2pk_report);
        $set = $this->db->update('p2pk_report_detail', $data);
        if ($set) {
            $this->db->reset_query();
            $data = [];
            $data['updated_at'] = date("Y-m-d H:i:s");
            if ($report_phase == 1) {
                $data['report_phase'] = 2;
                $data['status'] = 3;
            } else {
                $data['status'] = 5;
            }
            $this->db->where('id_p2pk', $id_p2pk);
            $result = $this->db->update('p2pk_report', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.id', $id_p2pk)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
                $kode = $detail['kode'];

                $data_lama = "-";
                $data_baru = "Kode = $kode, client = $client, pic = $pic mengapload file komentar";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();
                if ($report_phase == 1) {
                    $this->set_st_proses($id_p2pk, 6);
                } elseif ($report_phase == 2) {
                    $this->set_st_proses($id_p2pk, 8);
                } elseif ($report_phase == 3) {
                    $this->set_st_proses($id_p2pk, 10);
                }
            }
        }
        // $this->db->trans_complete();
        return $id_p2pk;
    }

    public function update_file_komentar($id_p2pk, $id_p2pk_report, $report_phase)
    {
        // $this->db->trans_start();
        $p2pk = $this->getIsiTableById('p2pk', ['id' => $id_p2pk]);
        $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];

        $data = [
            'tanggal_komentar_submit' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s"),
            'status' => 5,
            'status_kondisi_file_komentar' => 2
        ];

        $this->db->where('id', $id_p2pk_report);
        $set = $this->db->update('p2pk_report_detail', $data);
        if ($set) {
            $this->db->reset_query();
            $data = [];
            $data['updated_at'] = date("Y-m-d H:i:s");
            if ($report_phase == 1) {
                $data['report_phase'] = 2;
                $data['status'] = 3;
            } else {
                $data['status'] = 5;
            }
            $this->db->where('id_p2pk', $id_p2pk);
            $result = $this->db->update('p2pk_report', $data);
            if ($result) {
                $modul = $this->getMenuTitle();
                $by = $this->getLogId();
                $jenis_perubahan = 2;
                $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.id', $id_p2pk)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
                $kode = $detail['kode'];

                $data_lama = "-";
                $data_baru = "Kode = $kode, client = $client, pic = $pic mengapload file komentar";
                $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
                $this->db->reset_query();
                if ($report_phase == 1) {
                    $this->set_st_proses($id_p2pk, 6);
                } elseif ($report_phase == 2) {
                    $this->set_st_proses($id_p2pk, 8);
                } elseif ($report_phase == 3) {
                    $this->set_st_proses($id_p2pk, 10);
                }
            }
        }
        // $this->db->trans_complete();
        return $id_p2pk;
    }

    public function selesaikan($id = null)
    {
        $p2pk = $this->getIsiTableById('p2pk', ['id' => $id]);
        $client = $this->getIsiTableById('client_company', ['id' => $p2pk['id_client']])['nama'];
        $this->db->reset_query();

        $this->db->trans_start();
        $data['status'] = 2;
        $this->db->where('id', $id);
        $set_p2pk = $this->db->update('p2pk', $data);

        if ($set_p2pk) {

            $this->db->reset_query();
            $id_p2pk_report = $this->db->get_where('p2pk_report', ['id_p2pk' => $id])->row_array()['id'];

            $data['status'] = 6;
            $this->db->where('id', $id_p2pk_report);
            $set_p2pk_report = $this->db->update('p2pk_report', $data);

            if ($set_p2pk_report) {
                $this->db->reset_query();
                $data['status'] = 4;
                $this->db->where('id_p2pk_report', $id_p2pk_report);
                $set_p2pk_report = $this->db->update('p2pk_report_detail', $data);
            }

            $modul = $this->getMenuTitle();
            $by = $this->getLogId();
            $jenis_perubahan = 2;
            $detail = $this->db->select('a.kode, d.keterangan as kategori, b.nama as client, concat(e.nama_depan," ", e.nama_belakang) as pic, a.judul')
                ->from("p2pk a")
                ->join("client_company b", "a.id_client = b.id", "left")
                ->join("resiko c", "b.id_resiko = c.id", "left")
                ->join("kategori_p2pk d", "d.id = a.id_kategori_p2pk", "left")
                ->join("profile e", "e.id = a.pic", "left")
                ->where('a.id', $id)
                ->get()
                ->row_array();
                $kategori = $detail['kategori'];
                $client = $detail['client'];
                $pic = $detail['pic'];
                $kode = $detail['kode'];

            $data_lama = "-";
            $data_baru = "Final Report client = $client && pic = $pic submitted";
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
            $this->db->reset_query();
            $this->set_st_proses($id, 10);
        }
        $this->db->trans_complete();
        return $id;


        // echo "<script>alert('P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK')</script>";
        // redirect("p2pk/listP2PK", 'refresh');
    }

    public function set_st_proses($id_p2pk = null, $st = null)
    {
        $this->db->where('id', $id_p2pk);
        $this->db->update('p2pk', ['status_proses' => $st]);
        return $id_p2pk;
    }

    public function hapusFile($tbl, $id)
    {
        $this->db->trans_start();
        $get_doc = $this->db->select('file')->from($tbl)->where('id', $id)->get()->row_array();
        $this->db->reset_query();
        // delete attach
        if ($get_doc != null) {
            if ($get_doc['file'] != null && $get_doc['file'] != '') {
                $this->deleteFile('planning', $get_doc['file']);
            }
        }
        $this->db->where('id', $id);
        $result = $this->db->update($tbl, [
            'status' => 3,
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        if ($result) {
            $by = $this->getLogId();
            $jenis_perubahan = 3;
            if ($tbl == 'p2pk_planning_file') {
                $modul = $this->getMenuTitle();
                $data_lama = "data Attachment Planning P2PK sebelumnya adalah file = $get_doc[file]";
                $data_baru = "Menghapus data Attachment Planning P2PK dengan file = $get_doc[file]";
            }
            if ($tbl == 'p2pk_proses_audit_file') {
                $modul = $this->getMenuTitle();
                $data_lama = "data Attachment Proses AUDIT P2PK sebelumnya adalah file = $get_doc[file]";
                $data_baru = "Menghapus data Attachment Proses AUDIT P2PK dengan file = $get_doc[file]";
            }
            $this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
        }
        $this->db->reset_query();
        $this->db->trans_complete();
        return $id;
    }

    public function list_kategori($id_menu)
    {
        $return = $this->db->select('a.id, a.keterangan as text')
            ->from('kategori_p2pk a')
            ->where('status', '1')
            ->where('id_menu', $id_menu)
            ->get()
            ->result_array();
        return $return;
    }

    public function list_client()
    {
        $return = $this->db->select('a.id, a.nama as text')
            ->from('client_company a')
            ->where('status', '1')
            ->get()
            ->result_array();
        return $return;
    }

    public function list_pic()
    {
        $return = $this->db->select("a.id, concat(a.nama_depan,' ', a.nama_belakang) as text, c.nama as level")
            ->from('profile a')
            ->join('membership b', 'b.id_profile = a.id')
            ->join('jenis_membership c', 'b.id_jenis_membership = c.id')
            ->where('a.status', '1')
            ->where('b.status', 1)
            ->where('c.nama !=', 'Auditor')
            ->get()
            ->result_array();
        return $return;
    }

    public function list_resiko($id_client)
    {
        $return = $this->db->select("a.id, b.nama as text")
            ->from('client_company a')
            ->join('resiko b', 'a.id_resiko = b.id', 'left')
            ->where('a.id', $id_client)
            ->where('b.status', '1')
            ->get()
            ->result_array();
        return $return;
    }

    public function getSTP($id_p2pk)
    {
        $return = $this->db->select("a.status_proses as id, 
        IF(a.status_proses = '1' , 'Planning Dalam Proses', 
            IF(a.status_proses = '2' , 'Planning Selesai', 
            IF(a.status_proses = '3' , 'Proses Audit Dalam Proses', 
            IF(a.status_proses = '4' , 'Proses Audit Selesai', 
            IF(a.status_proses = '5' , 'Report Phase 1 Dalam Proses', 
            IF(a.status_proses = '6' , 'Report Phase 1 Selesai', 
            IF(a.status_proses = '7' , 'Report Phase 2 Dalam Proses', 
            IF(a.status_proses = '8' , 'Report Phase 2 Selesai', 
            IF(a.status_proses = '9' , 'Report Final Report Dalam Proses', 
            IF(a.status_proses = '10' , 'Report Final Report Selesai', 'Tidak Diketahui')))))))))) as text")
            ->from('p2pk a')
            ->group_by('a.status_proses');
        if ($id_p2pk != null) {
            $return = $this->db->where('a.id', $id_p2pk);
        }
        $return = $this->db->get()
            ->result_array();
        return $return;
    }

    private function saveFile($group, $file_name)
    {
        $config['upload_path']          = './files/p2pk/' . $group . '/';
        $config['allowed_types']        = 'pdf|docx|doc|zip';
        // $config['file_name']            = md5(uniqid("ktm_home", true));
        // $config['file_name']            = $file_name;
        $config['overwrite']            = false;
        $config['max_size']             = 10485760;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload($file_name)) {
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

    private function saveReport($file, $file_name)
    {
        $config['upload_path']          = './files/p2pk/report/';
        $config['allowed_types']        = 'pdf|docx|doc';
        // $config['file_name']            = md5(uniqid("ktm_home", true));
        $config['file_name']            = $file_name;
        $config['overwrite']            = false;
        $config['max_size']             = 10485760;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload($file)) {
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

    private function deleteFile($grup, $file)
    {
        $res_foto = true;
        if (file_exists('./files/p2pk/' . $grup . '/' . $file)) {
            $res_foto = unlink('./files/p2pk/' . $grup . '/' . $file);
        }
        return $res_foto;
    }
}
