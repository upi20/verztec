<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
       <form id="form" enctype="multipart/form-data" method="POST" action="<?=base_url()?>utilities/applicationSetting/simpan">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">Nama Aplikasi</label>
                                <input type="text" class="form-control" id="nama_aplikasi" name="nama_aplikasi" placeholder="Nama" required value="<?php if(isset($getData['nama_aplikasi'])) echo $getData['nama_aplikasi'];?>" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">Keterangan</label>
                                <textarea class="form-control" name="keterangan" id="keterangan"><?php if(isset($getData['keterangan'])) echo $getData['keterangan'];?></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nama">Logo</label>
                                <input type="file" id="logo" name="logo" class="form-control">
                                <br>
                                <?php if(isset($getData['logo'])):?>
                                    <img src="<?=base_url()?>files/utilities/application-setting/<?=$getData['logo']?>" style="width: 100%;">
                                <?php endif;?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nama">Favicon</label>
                                <input type="file" id="favicon" name="favicon" class="form-control">
                                <br>
                                <?php if(isset($getData['favicon'])):?>
                                    <img src="<?=base_url()?>files/utilities/application-setting/<?=$getData['favicon']?>" style="width: 100%;">
                                <?php endif;?>
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
