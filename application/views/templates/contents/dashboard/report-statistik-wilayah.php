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
          <a href="<?=base_url()?>dashboard/reportStatistikMember" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Member </a>
          <a href="<?=base_url()?>dashboard/reportStatistikWilayah" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action active">Detail Statistik <?=$wilayah_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikWilayah?></span></a>
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
                        <div class="col-md-7">
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="jenis-wilayah">
                                <option value="">*Pilih <?=$wilayah_alias?></option>
                                <?php foreach($wilayah as $q):?>
                                    <option value="<?=$q['id']?>"><?=$q['nama']?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="col-md-3" style="display: none;">
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
                        <div class="col-md-1">
                            <input type="submit" class="btn btn-info btn" id="btn-filter" value="Cari" style="width: 100%;">
                        </div>
                        <div class="col-md-1">
                            <a class="btn btn-warning btn" href="<?= base_url() ?>dashboard/reportStatistikMember" style="width: 100%;"> Reset</a>
                        </div>

                    </div>
                    <hr>
                    
                    <table class="table table-bordered" id="table_anggota">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th><?=$wilayah_alias?></th>
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