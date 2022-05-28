<style>
    .db-hover:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    }
</style>
<input type="hidden" value="<?php echo date('m');?>" id="isi-ulang-tahun">
<div class="row">
    <div class="col-12 col-sm-12 col-md-3">
       <div class="list-group">
          <a href="<?=base_url()?>dashboard/reportStatistikMember" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action active">Detail Statistik Member </a>
          <a href="<?=base_url()?>dashboard/reportStatistikWilayah" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$wilayah_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikWilayah?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKeanggotaan" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$kategori_keanggotaan_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikKeanggotaan?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKeaktifan" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Keaktifan <span class="badge badge-primary badge-pill"><?=$totalStatistikKeaktifan?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKategorial" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$kategorial_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikKategorial?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikDataFormal" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Data Formal <span class="badge badge-primary badge-pill"><?=$totalStatistikDataFormal?></span></a>
        </div>
    </div>
    <div class="col-12 col-sm-12 col-md-9">
        <div class="card card-info card-outline" id="ulang-tahun">
            <div class="card-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="jenis-informasi">
                                <option value="">*Pilih Detail Informasi</option>
                                <option value="Jumlah Keluarga">Jumlah Keluarga</option>
                                <option value="Jumlah Anggota">Jumlah Anggota</option>
                                <option value="Ulang Tahun">Ulang Tahun</option>
                                <option value="Kelahiran">Kelahiran</option>
                                <option value="Meninggal">Meninggal</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="hidden" value="<?php echo date('m');?>" name="bulan_ini" id="bulan_ini">
                                <div id="filter-ulang-tahun">
                                    <select class="form-control" name="bulan" id="bulan">
                                        <option value="">Pilih Bulan</option>
                                        <option value="01">Januari</option>
                                        <option value="02">Februari</option>
                                        <option value="03">Maret</option>
                                        <option value="04">April</option>
                                        <option value="05">Mei</option>
                                        <option value="06">Juni</option>
                                        <option value="07">Juli</option>
                                        <option value="08">Agustus</option>
                                        <option value="09">September</option>
                                        <option value="10">Oktober</option>
                                        <option value="11">November</option>
                                        <option value="12">Desember</option>
                                    </select>
                                </div>
                                <div id="filter-all">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="far fa-calendar-alt"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="tanggal" class="form-control float-right" id="filter_date" value="<?= date("m/d/Y", strtotime('-1 years')); ?> - <?= date("m/d/Y"); ?>">
                                    </div>
                                </div>
                                <div id="filter-kelahiran-meninggal">
                                    <select class="form-control" id="filter-usia" name="filter-usia" value="" style="width: 100%;">
                                      <option value="">Pilih Range Usia</option>
                                      <option value="0-12">0-12</option>
                                      <option value="13-18">13-18</option>
                                      <option value="19-25">19-25</option>
                                      <option value="26-40">26-40</option>
                                      <option value="41-55">41-55</option>
                                      <option value="56-65">56-65</option>
                                      <option value="66-80">66-80</option>
                                      <option value="81-1000">Diatas 80</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <input type="submit" class="btn btn-info btn" id="btn-filter" value="Cari" style="width: 100%;">
                        </div>
                        <div class="col-md-1">
                            <a class="btn btn-warning btn" href="<?= base_url() ?>dashboard/reportStatistikMember" style="width: 100%;"> Reset</a>
                        </div>

                    </div>
                    <hr>
                    <div id="filter-kosong">
                        <h3 class="btn btn-default" style="width: 100%; font-size: 24px; margin-top: 10px;">
                            Belum ada filter yang dipilih
                        </h3>
                    </div>
                    <table class="table table-bordered" id="table_keluarga">
                        <thead>
                            <tr>
                              <th>#</th>
                              <th>Tanggal</th>
                              <th>Nama Keluarga</th>
                            </tr>
                        </thead>
                    </table>

                    <table class="table table-bordered" id="table_anggota">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tanggal</th>
                                <th>NIK</th>
                                <th>Nama Lengkap</th>
                                <th>Tanggal Lahir</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>