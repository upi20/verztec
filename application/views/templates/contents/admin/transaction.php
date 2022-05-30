<!-- filter -->
<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <div class="d-flex justify-content-end  align-items-star w-100 flex-md-row flex-column">
                <h3 class="card-title align-self-center">Filter : </h3>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Status</option>
                        <option value="">Pending</option>
                        <option value="">Success</option>
                        <option value="">Failed</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Member Type</option>
                        <option value="">Individual</option>
                        <option value="">Organization</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <button type="button" class="btn btn-info btn" id="btn-filter" style="width: 100%;"><i class="fas fa-search"></i> Search</button>
                </div>
                <div class="ml-lg-2">
                    <a class="btn btn-warning btn" href="" style="width: 100%;"><i class="fas fa-undo"></i> Reset filter</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Summary -->
<div class="row">
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-info"><i class="fas fa-receipt"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Total Transaction</span>
                <span class="info-box-number">1000</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-success"><i class="fas fa-check"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Success</span>
                <span class="info-box-number">990</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-info"><i class="fas fa-pause"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Pendding</span>
                <span class="info-box-number">7</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-danger"><i class="fas fa-times"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Failed</span>
                <span class="info-box-number">3</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-primary"><i class="fas fa-users"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Organization</span>
                <span class="info-box-number">119</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-secondary"><i class="fas fa-user"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Individual</span>
                <span class="info-box-number">891</span>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
            <div class="row">
                <div class="col-md-12">
                    <a href="<?= base_url() ?>partner/posisi/export_pdf" class="btn btn-danger btn-xs"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a href="<?= base_url() ?>partner/posisi/export_excel" class="btn btn-success btn-xs"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <!-- <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button> -->
                    <!-- <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Add</button> -->
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
                    <th class="nowrap">Action</th>
                    <th class="nowrap">Status</th>
                    <th class="nowrap">Transaction Id</th>
                    <th class="nowrap">Date</th>
                    <th class="nowrap">Member Name</th>
                    <th class="nowrap">Member Type</th>
                    <th class="nowrap">Description</th>
                    <th class="nowrap">Amount ($)</th>
                    <th class="nowrap">Product</th>
                </tr>
            </thead>

            <tbody>

                <?php foreach ($dataset as $d) :
                    switch ($d->status) {
                        case 0:
                            $status = '<span class="badge bg-info">Pending</span>';
                            break;
                        case 1:
                            $status = '<span class="badge bg-success">Success</span>';
                            break;
                        case 2:
                            $status = '<span class="badge bg-danger">Failed</span>';
                            break;

                        default:
                            $status = '<span class="badge bg-warning">Unknown</span>';
                    }


                ?>
                    <tr>
                        <td class="nowrap"><?= $d->id ?></td>
                        <td class="nowrap">
                            <!-- <button class="btn btn-primary btn-xs " data-toggle="modal" data-target="#myModal">
                                <i class="fas fa-edit"></i> Edit
                            </button> -->
                            <!-- <button class="btn btn-danger btn-xs ">
                                <i class="fas fa-trash"></i> Delete
                            </button> -->
                            <button class="btn btn-info btn-xs " data-toggle="modal" data-target="#myModal">
                                <i class="fas fa-eye"></i> View
                            </button>
                        </td>
                        <td class="nowrap"><?= $status ?></td>
                        <td class="nowrap"><?= $d->transaction_id ?></td>
                        <td class="nowrap"><?= '2022' . '-' . explode('-', (explode(' ', $d->datetime)[0]))[1] . ' ' . explode('-', (explode(' ', $d->datetime)[0]))[2] . ' ' . explode(' ', $d->datetime)[1] ?></td>
                        <td class="nowrap"><?= $d->member ?></td>
                        <td class="nowrap"><?= rand(0, 1) ? '<span class="badge bg-primary">Organization</span>' : '<span class="badge bg-secondary">Individual</span>' ?> </td>
                        <td class="nowrap"><?= $d->description ?></td>
                        <td class="nowrap text-right"><?= number_format($d->amount, 2, ".", ",") ?></td>
                        <td class="nowrap"><?= $d->product ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <hr>
    </div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Detail Transaction</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table style="width: 100%">
                    <tr>
                        <td class="nowrap">Transaction Id</td>
                        <td>:</td>
                        <td>22541a8f-8694-3cf0-805f-ff08ac78c4ea</td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td>:</td>
                        <td>2022-07 19 13:06:07</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>:</td>
                        <td><span class="badge bg-success">Success</span></td>
                    </tr>
                    <tr>
                        <td>Product</td>
                        <td>:</td>
                        <td>YellowGreen</td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>:</td>
                        <td>$<?= number_format(150, 2, ".", ",") ?></td>
                    </tr>
                    <tr>
                        <td>Member</td>
                        <td>:</td>
                        <td>Eveline</td>
                    </tr>
                    <tr>
                        <td>Member Type</td>
                        <td>:</td>
                        <td><span class="badge bg-secondary">Individual</span></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td>:</td>
                        <td>Quos alias reprehenderit et et. Praesentium quis animi impedit quod ut adipisci officia. Vel quia quod et. Facere quibusdam id quibusdam quidem</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    Close
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>partner/posisi/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Import Data</h3>
                </div>
                <div class="modal-body">
                    <label>File(.xls) <a href="<?= base_url() ?>partner/posisi/downloadSample">Download sample file import</a></label>
                    <br>
                    <input type="file" name="file" id="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                </div>
                <div class="modal-footer">
                    <button id="clickImport" type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Simpan</button>

                    <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Batal</button>
                </div>
            </form>
        </div>
    </div>
</div>