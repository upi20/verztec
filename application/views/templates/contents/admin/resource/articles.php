<!-- filter -->
<div class="card card-info card-outline" id="filter">
    <div class="card-header">
        <div class="container-fluid">
            <div class="d-flex justify-content-end  align-items-star w-100 flex-md-row flex-column">
                <h3 class="card-title align-self-center">Filter : </h3>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Status</option>
                        <option value="">Draft</option>
                        <option value="">Publish</option>
                        <option value="">Unpublish</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Soruce</option>
                        <option value="">Hyperlink</option>
                        <option value="">Write</option>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    <select class="form-control select2" style=" min-width:150px" value="" style="width: 100%;">
                        <option value="">Select Author</option>
                        <?php foreach ($authors as $author) : ?>
                            <option value="<?= $author ?>"><?= $author ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group  mb-lg-0 ml-lg-2">
                    Tags:
                    <select class="form-control select2" multiple style=" min-width:150px" value="" style="width: 100%;" aria-placeholder="Select Tag">
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
                <span class="info-box-text">Total Article</span>
                <span class="info-box-number">1000</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-secondary"><i class="fas fa-save"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Draft</span>
                <span class="info-box-number">25</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-primary"><i class="fas fa-upload"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Publish</span>
                <span class="info-box-number">960</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-danger"><i class="fas fa-times"></i></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Unpublish</span>
                <span class="info-box-number">15</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-info"><i class="fas fa-pencil-alt"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Write</span>
                <span class="info-box-number">975</span>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-6 col-12">
        <div class="info-box">
            <span class="info-box-icon bg-primary"><i class="fas fa-link"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Hyperlink</span>
                <span class="info-box-number">25</span>
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
                    <th class="nowrap">Status</th>
                    <th class="nowrap">Title</th>
                    <th class="nowrap">Author</th>
                    <th class="nowrap">Description</th>
                    <th class="nowrap">Article Full</th>
                    <th class="nowrap">Article Trial</th>
                    <th class="nowrap">Source</th>
                    <th class="nowrap">Category</th>
                    <th class="nowrap">Liked</th>
                    <th class="nowrap">Saved</th>
                    <th class="nowrap">View</th>
                    <th class="nowrap">Comments</th>
                    <th class="nowrap">Tags</th>
                    <th class="nowrap">Thumbnails</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($dataset as $d) :
                    switch ($d->status) {
                        case 0:
                            $status = '<span class="badge bg-info">Draft</span>';
                            break;
                        case 1:
                            $status = '<span class="badge bg-success">Publish</span>';
                            break;
                        case 2:
                            $status = '<span class="badge bg-warning">Unpublish</span>';
                            break;

                        default:
                            $status = '<span class="badge bg-warning">Unknown</span>';
                    }


                ?>
                    <tr>
                        <td class="nowrap"><?= $d->id ?></td>
                        <td class="nowrap">
                            <button class="btn btn-primary btn-xs nowrap my-1" data-toggle="modal" data-target="#myModal">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-danger btn-xs nowrap my-1" onclick="delete_fun()">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                            <button class="btn btn-secondary btn-xs nowrap my-1">
                                <i class="fas fa-file-alt"></i> Review
                            </button>
                        </td>
                        <td class="nowrap"><?= $status ?></td>
                        <td class="nowrap"><?= $d->title ?></td>
                        <td class="nowrap"><?= $d->author ?></td>
                        <td class="nowrap"><?= $d->description ?></td>
                        <td class="nowrap">
                            <button class="btn btn-info btn-xs">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                        <td class="nowrap">
                            <button class="btn btn-info btn-xs">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                        <td class="nowrap">
                            <!-- <i class="fas fa-file-alt"></i>
                            <i class="fas fa-external-link"></i>
                            <i class="fas fa-question"></i> -->
                            <?php switch ($d->source) {
                                case 'Hyperlink':
                                    echo '<span class="badge bg-primary">Hyperlink</span>';
                                    break;

                                case 'File':
                                    echo '<span class="badge bg-success">Write</span>';
                                    break;

                                default:
                                    echo '<span class="badge bg-danger">Unknown</span>';

                                    break;
                            } ?>
                        </td>
                        <td class="nowrap"><?= $d->category ?></td>
                        <td class="nowrap"><?= $d->liked ?></td>
                        <td class="nowrap"><?= $d->saved ?></td>
                        <td class="nowrap"><?= $d->seen ?></td>
                        <td class="nowrap"><?= $d->subscriber ?></td>
                        <td class="nowrap"><?= $d->tags ?></td>
                        <td class="nowrap">
                            <button class="btn btn-info btn-xs">
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
    <div class="modal-dialog modal-lg">
        <form id="form" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Add New Article</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="titile">Title</label>
                                <input type="text" class="form-control" id="titile" name="titile" placeholder="Article Title" required />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="author">Author</label>
                                <select class="form-control" value="author" id="author" name="" style="width: 100%;">
                                    <option value="">Select Author</option>
                                    <?php foreach ($authors as $author) : ?>
                                        <option value="<?= $author ?>"><?= $author ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label for="article_trial">Description</label>
                            <textarea id="article_trial" class="summernote"></textarea>
                        </div>
                        <div class="col-md-12 url">
                            <div class="form-group">
                                <label for="url_full">Url</label>
                                <input type="url" class="form-control" id="url_full" name="url_full" placeholder="Url Article" required />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="source">Soruce</label>
                                <select class="form-control" id="source" name="source" required>
                                    <option value="file">Write</option>
                                    <option value="hyperlink">Hyperlink</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tags">Tags</label>
                                <select id="tags" class="form-control select2" multiple value="" style="width: 100%;" aria-placeholder="Select Tag">
                                    <option value="">Religion</option>
                                    <option value="">Education</option>
                                    <option value="">Journey</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="category">Category</label>
                                <select id="category" class="form-control" id="category" value="" style="width: 100%;" aria-placeholder="Select Tag">
                                    <option value="">Select Category</option>
                                    <option value="">Religion</option>
                                    <option value="">Education</option>
                                    <option value="">Journey</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="thumbnails">File Thumbnails</label>
                                <input type="file" class="form-control" id="thumbnails" name="thumbnails" placeholder="Thumbnails" required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status" required>
                                    <option value="">Select Status</option>
                                    <option value="">Draft</option>
                                    <option value="">Publish</option>
                                    <option value="">Unpublish</option>
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