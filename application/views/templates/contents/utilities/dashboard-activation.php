<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
       <form id="form" enctype="multipart/form-data" method="POST" action="<?=base_url()?>utilities/dashboardActivation/simpan">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">Statistik SPM, Repository, Aktifitas</label>
                                <select class="form-control" name="spm" id="spm">
                                    <option value="">Pilih muncul / tidak muncul-kan</option>
                                    <option value="1" <?php if(isset($getData)) if($getData['spm'] == 1) echo 'selected';?>>muncul</option>
                                    <option value="2" <?php if(isset($getData)) if($getData['spm'] == 2) echo 'selected';?>>tidak muncul-kan</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">P2PK</label>
                                <select class="form-control" name="p2pk" id="p2pk">
                                    <option value="">Pilih muncul / tidak muncul-kan</option>
                                    <option value="1" <?php if(isset($getData)) if($getData['p2pk'] == 1) echo 'selected';?>>muncul</option>
                                    <option value="2" <?php if(isset($getData)) if($getData['p2pk'] == 2) echo 'selected';?>>tidak muncul-kan</option>
                                </select>
                            </div>
                        </div>
                    </div>

                

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        Simpan
                    </button>
                    <input type="reset" class="btn btn-danger" value="Reset">
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div>
    <!-- /.card-body -->
</div>
