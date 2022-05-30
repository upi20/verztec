<?php
$pricing = [
    [
        'id' => 1,
        'title' => 'Premium',
        'description' => 'For businesses just getting started',
        'price' => 49,
        'duration' => 30,
        'duration_name' => 'month',
        'member_max' => 1,
        'member' => 900,
        'status' => 'Active'
    ],
    [
        'id' => 2,
        'title' => 'Silver',
        'description' => 'For businesses investing in marketing with videos and podcasts',
        'price' => 99,
        'duration' => 30,
        'duration_name' => 'month',
        'member_max' => 30,
        'member' => 2000,
        'status' => 'Active'
    ],
    [
        'id' => 3,
        'title' => 'Gold',
        'description' => 'For businesses investing in marketing with videos and podcasts',
        'price' => 149,
        'duration' => 30,
        'duration_name' => 'month',
        'member_max' => 60,
        'member' => 600,
        'status' => 'Active'
    ],
];

$features = [
    [
        'id' => 1,
        'data' => [
            'All our standard features for videos and podcasts',
            '3 free videos or podcast episodes to embed anywhere',
            '1 Channel to share via public Wistia link',
            'Up to 250 Channel subscribers',
            'Wistia branding on the video player',
            'A/B testing',
        ]
    ],
    [
        'id' => 2,
        'data' => [
            'All our standard features for videos and podcasts',
            '10 free videos or podcast episodes to embed anywhere',
            '1 Channel to share via public Wistia link',
            'Up to 250 Channel subscribers with email notifications',
            'Add your own branding to the video player',
            'A/B testing',
            'Add as many video or audio files as you need for 25¢ per month',
        ]
    ],
    [
        'id' => 3,
        'data' => [
            'All our standard features for videos and podcasts',
            '100 free videos or podcast episodes to embed anywhere',
            'Multiple video and podcast Channels to embed on your site',
            '250+ Channel subscribers with email notifications',
            'Add your own branding to the video player',
            'A/B testing',
            'Add as many video or audio files as you need for 25¢ per month',
            '1 premium integration with HubSpot, Pardot, or Marketo',
            'Reach & Retarget with Facebook and Google integrations',
            'Priority support',
        ]
    ],
];

?>


<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
            <div class="row">
                <div class="col-md-12">
                    <a href="<?= base_url() ?>partner/posisi/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a href="<?= base_url() ?>partner/posisi/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <!-- <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button> -->
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Add</button>
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
                    <th>Action</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Duration</th>
                    <th>Duration Name</th>
                    <th>Max Member</th>
                    <th>Member</th>
                    <th>Features</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($pricing as $price) : ?>
                    <tr>
                        <td><?= $price['id'] ?></td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="delete_fun()">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                        <td><?= $price['title'] ?></td>
                        <td><?= $price['description'] ?></td>
                        <td>$<?= $price['price'] ?></td>
                        <td><?= $price['duration'] ?></td>
                        <td><?= $price['duration_name'] ?></td>
                        <td><?= $price['member_max'] ?></td>
                        <td><?= $price['member'] ?></td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="features('<?= $price['id'] ?>')">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                        <td><?= $price['status'] ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
        <hr>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-md-12">
        <div class="card " style="display: none;" id="freature-card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-list"></i>
                    Features
                </h3>

                <!-- tools card -->
                <div class="card-tools">
                    <button type="button" class="btn btn-success btn-sm" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-success btn-sm" data-card-widget="remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>

            <div class="card-body">
                <form action="" class="d-lg-flex flex-lg-row justify-content-between">

                    <input type="hidden" class="form-control" id="feature-id" />
                    <input type="text" class="form-control" id="feature" name="feature" placeholder="Add Feature" required />

                    <button type="reset" class="btn btn-primary ml-lg-2 nowrap" id="btn-feature-save">
                        <i class="fas fa-save"></i> Save
                    </button>

                    <button type="button" class="btn btn-info ml-lg-2 nowrap" id="btn-feature-update" onclick="feature_cancel()" style="display: none;">
                        <i class="fas fa-save"></i> Update
                    </button>

                    <button type="button" class="btn btn-danger ml-lg-2 nowrap" id="btn-feature-cancel" onclick="feature_cancel()" style="display: none;">
                        <i class="fas fa-times"></i>
                    </button>

                </form>
                <hr>
                <h3 class="card-title">List Feature</h3>
                <br>
                <table id="dt_feature" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <td>Feature</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <!--The calendar -->
    </div>
</div>
<!-- /.card -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="form" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Add Pricing</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">

                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Pricing Title" required />
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" rows="3" id="description" name="description" placeholder="Pricing Description"></textarea>
                    </div>


                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <label for="price">Price</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="fas fa-dollar-sign"></i>
                                    </span>
                                </div>
                                <input type="number" class="form-control" id="price" name="price" placeholder="Price" required />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label for="max_member">Max Member</label>
                                <input type="number" class="form-control" id="max_member" name="max_member" placeholder="Max Member" required />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label for="duration">Duration</label>
                                <input type="number" class="form-control" id="duration" name="duration" placeholder="Duration" required />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group">
                                <label for="duration_name">Duration Name</label>
                                <input type="text" class="form-control" id="duration_name" name="duration_name" placeholder="Duration Name" required />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option value="">Select Status</option>
                            <option value="1">Active</option>
                            <option value="2">Nonactive</option>
                        </select>
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

<script>
    const features_json = '<?= json_encode($features) ?>';
</script>