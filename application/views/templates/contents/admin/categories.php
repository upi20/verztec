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
                    <th style="max-width:100px">Action</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Used</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="nowrap">

                        <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-xs">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                    <td class="nowrap">Religion</td>
                    <td class="nowrap">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus dolorum tenetur doloremque consequuntur, aperiam eaque ducimus magni voluptas doloribus dicta autem obcaecati eveniet? Obcaecati laboriosam ipsum necessitatibus illum, eum atque!</td>
                    <td class="nowrap">900</td>
                </tr>
                <tr>
                    <td class="nowrap">

                        <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-xs">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                    <td class="nowrap">Education</td>
                    <td class="nowrap">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus dolorum tenetur doloremque consequuntur, aperiam eaque ducimus magni voluptas doloribus dicta autem obcaecati eveniet? Obcaecati laboriosam ipsum necessitatibus illum, eum atque!</td>
                    <td class="nowrap">300</td>
                </tr>
                <tr>
                    <td class="nowrap">

                        <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-xs">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                    <td class="nowrap">Journey</td>
                    <td class="nowrap">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus dolorum tenetur doloremque consequuntur, aperiam eaque ducimus magni voluptas doloribus dicta autem obcaecati eveniet? Obcaecati laboriosam ipsum necessitatibus illum, eum atque!</td>
                    <td class="nowrap">500</td>
                </tr>
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
                    <h4 class="modal-title" id="myModalLabel">Add New Category</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" required />
                    </div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" class="summernote"></textarea>
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
    <div class="modal-dialog">
        <div class=" modal-content">
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