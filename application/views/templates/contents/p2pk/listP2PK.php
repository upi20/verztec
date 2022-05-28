<div class="row">
  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">P2PK</span>
        <span class="info-box-number"><?=$summary_p2pk?></span>
      </div>
    </div>
  </div>

  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">AUDIT UMUM</span>
        <span class="info-box-number"><?=$summary_p2pk_au?></span>
      </div>
    </div>
  </div>

  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>
      <div class="info-box-content">
        <span class="info-box-text">AUDIT KHUSUS</span>
        <span class="info-box-number"><?=$summary_p2pk_ak?></span>
      </div>
    </div>
  </div>

  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">PIC</span>
        <span class="info-box-number"><?=$summary_p2pk_pic?></span>
      </div>
    </div>
  </div>

  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">STATUS[PROSES]</span>
        <span class="info-box-number"><?=$summary_p2pk_proses?></span>
      </div>
    </div>
  </div>

  <div class="col-md-2 col-sm-6 col-12">
    <div class="info-box">
      <span class="info-box-icon bg-info"><i class="far fa-star"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">STATUS[SELESAI]</span>
        <span class="info-box-number"><?=$summary_p2pk_selesai?></span>
      </div>
    </div>
  </div>

</div>

<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <h3 class="card-title align-self-center m-1">Filter <?= $title ?>: </h3>
            <div class="d-flex justify-content-end align-items-star flex-md-row flex-column">
                <input type="hidden" id="filter-judul" name="filter-judul">
                <div class="ml-md-3">
                    <div class="form-group">
                        <select class="form-control" name="filter-kategori" id="filter-kategori">
                            <option value="">--Kategori--</option>
                        </select>
                    </div>
                </div>
                <div class="ml-md-3">
                    <div class="form-group">
                        <select class="form-control" name="filter-client" id="filter-client">
                            <option value="">--Klien--</option>
                        </select>
                    </div>
                </div>
                <div class="ml-md-2">
                    <div class="form-group">
                        <select class="form-control" name="filter-status" id="filter-status">
                            <option value="">--Status--</option>
                            <option value="1">Proses</option>
                            <option value="2">Selesai</option>
                        </select>
                    </div>
                </div>
                <div class="ml-md-2">
                    <div class="form-group">
                        <select class="form-control" name="filter-status_proses" id="filter-status_proses">
                            <option value="">--Status Proses--</option>
                            <option value="1">Planning Dalam Proses</option>
                            <option value="2">Planning Selesai</option>
                            <option value="3">Proses Audit Dalam Proses</option>
                            <option value="4">Proses Audit Selesai</option>
                            <option value="5">Report Phase 1 Dalam Proses</option>
                            <option value="6">Report Phase 1 Selesai</option>
                            <option value="7">Report Phase 2 Dalam Proses</option>
                            <option value="8">Report Phase 2 Selesai</option>
                            <option value="9">Report Final Report Dalam Proses</option>
                            <option value="10">Report Final Report Selesai</option>
                        </select>
                    </div>
                </div>
                <div class="ml-md-2">
                    <button type="button" class="btn btn-info btn" id="btn-filter">Cari</button>
                </div>
                <div class="ml-md-2">
                    <a class="btn btn-warning btn" href="<?= base_url() ?>p2pk/ListP2PK" style="width: 100%;"><i class="fas fa-undo"></i> Reset filter</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-end align-items-star w-100 flex-md-row flex-column">
            <div class="row">
                <div class="col-md-12">
                    <a id="btn_export_pdf" href="<?= base_url() ?>p2pk/listP2PK/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a id="btn_export" href="<?= base_url() ?>p2pk/listP2PK/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <?php if($this->member == 2):?>
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Tambah</button>
                    <?php endif;?>
                </div>
            </div>

        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <table id="dt_basic" class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th style="max-width: 120px;">Kode</th>
                    <th>Kategori</th>
                    <th>Klien</th>
                    <th>PIC</th>
                    <th>Judul</th>
                    <th>Risiko</th>
                    <th>Status</th>
                    <th>Status Proses</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
        <hr>
        <a style="float: right;" type="button" class="btn btn-primary btn-sm" href="<?=base_url()?>activity/logging?menu=<?=$this->modul?>"><i class="fa fa-search"></i> &nbsp; Log Aktifitas</a>
    </div>
    <!-- /.card-body -->
</div>

<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                <label for="id_client">Kategori</label>
                                <select class="form-control" id="id_kategori" name="id_kategori" style="width: 100%;" required></select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id_client">Kode</label>
                                <input type="text" readonly="" id="kode" name="kode" readonly="" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id_client">Klien</label>
                                <select class="form-control" id="id_client" name="id_client" style="width: 100%;" required></select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id_pic">PIC</label>
                                <select class="form-control" id="id_pic" name="id_pic" style="width: 100%;" required></select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id_pic">Judul</label>
                                <input type="text" class="form-control" id="judul" name="judul" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="resiko">Risiko</label>
                                <select class="form-control" id="id_resiko" name="id_resiko" style="width: 100%;" disabled></select>
                            </div>
                        </div>
                    </div>

                    <div class="row d-none">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="resiko">Status</label>
                                <select class="form-control" id="status" name="status" required>
                                    <!-- <option value="">Pilih Status</option> -->
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