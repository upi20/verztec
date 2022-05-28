<style>
    .db-hover:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    }
</style>
<input type="hidden" value="<?php echo date('Y-m');?>" id="isi-ulang-tahun">
<div class="row">
    <div class="col-12 col-sm-12 col-md-3">
       <div class="list-group">
          <a href="<?=base_url()?>dashboard/reportStatistikMember" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Member </a>
          <a href="<?=base_url()?>dashboard/reportStatistikWilayah" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$wilayah_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikWilayah?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKeanggotaan" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$kategori_keanggotaan_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikKeanggotaan?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKeaktifan" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Keaktifan <span class="badge badge-primary badge-pill"><?=$totalStatistikKeaktifan?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikKategorial" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik <?=$kategorial_alias?> <span class="badge badge-primary badge-pill"><?=$totalStatistikKategorial?></span></a>
          <a href="<?=base_url()?>dashboard/reportStatistikDataFormal" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Detail Statistik Data Formal <span class="badge badge-primary badge-pill"><?=$totalStatistikDataFormal?></span></a>
        </div>
    </div>

     <div class="col-12 col-sm-12 col-md-9">
        <a href="<?=base_url()?>dashboard/reportUlangTahun" style="color: black;">
            <div class="card card-info card-outline">
                <div class="card-header">
                    <div class="container-fluid" style="text-align: center;">
                        <br>
                        <h3 class="btn btn-default" style="width: 100%; font-size: 24px; margin-top: 10px;">
                            Belum ada laporan yang dipilih
                        </h3>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </a>
    </div>
    
</div>