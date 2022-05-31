<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
            <div class="row">
                <div class="col-md-12">
                    <a href="<?= base_url() ?>partner/posisi/export_pdf" class="btn btn-danger btn-xs"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a href="<?= base_url() ?>partner/posisi/export_excel" class="btn btn-success btn-xs"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <!-- <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button> -->
                    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Add</button>
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
                    <th class="nowrap">Name</th>
                    <th class="nowrap">Date Of Birth</th>
                    <th class="nowrap">Gender</th>
                    <th class="nowrap">Email</th>
                    <th class="nowrap">Phone Number</th>
                    <th class="nowrap">Organization</th>
                    <th class="nowrap">City</th>
                    <th class="nowrap">Address</th>
                    <th class="nowrap">Country</th>
                    <th class="nowrap">Church Name</th>
                    <th class="nowrap">Since</th>
                    <th class="nowrap">Product</th>
                </tr>
            </thead>

            <tbody>

                <?php foreach ($dataset as $d) : ?>
                    <tr>
                        <td class="nowrap"><?= $d->id ?></td>
                        <td class="nowrap">
                            <button class="btn btn-primary btn-xs nowrap my-1" data-toggle="modal" data-target="#myModal">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-danger btn-xs nowrap my-1" onclick="delete_fun()">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                        <td class="nowrap"><?= $d->name ?></td>
                        <td class="nowrap"><?= $d->date_of_birth ?></td>
                        <td class="nowrap"><?= $d->gender ?></td>
                        <td class="nowrap"><?= $d->email ?></td>
                        <td class="nowrap"><?= $d->phone ?></td>
                        <td class="nowrap"><?= $d->organization ?></td>
                        <td class="nowrap"><?= $d->city ?></td>
                        <td class="nowrap"><?= $d->address ?></td>
                        <td class="nowrap"><?= $d->country ?></td>
                        <td class="nowrap"><?= $d->church_name ?></td>
                        <td class="nowrap"><?= '2022' . '-' . explode('-', (explode(' ', $d->since)[0]))[1] . ' ' . explode('-', (explode(' ', $d->since)[0]))[2] . ' ' . explode(' ', $d->since)[1] ?></td>
                        <td class="nowrap"><?= $d->packet ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <hr>
    </div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="form" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Add New Member</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" required />
                    </div>

                    <div class="form-group">
                        <label for="number">Phone Number</label>
                        <input type="number" class="form-control" id="number" name="number" placeholder="Phone Number" required />
                    </div>

                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="city" placeholder="Full Name" required />
                    </div>

                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="city" placeholder="Full Name" required />
                    </div>
                    <label for="address">Address</label>
                    <textarea id="address" class="summernote"></textarea>

                    <div class="form-group">
                        <label for="packet">Packet</label>
                        <select class="form-control select2" value="" id="packet" style="width: 100%;">
                            <option value="">Select Packet</option>
                            <option value="">Premium</option>
                            <option value="">Silver</option>
                            <option value="">Gold</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        Save
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