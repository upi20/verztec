<!-- filter -->
<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <div class="d-flex justify-content-end  align-items-star w-100 flex-md-row flex-column">
                <h3 class="card-title align-self-center">Filter : </h3>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Status</option>
                        <option value="">Saved</option>
                        <option value="">Publish</option>
                        <option value="">Takedown</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Soruce</option>
                        <option value="">Hyperlink</option>
                        <option value="">File</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Tag</option>
                        <option value="">Religion</option>
                        <option value="">Education</option>
                        <option value="">Journey</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Category</option>
                        <option value="">Religion</option>
                        <option value="">Education</option>
                        <option value="">Journey</option>
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
            <span class="info-box-icon bg-info"><i class="fas fa-book"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Total Book</span>
                <span class="info-box-number">500 Book</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-info"><i class="fas fa-project-diagram"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Total Category</span>
                <span class="info-box-number">3 Category</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-info"><i class="fas fa-hashtag"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Total Tag</span>
                <span class="info-box-number">3 Tag</span>
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
                    <a href="<?= base_url() ?>partner/posisi/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a href="<?= base_url() ?>partner/posisi/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <!-- <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button> -->
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
                    <th class="nowrap">Action</th>
                    <th class="nowrap">Status</th>
                    <th class="nowrap">Title</th>
                    <th class="nowrap">Author</th>
                    <th class="nowrap">Description</th>
                    <th class="nowrap">File Full</th>
                    <th class="nowrap">File Trial</th>
                    <th class="nowrap">Source</th>
                    <th class="nowrap">Category</th>
                    <th class="nowrap">Liked</th>
                    <th class="nowrap">Saved</th>
                    <th class="nowrap">View</th>
                    <th class="nowrap">Subscriber</th>
                    <th class="nowrap">Tags</th>
                    <th class="nowrap">Total Page</th>
                    <th class="nowrap">Cover</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($dataset as $d) :
                    switch ($d->status) {
                        case 0:
                            $status = '<span class="badge bg-info">Saved</span>';
                            break;
                        case 1:
                            $status = '<span class="badge bg-success">Publish</span>';
                            break;
                        case 2:
                            $status = '<span class="badge bg-danger">Takedown</span>';
                            break;

                        default:
                            $status = '<span class="badge bg-warning">Unknown</span>';
                    }


                ?>
                    <tr>
                        <td><?= $d->id ?></td>
                        <td>
                            <button class="btn btn-primary btn-sm nowrap my-1">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-danger btn-sm nowrap my-1">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                        <td><?= $status ?></td>
                        <td><?= $d->title ?></td>
                        <td><?= $d->author ?></td>
                        <td><?= $d->description ?></td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                        <td>
                            <!-- <i class="fas fa-file-alt"></i>
                            <i class="fas fa-external-link"></i>
                            <i class="fas fa-question"></i> -->
                            <?php switch ($d->source) {
                                case 'Hyperlink':
                                    echo '<span class="badge bg-primary">Hyperlink</span>';
                                    break;

                                case 'File':
                                    echo '<span class="badge bg-success">File</span>';
                                    break;

                                default:
                                    echo '<span class="badge bg-danger">Unknown</span>';

                                    break;
                            } ?>
                        </td>
                        <td><?= $d->category ?></td>
                        <td><?= $d->liked ?></td>
                        <td><?= $d->saved ?></td>
                        <td><?= $d->seen ?></td>
                        <td><?= $d->subscriber ?></td>
                        <td><?= $d->tags ?></td>
                        <td><?= $d->total_page ?></td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
        <hr>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <form id="form" enctype="multipart/form-data">
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
                                <label for="nama">Nama</label>
                                <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" required />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">No Urut</label>
                                <input type="number" class="form-control" id="no_urut" name="no_urut" placeholder="No Urut" required />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="status">Status</label>
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
                        Simpan
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Batal
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