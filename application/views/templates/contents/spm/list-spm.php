<div class="row">
  <div class="col-md-3 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">SPM</span>
        <span class="info-box-number"><?=$summary_spm?></span>
      </div>
    </div>
  </div>

  <div class="col-md-3 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">TRAINER</span>
        <span class="info-box-number"><?=$summary_trainer?></span>
      </div>
    </div>
  </div>

  <div class="col-md-3 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">STATUS[AKTIF]</span>
        <span class="info-box-number"><?=$summary_status_aktif?></span>
      </div>
    </div>
  </div>

  <div class="col-md-3 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">STATUS[TIDAK AKTIF]</span>
        <span class="info-box-number"><?=$summary_status_tidak?></span>
      </div>
    </div>
  </div>
</div>

<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <h3 class="card-title align-self-center m-1">Filter <?= $title ?>: </h3>
            <div class="d-flex justify-content-end align-items-star w-100 flex-md-row flex-column">
                <div class="ml-md-2">
                    <select class="form-control" id="filter-trainer" name="filter-trainer" style=" min-width:200px" value=""></select>
                </div>
                <div class="ml-md-2">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="far fa-calendar-alt"></i>
                                </span>
                            </div>
                            <input type="text" class="form-control float-right" id="filter_date" value="<?= date("m/d/Y", strtotime('-30 days')); ?> - <?= date("m/d/Y"); ?>">
                        </div>
                        <!-- /.input group -->
                    </div>
                </div>
                <div class="ml-md-2">
                    <button type="button" class="btn btn-info btn" id="btn-filter">Cari</button>
                </div>
                <div class="ml-md-2">
                    <a class="btn btn-warning btn" href="" style="width: 100%;"><i class="fas fa-undo"></i> Reset filter</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">Daftar SPM</h3>
            <div class="row">
                <div class="col-md-12">
                    <a id="btn_export_pdf" href="<?= base_url() ?>spm/listSPM/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a id="btn_export" href="<?= base_url() ?>spm/listSPM/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button>
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Tambah</button>
                </div>
            </div>

        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <table id="dt_basic" class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th style="max-width: 40px;">NO</th>
                    <th>Nama SPM</th>
                    <th>Trainer</th>
                    <th>Bahan</th>
                    <th>Absensi</th>
                    <!-- <th>Status</th> -->
                    <th>Tanggal</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
        <hr>
        <a style="float: right;" type="button" class="btn btn-primary btn-sm" href="<?=base_url()?>activity/logging?menu=<?=$this->modul?>"><i class="fa fa-search"></i> &nbsp; Log Aktifitas</a>
    </div>
    <!-- /.card-body -->
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="form" method="post" action="" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="judul">Nama SPM</label>
                                <input type="text" class="form-control" name="judul" id="judul" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="trainer">Trainer</label>
                                <select class="form-control" id="trainer" name="trainer" style=" width:100%" required></select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="bahan">Bahan</label>
                                <input type="file" class="form-control" id="bahan" name="bahan" placeholder="" accept=".xlsx,.xls,.doc,.docx,.ppt,.pptx,.pdf" ?>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="absensi">Absensi</label>
                                <input type="file" class="form-control" id="absensi" name="absensi" placeholder="" accept=".xlsx,.xls,.doc,.docx,.ppt,.pptx,.pdf" ?>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="resiko">Status</label>
                                <select class="form-control" id="status" name="status" required>
                                    <option value="">Pilih Status</option>
                                    <option value="1">Aktif</option>
                                    <option value="2">Tidak Aktif</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cancel
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>spm/listSPM/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Import Data</h3>
                </div>
                <div class="modal-body">
                    <label>File(.xls) <a href="<?= base_url() ?>spm/listSPM/downloadSample">Download sample file import</a></label>
                    <br>
                    <!-- <label><a target="_BLANK" href="<?= base_url() ?>data-master/trainer">Lihat list Trainer disini</a></label>
                    <br> -->
                    <input type="file" name="file" id="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                </div>
                <div class="modal-footer">
                    <button id="clickImport" type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>

                    <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tidak</button>
                </div>
            </form>
        </div>
    </div>
</div>