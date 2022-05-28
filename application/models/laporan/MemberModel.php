<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MemberModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null, $filter = null)
    {
        $part = $this->session->userdata('data')['id'];
        $cek_part = $this->db->get_where('users', ['user_id' => $part])->result_array();
        $idpart = $cek_part[0]['id_partner'];
        $this->db->reset_query();

        // select datatable
        $this->db->select(" `a` .*, l.nama as nama_posisi, i.keterangan as keanggotaan, i.nama as nama_keanggotaan, a.created_at as tanggal_daftar, b.id_partner, `h`.lev_nama, `b`.`nik`, `b`.`user_email` as `email`, b.user_email_status, a.tanggal_registrasi,
        (IFNULL((SELECT jenis_membership.nama FROM membership
            join jenis_membership on jenis_membership.id = membership.id_jenis_membership
            WHERE id_profile = a.id and membership.status = 1 limit 1), '')) as membership,
        (IFNULL((SELECT id FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as id_membership,
        (IFNULL((SELECT status FROM membership
                    WHERE id_profile = a.id and status < 2 limit 1), '')) as st_membership,
        (IFNULL((SELECT id_profile_atasan FROM membership_atasan atasan
                    JOIN profile ON atasan.id_profile_atasan = profile.id
                    WHERE atasan.id_profile = a.id and atasan.status < 2 limit 1), '')) as id_atasan,
        (IFNULL((SELECT concat(profile.nama_depan, ' ', profile.nama_belakang) FROM membership_atasan atasan
                    JOIN profile ON atasan.id_profile_atasan = profile.id
                    WHERE atasan.id_profile = a.id and atasan.status < 2 limit 1), '')) as atasan,
        IF(a.jenis_kelamin = '1', 'Laki-Laki', IF(a.jenis_kelamin = '2', 'Perempuan', 'Tidak Diketahui')) as jk,
        IF(a.status_verifikasi = '1', 'Approved',
        IF(a.status_verifikasi = '2', 'Rejected', 'Tidak Diketahui')) as st_ver,
        IF(a.status = '2', 'Tidak Aktif', IF(a.status = '1', 'Aktif', 'Tidak Diketahui')) as status_str,
        `e`.`nama` as `nama_partner`,
        (IFNULL(( SELECT tipe_contact.nama FROM contact JOIN tipe_contact ON contact.id_tipe_contact = tipe_contact.id
                    WHERE contact.id_profile = a.id AND contact.status = 1
                    ORDER BY contact.created_at DESC LIMIT 1 ), '' )) AS tipe_contact_sekarang,
        (IFNULL(( SELECT contact.keterangan FROM contact JOIN tipe_contact ON contact.id_tipe_contact = tipe_contact.id
                    WHERE contact.id_profile = a.id AND contact.status = 1
                    ORDER BY contact.created_at DESC LIMIT 1 ), '' )) AS contact_sekarang,
        (IFNULL((SELECT `name` FROM data_formal JOIN dtm_peristiwa ON data_formal.dtm_peristiwa_id = dtm_peristiwa.id
                    WHERE data_formal.id_profile = a.id AND data_formal.status = 1
                    ORDER BY data_formal.tanggal_data_formal DESC LIMIT 1), '')) as peristiwa_formal,
        (IFNULL((SELECT data_formal.created_at FROM data_formal JOIN dtm_peristiwa ON data_formal.dtm_peristiwa_id = dtm_peristiwa.id
                    WHERE data_formal.id_profile = a.id AND data_formal.status = 1
                    ORDER BY data_formal.tanggal_data_formal DESC LIMIT 1), '')) as tgl_formal,
        (IFNULL(( SELECT ja.nama FROM alamat alt 
                    JOIN jenis_alamat ja ON alt.id_jenis_alamat = ja.id
                    WHERE alt.id_profile = a.id AND alt.status = 1
                    ORDER BY alt.tanggal_mulai DESC LIMIT 1 ), '' )) AS jenis_alamat_sekarang,
        (IFNULL(( SELECT alamat FROM alamat WHERE alamat.id_profile = a.id AND alamat.status = 1
                    ORDER BY alamat.tanggal_mulai DESC LIMIT 1 ), '' )) AS alamat_sekarang,
        (IFNULL(( SELECT gelar.tanggal_lulus FROM gelar JOIN jenis_gelar ON gelar.id_jenis_gelar = jenis_gelar.id
                    WHERE gelar.id_profile = a.id AND gelar.status = 1
                    ORDER BY gelar.tanggal_lulus DESC LIMIT 1 ), '' )) AS tanggal_gelar_sekarang,
        (IFNULL(( SELECT gelar.lembaga FROM gelar JOIN jenis_gelar ON gelar.id_jenis_gelar = jenis_gelar.id
                    WHERE gelar.id_profile = a.id AND gelar.status = 1
                    ORDER BY gelar.tanggal_lulus DESC LIMIT 1 ), '' )) AS lembaga_gelar_sekarang,
        (IFNULL(( SELECT jenis_gelar.nama FROM gelar JOIN jenis_gelar ON gelar.id_jenis_gelar = jenis_gelar.id
                    WHERE gelar.id_profile = a.id AND gelar.status = 1
                    ORDER BY gelar.tanggal_lulus DESC LIMIT 1 ), '' )) AS gelar_sekarang,
        (IFNULL(( SELECT kategorial.nama FROM kategorial JOIN profile_kategorial ON profile_kategorial.id_kategorial = kategorial.id
                    WHERE profile_kategorial.id_profile = a.id AND profile_kategorial.status = 1
                    ORDER BY profile_kategorial.tanggal DESC LIMIT 1 ), '' )) AS kategorial_sekarang,
        (IFNULL(( SELECT wilayah.nama FROM wilayah JOIN profile_wilayah ON profile_wilayah.id_wilayah = wilayah.id
                    WHERE profile_wilayah.id_profile = a.id AND profile_wilayah.status = 1
                    ORDER BY profile_wilayah.tanggal DESC LIMIT 1 ), '' )) AS wilayah_sekarang");
        $this->db->from("profile a");
        $this->db->join("users b", "a.id_user = b.user_id", "left");
        $this->db->join("partner e", "e.id = b.id_partner", "left");
        $this->db->join("contact f", "f.id_profile = a.id", "left");
        $this->db->join('role_users g', 'g.role_user_id = b.user_id', 'left');
        $this->db->join('level h', 'g.role_lev_id = h.lev_id', 'left');
        $this->db->join('kategori_keanggotaan i', 'i.id = a.id_keanggotaan', 'left');
        $this->db->join('kategorial j', 'j.id = a.id_kategorial', 'left');
        $this->db->join('wilayah k', 'k.id = a.id_wilayah', 'left');
        $this->db->join('posisi l', 'l.id = b.id_posisi', 'left');
        $this->db->group_by('a.id');
        $this->db->where("a.status !=", 0);
        $this->db->where("a.status !=", 3);
        $this->db->where("h.lev_id !=", 1);
        // if ($idpart != null && $idpart != 0 && $idpart != '-' && $this->session->userdata('data')['level'] != 'Super Admin') {
        //     $this->db->where("b.id_partner", $idpart);
        // }
        $this->db->order_by('a.id', 'desc');

        // order by
        if ($order['order'] != null) {
            $columns = $order['columns'];
            $dir = $order['order'][0]['dir'];
            $order = $order['order'][0]['column'];
            $columns = $columns[$order];

            $order_colum = $columns['data'];
            $this->db->order_by($order_colum, $dir);
        } else {
            // $this->db->order_by('a.nama_depan', 'asc');
        }

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // filter
        if ($filter != null) {
            // by partner
            if ($filter['partner'] != '') {
                if ($filter['partner'] == '-') {
                    $this->db->where('e.nama IS NULL');
                } else if ($filter['partner'] != NULL) {
                    $this->db->where('b.id_partner', $filter['partner']);
                }
            }

            // by posisi
            if ($filter['posisi'] != '' or $filter['posisi'] == null) {
                if ($filter['posisi'] == '-') {
                    $this->db->where('e.nama IS NULL');
                } else if ($filter['posisi'] != NULL) {
                    $this->db->where('b.id_posisi', $filter['posisi']);
                }
            }

            if ($filter['kategorial'] != '') {
                if ($filter['kategorial'] == '-') {
                    $this->db->where('j.nama IS NULL');
                } else if ($filter['kategorial'] != NULL) {
                    $this->db->where('j.id', $filter['kategorial']);
                }
            }
            
            if ($filter['wilayah'] != '') {
                if ($filter['wilayah'] == '-') {
                    $this->db->where('k.nama IS NULL');
                } else if ($filter['wilayah'] != NULL) {
                    $this->db->where('k.id', $filter['wilayah']);
                }
            }

            if ($filter['keanggotaan'] != '') {
                if ($filter['keanggotaan'] == '-') {
                    $this->db->where('a.id_keanggotaan IS NULL');
                } else if ($filter['keanggotaan'] != NULL) {
                    $this->db->where('a.id_keanggotaan', $filter['keanggotaan']);
                }
            }

            if ($filter['usia'] != '') {
                $usia = explode("-" , $filter['usia']);
                $usia_1 = $usia[0];
                $usia_2 = $usia[1];
                $this->db->where('(year(curdate())-year(a.tanggal_lahir)) >= ', $usia_1);
                $this->db->where('(year(curdate())-year(a.tanggal_lahir)) <= ', $usia_2);
            }

            if($filter['jenis_kelamin'] != ''){
                $this->db->where('a.jenis_kelamin', $filter['jenis_kelamin']);
            }

            if($filter['level'] != ''){
                $this->db->where('h.lev_id', $filter['level']);
            }

            if($filter['ulang_tahun'] != ''){

                $this->db->where('DATE_FORMAT(a.tanggal_lahir, "%m") = "'.date('m').'"');
            }
        }
        // pencarian
        if ($cari != null) {
            $this->db->where("(
                h.lev_nama LIKE '%$cari%' or
                e.nama LIKE '%$cari%' or
                b.nik LIKE '%$cari%' or
                b.user_email LIKE '%$cari%' or
                a.nama_depan LIKE '%$cari%' or
                a.nama_belakang LIKE '%$cari%' or
                a.tanggal_lahir LIKE '%$cari%' or
                DATE_FORMAT(a.tanggal_lahir,'%d-%m-%Y') LIKE '%$cari%' or
                (year(curdate())-year(a.tanggal_lahir)) LIKE '%$cari%' or 
                concat(a.nama_belakang, ' ', a.nama_depan) LIKE '%$cari%' or
                concat(a.nama_depan, ' ', a.nama_belakang) LIKE '%$cari%' or
                (IFNULL(( SELECT wilayah.nama FROM profile_wilayah JOIN wilayah ON profile_wilayah.id_wilayah = wilayah.id
                    WHERE profile_wilayah.id_profile = a.id AND profile_wilayah.status = 1
                    ORDER BY profile_wilayah.created_at DESC LIMIT 1 ), '' )) LIKE '%$cari%' or
                (IFNULL(( SELECT kategorial.nama FROM profile_kategorial JOIN kategorial ON profile_kategorial.id_kategorial = kategorial.id
                    WHERE profile_kategorial.id_profile = a.id AND profile_kategorial.status = 1
                    ORDER BY profile_wilayah.created_at DESC LIMIT 1 ), '' )) LIKE '%$cari%' or
                (IFNULL(( SELECT jenis_gelar.nama FROM gelar JOIN jenis_gelar ON gelar.id_jenis_gelar = jenis_gelar.id
                    WHERE gelar.id_profile = a.id AND gelar.status = 1
                    ORDER BY gelar.tanggal_lulus DESC LIMIT 1 ), '' )) LIKE '%$cari%' or
                (IFNULL((SELECT `name` FROM data_formal JOIN dtm_peristiwa ON data_formal.dtm_peristiwa_id = dtm_peristiwa.id
                    WHERE data_formal.id_profile = a.id AND data_formal.status = 1
                    ORDER BY data_formal.tanggal_data_formal DESC LIMIT 1), '')) LIKE '%$cari%' or
                (IFNULL(( SELECT contact.keterangan FROM contact JOIN tipe_contact ON contact.id_tipe_contact = tipe_contact.id
                    WHERE contact.id_profile = a.id AND contact.status = 1
                    ORDER BY contact.created_at DESC LIMIT 1 ), '' )) LIKE '%$cari%' or
                (IFNULL(( SELECT tipe_contact.nama FROM contact JOIN tipe_contact ON contact.id_tipe_contact = tipe_contact.id
                    WHERE contact.id_profile = a.id AND contact.status = 1
                    ORDER BY contact.created_at DESC LIMIT 1 ), '' )) LIKE '%$cari%' or
                IF(a.jenis_kelamin = '1', 'Laki-Laki', IF(a.jenis_kelamin = '2', 'Perempuan', 'Tidak Diketahui')) LIKE '%$cari%' or
                (ifnull((SELECT jenis_membership.nama FROM membership join jenis_membership on jenis_membership.id = membership.id_jenis_membership WHERE id_profile = a.id limit 1), '')) LIKE '%$cari%' or
                IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%'
                )");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getFlat(){
        $result = $this->db->select('a.*, b.nama as keanggotaan_inisial, b.keterangan as keanggotaan_nama, c.nama as kategorial,
                                d.nama as wilayah
                            ')
                           ->join('kategori_keanggotaan b', 'b.id =  a.id_keanggotaan', 'left')
                           ->join('kategorial c', 'c.id =  a.id_kategorial', 'left')
                           ->join('wilayah d', 'd.id =  a.id_wilayah', 'left')
                           ->get_where('profile a', ['a.status' => 1])
                           ->result_array();
        return $result;
    }  
    
    public function getAllMember(){
        $result = $this->db->select("a.id, a.kode, IF(a.jenis_kelamin = '1', 'Laki-Laki', IF(a.jenis_kelamin = '2', 'Perempuan', 'Tidak Diketahui')) as jenis_kelamin_str,
                                 IF(a.flag = '2', 'Tidak Aktif', IF(a.flag = '1', 'Aktif', 'Tidak Diketahui')) as flag_str,
                                 a.nama_belakang, a.nama_depan, a.tanggal_registrasi, a.tanggal_lahir, a.tanggal_meninggal,
                                 f.nama as posisi, g.nama as keluarga, b.keterangan as keanggotaan, d.nama as wilayah, c.nama as kategorial,
                                 h.domisili as alamat
                            ")
                           ->join('kategori_keanggotaan b', 'b.id =  a.id_keanggotaan', 'left')
                           ->join('profile_kategorial pk', 'pk.id_profile = a.id', 'left')
                           ->join('kategorial c', 'c.id =  pk.id_kategorial', 'left')
                           ->join('profile_wilayah pw', 'pw.id_profile = a.id', 'left')
                           ->join('wilayah d', 'd.id =  pw.id_wilayah', 'left')
                           ->join('alamat h', 'h.id_profile =  a.id', 'left')
                           ->join('users e', 'e.user_id =  a.id_user', 'left')
                           ->join('posisi f', 'f.id =  e.id_posisi', 'left')
                           ->join('partner g', 'g.id =  e.id_partner', 'left')
                           ->group_by('a.id')
                           ->get_where('profile a', ['a.status' => 1])
                           ->result_array();
        return $result;
    }  

    public function getGrouping($id_partner=null){
        $result = $this->db->select('a.*, b.nama as keanggotaan_inisial, b.keterangan as keanggotaan_nama, c.nama as kategorial,
                                d.nama as wilayah
                            ')
                           ->join('kategori_keanggotaan b', 'b.id =  a.id_keanggotaan', 'left')
                           ->join('kategorial c', 'c.id =  a.id_kategorial', 'left')
                           ->join('wilayah d', 'd.id =  a.id_wilayah', 'left')
                           ->join('users e', 'e.user_id =  a.id_user')
                           ->get_where('profile a', ['a.status' => 1, 'e.id_partner' => $id_partner])
                           ->result_array();
        return $result;
    }

    public function getPartner(){
        $result = $this->db->get_where('partner a', ['a.status' => 1])->result_array();
        return $result;
    }   

    public function getMulti(){
        $result = $this->db->select('a.*, b.*,c.name as peristiwa, d.nama_depan as jabatan_nama_depan, d.nama_belakang as jabatan_nama_belakang, e.nama as institusi, b.photo as foto
                            ')
                           ->join('data_formal b', 'b.id_profile =  a.id', 'left')
                           ->join('dtm_peristiwa c', 'c.id =  b.dtm_peristiwa_id')
                           ->join('profile d', 'd.id = b.idjabatan')
                           ->join('institusi e', 'e.id = b.id_institusi')
                           ->get_where('profile a', ['a.status' => 1])
                           ->result_array();
        return $result;
    }   
}


// membership aktif cuma satu belum
