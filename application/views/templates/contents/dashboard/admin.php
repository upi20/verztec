<style>
    .db-hover:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    }
</style>

<?php if(isset($activation)):?>
    
    <div class="row">
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik Member: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-2">
            <a href="<?= base_url() ?>dashboard/reportStatistikMember?filter=Jumlah Keluarga" class="db-hover info-box text-decoration-none text-dark btn">
                <img src="<?= base_url() ?>files/dashboard/partner.png" alt="" style="width: 65px; height: 65px;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-2">
                            <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                <?= $totalPatner; ?>
                            </span>
                        </div>
                        <div class="col-10">
                            <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -20px;">Jumlah <?=$partner_alias?></span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-2">
            <a href="<?= base_url() ?>dashboard/reportStatistikMember?filter=Jumlah Anggota" class="db-hover info-box text-decoration-none text-dark btn">
                <img src="<?= base_url() ?>files/dashboard/pengguna.png" alt="" style="width: 65px; height: 65px;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-2">
                            <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                <?= $totalPengguna; ?>
                            </span>
                        </div>
                        <div class="col-10">
                            <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -12px;">Jumlah Anggota</span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>        

        <div class="col-12 col-sm-6 col-md-2">
            <a href="<?= base_url() ?>dashboard/reportStatistikMember?filter=Ulang Tahun" class="db-hover info-box text-decoration-none text-dark btn">
                <img src="<?= base_url() ?>files/dashboard/company.png" alt="" style="width: 65px; height: 65px;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-2">
                            <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px; padding-top: 12px;">
                                <?= $totalUlangTahun; ?>
                            </span>
                        </div>
                        <div class="col-10">
                            <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -10px;">
                                Ulang Tahun<br>(<?php echo date("M-Y");?>)
                            </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>

       <!--  <div class="col-12 col-sm-6 col-md-6">
            <form action="<?=base_url()?>dashboard/cariData" method="POST">
                <div class="card card-info card-outline" id="filter">
                    <div class="card-header">
                        <div class="container-fluid" style="margin-bottom: -3px; margin-top: 15px;">
                            <h3 class="card-title align-self-center m-1">Filter: <?php if(isset($filter_tanggal)) echo "(".$filter_tanggal.")";?></h3>
                            <div class="d-flex justify-content-end align-items-star flex-md-row flex-column">
                                <div class="ml-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="far fa-calendar-alt"></i>
                                                </span>
                                            </div>
                                            <input type="text" name="tanggal" class="form-control float-right" id="filter_date" value="<?= date("m/d/Y", strtotime('-1 years')); ?> - <?= date("m/d/Y"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="ml-md-2">
                                    <input type="submit" class="btn btn-info btn" id="btn-filter" value="Cari">
                                </div>
                                <div class="ml-md-2">
                                    <a class="btn btn-warning btn" href="<?= base_url() ?>dashboard" style="width: 100%;"> Reset</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div> -->
        <div class="col-12 col-sm-6 col-md-2">
            <a href="<?=base_url()?>dashboard/reportStatistikMember?filter=Kelahiran" class="db-hover info-box text-decoration-none text-dark btn">
                <img src="<?= base_url() ?>files/dashboard/company.png" alt="" style="width: 65px; height: 65px;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-2">
                            <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                <?= $totalLahir; ?>
                            </span>
                        </div>
                        <div class="col-10">
                            <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -12px;">
                            Kelahiran</span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-2">
            <a href="<?=base_url()?>dashboard/reportStatistikMember?filter=Meninggal" class="db-hover info-box text-decoration-none text-dark btn">
                <img src="<?= base_url() ?>files/dashboard/company.png" alt="" style="width: 65px; height: 65px;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-2">
                            <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                <?= $totalMeninggal; ?>
                            </span>
                        </div>
                        <div class="col-10">
                            <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -22px;">
                            Meninggal</span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>

        
        <!-- wilayah -->
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik <?=$wilayah_alias?>: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-10">
            <div class="row">
                <?php foreach ($wilayah as $q):
                    $totalWilayah = $this->db->select('count(*) as jumlah')
                                       ->join('profile_wilayah b', 'b.id_profile = a.id')
                                       ->where('b.id_wilayah', $q['id'])
                                       ->where('b.status', 1)
                                       ->get('profile a')
                                       ->row_array();
                ?>
                    <div class="col-12 col-sm-6 col-md-3">
                        <a href="<?= base_url() ?>dashboard/reportStatistikWilayah?filter=<?=$q['id']?>" class="db-hover info-box text-decoration-none text-dark btn">
                            <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                            <div class="info-box-content info-box-content text-left ml-3">
                                <div class="row">
                                    <div class="col-2">
                                        <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                            <?= $totalWilayah['jumlah']; ?>
                                        </span>
                                    </div>
                                    <div class="col-10">
                                        <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -25px;"><?=$q['nama']?></span> 
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
        <!-- tutup wilayah -->

        <!-- kategori keanggotaan -->
        <div class="col-12"></div>
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik <?=$kategori_keanggotaan_alias?>: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-10">
            <div class="row">
                <?php foreach ($kategoriKeanggotaan as $q):
                    $getTotal = $this->db->select('count(*) as jumlah')
                                        ->join('profile_keanggotaan b', 'b.id_profile = a.id')
                                        // ->join('kategori_keanggotaan c', 'c.id = b.id_kategori_keanggotaan')
                                        ->where('b.id_kategori_keanggotaan',$q['id'])
                                        ->where('b.status',2)
                                        ->where('a.status',1)
                                        ->get('profile a')
                                        ->row_array();
                    $jumlahKeanggotaan = $getTotal['jumlah'];
                ?>
                <div class="col-12 col-sm-6 col-md-3">
                    <a href="<?= base_url() ?>dashboard/reportStatistikKeanggotaan?filter=<?=$q['id']?>" class="db-hover info-box text-decoration-none text-dark btn">
                        <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                        <div class="info-box-content info-box-content text-left ml-3">
                            <div class="row">
                                <div class="col-2">
                                    <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                        <?= $jumlahKeanggotaan; ?>
                                    </span>
                                </div>
                                <div class="col-10">
                                    <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -18px;"><?=$q['keterangan']." (".$q['nama'].")"?></span> 
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <?php $jumlahKeanggotaan=0; endforeach;?>

                <?php $getTotalMenunggu = $this->db->select('count(*) as jumlah')
                                        ->join('profile_keanggotaan b', 'b.id_profile = a.id')
                                        ->where('b.status',1)
                                        ->where('a.status',1)
                                        ->get('profile a')
                                        ->row_array();
                ?>
                <div class="col-12 col-sm-6 col-md-3">
                    <a href="#" class="db-hover info-box text-decoration-none text-dark btn">
                        <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                        <div class="info-box-content info-box-content text-left ml-3">
                            <div class="row">
                                <div class="col-2">
                                    <span class="info-box-number mt-0" style="text-align: left; font-size: 22px; margin-left: -20px;">
                                        <?= $getTotalMenunggu['jumlah']; ?>
                                    </span>
                                </div>
                                <div class="col-10">
                                    <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -20px;">
                                        Menunggu Konfirmasi</span> 
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- tutup kategori keanggotaan -->

        <!-- Keaktiftan -->
        <div class="col-12"></div>
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik Keaktifan: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-10">
            <div class="row">
                <?php foreach ($jabatan as $q):
                    $totalJabatan = $this->db->select('count(*) as jumlah')
                                       ->join('profile_keaktifan b', 'b.id_profile = a.id')
                                       ->where('b.kode_master', $q['nama'])
                                       ->where('b.status', 1)
                                       ->get('profile a')
                                       ->row_array();
                ?>
                    <div class="col-12 col-sm-6 col-md-3">
                        <a href="<?= base_url() ?>dashboard/reportStatistikKeaktifan?filter=<?=$q['nama']?>" class="db-hover info-box text-decoration-none text-dark btn">
                            <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                            <div class="info-box-content info-box-content text-left ml-3">
                                <div class="row">
                                    <div class="col-2">
                                        <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                            <?= $totalJabatan['jumlah']; ?>
                                        </span>
                                    </div>
                                    <div class="col-10">
                                        <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -25px;"><?=$q['nama']?></span> 
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
        <!-- tutup Keaktiftan -->

        <!-- Kategorial -->
        <div class="col-12"></div>
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik <?=$kategorial_alias?>: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-10">
            <div class="row">
                <?php foreach ($kategorial as $q):
                    $totalKategorial = $this->db->select("count(*) as jumlah")
                                       ->where('b.id_kategorial', $q['id'])
                                       ->where('b.status', 1)
                                       ->get('profile_kategorial b')
                                       ->row_array();
                    if($totalKategorial == null){
                        $jumlahKategorial = 0;
                    }else{
                        $jumlahKategorial = $totalKategorial['jumlah'];
                    }
                ?>
                    <div class="col-12 col-sm-6 col-md-3">
                        <a href="<?= base_url() ?>dashboard/reportStatistikKategorial?filter=<?=$q['id']?>" class="db-hover info-box text-decoration-none text-dark btn">
                            <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                            <div class="info-box-content info-box-content text-left ml-3">
                                <div class="row">
                                    <div class="col-2">
                                        <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                            <?= $jumlahKategorial; ?>
                                        </span>
                                    </div>
                                    <div class="col-10">
                                        <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -25px;"><?=$q['nama']?></span> 
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
        <!-- tutup Kategorial -->

        <!-- Data Formal -->
        <div class="col-12"></div>
        <div class="col-12 col-sm-6 col-md-2">
            <a href="#" class="db-hover info-box text-decoration-none text-dark btn" style="background: transparent!important;">
                <div class="info-box-content info-box-content text-left ml-3">
                    <div class="row">
                        <div class="col-12">
                            <span class="info-box-text text-capitalize" style="font-size: 20px; text-align: right; padding-top: 0px; margin-left: -20px;">Statistik Data Formal: </span> 
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-12 col-sm-6 col-md-10">
            <div class="row">
                <?php foreach ($dataFormal as $q):
                    $totalDataFormal = $this->db->select('count(*) as jumlah')
                                       ->join('data_formal b', 'b.id_profile = a.id')
                                       ->where('b.dtm_peristiwa_id', $q['id'])
                                       // ->where('b.status', 1)
                                       ->get('profile a')
                                       ->row_array();
                ?>
                    <div class="col-12 col-sm-6 col-md-3">
                        <a href="<?= base_url() ?>dashboard/reportStatistikDataFormal?filter=<?=$q['id']?>" class="db-hover info-box text-decoration-none text-dark btn">
                            <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 65px; height: 65px;">
                            <div class="info-box-content info-box-content text-left ml-3">
                                <div class="row">
                                    <div class="col-2">
                                        <span class="info-box-number mt-0" style="text-align: left; font-size: 26px; margin-left: -20px;">
                                            <?= $totalDataFormal['jumlah']; ?>
                                        </span>
                                    </div>
                                    <div class="col-10">
                                        <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 10px; margin-left: -25px;"><?=$q['name']?></span> 
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
        <!-- tutup data formal -->
    </div>
    
    <?php if($activation['spm'] == 1):?>
        <hr>
        <div class="row">
            <div class="col-12">
                <h6>Statistik SPM, Repository, Aktifitas</h6>
            </div>

            <?php if($activation['spm'] == 1):?>
            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>spm/listSPM" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/spm.png" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalSPM; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah SPM</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endif;?>

            <?php if($activation['repository'] == 1):?>
            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>repository/listRepository" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/repository.png" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalRepository; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Repository</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endif;?>

            <?php if($activation['aktifitas'] == 1):?>
            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>activity/master" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/activity.png" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalActivity; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Aktifitas</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endif;?>
        </div>
    <?php endif;?>

    <?php if($activation['p2pk'] == 1):?>
        <div class="row">
            <div class="col-12">
                <h6>Statistik P2PK</h6>
            </div>
            <!-- p2pk -->
            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKProgres; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Proses P2PK</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=2" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKSelesai; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Selesai P2PK</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PK; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Keseluruhan P2PK</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus1; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Planning Dalam Proses</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus2; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Planning Selesai</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus1+$totalP2PKStatus2; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Total Jumlah Planning</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus3; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Proses Audit Proses</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus4; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Proses Audit Selesai</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus3+$totalP2PKStatus4; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Total Jumlah Proses Audit</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus5; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Report Phase 1 Proses</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus6; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Report Phase 1 Selesai</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus5+$totalP2PKStatus6; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Total Jumlah Report Phase 1</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus7; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Report Phase 2 Proses</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus8; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Report Phase 2 Selesai</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus7+$totalP2PKStatus8; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Total Jumlah Report Phase 2 </span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus9; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Final Report Proses</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus10; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Jumlah Final Report Selesai</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-12 col-sm-6 col-md-4">
                <a href="<?= base_url() ?>p2pk/listP2PK?filter-status=1" class="db-hover info-box text-decoration-none text-dark btn">
                    <img src="<?= base_url() ?>files/dashboard/icon-audit.jpeg" alt="" style="width: 65px; height: 65px;">
                    <div class="info-box-content info-box-content text-left ml-3">
                        <div class="row">
                            <div class="col-2">
                                <span class="info-box-number mt-0" style="text-align: left; font-size: 40px;">
                                    <?= $totalP2PKStatus9+$totalP2PKStatus10; ?>
                                </span>
                            </div>
                            <div class="col-10">
                                <span class="info-box-text text-capitalize" style="text-align: left; padding-top: 20px;">Total Jumlah Final Report</span> 
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    <?php endif;?>

<?php endif;?>
