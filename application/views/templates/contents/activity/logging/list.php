<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <h3 class="card-title align-self-center m-1">Filter <?= $title ?>: </h3>
            <div class="d-flex justify-content-end align-items-star w-100 flex-md-row flex-column">
                <div class="ml-md-2">
                    <select class="form-control" id="filter-modul" name="filter-modul" style=" min-width:200px" value=""></select>
                </div>
                <div class="ml-md-2">
                    <select class="form-control" id="filter-by" name="filter-by" style=" min-width:200px" value=""></select>
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
                    <button type="button" class="btn btn-info btn button-cari" id="btn-filter">Cari</button>
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
            <h3 class="card-title">Daftar <?= $title ?></h3>
            <div class="row">
                <div class="col-md-12">
                    <a id="btn_export_pdf" href="<?= base_url() ?>activity/logging/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a id="btn_export" href="<?= base_url() ?>activity/logging/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <table id="dt_basic" class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th style="max-width: 30px;">NO</th>
                    <th>Tanggal</th>
                    <th>Modul</th>
                    <th>By</th>
                    <th>Jenis Perubahan</th>
                    <th>Data Lama</th>
                    <th style="width: 30%;">Data Baru</th>
                </tr>
            </thead>
        </table>
    </div>
    <!-- /.card-body -->
</div>