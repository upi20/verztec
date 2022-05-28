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
          <a href="<?=base_url()?>dashboard/reportUlangTahun" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action active">Data Ulang Tahun bulan ini <span class="badge badge-primary badge-pill"><?=$totalUlangTahun?></span></a>
          <a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Data Kelahiran tahun ini <span class="badge badge-primary badge-pill"><?=$totalLahir?></span></a>
          <a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action">Data Meninggal tahun ini<span class="badge badge-primary badge-pill"><?=$totalMeninggal?></span></a>
        </div>
    </div>
    <div class="col-12 col-sm-12 col-md-9">
        <div class="card card-info card-outline" id="ulang-tahun">
            <div class="card-header">
                <div class="container-fluid">
                    <table class="table" id="dt_basic_v2">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tanggal</th>
                                <th>Keluarga</th>
                                <th>Posisi</th>
                                <th>Keangotaan</th>
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