<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between w-100">
            <h3 class="card-title">List <?= $title ?></h3>
            <input type="hidden" id="isi-title" value="<?= $title ?>">
            <div class="row">
                <div class="col-md-12">
                    <a href="<?= base_url() ?>data-master/partner/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                    <a href="<?= base_url() ?>data-master/partner/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#import"><i class="fas fa-file-excel"></i> <span>Import Excel</span></button>.
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
                    <th>Nama</th>
                    <th>No Telepon</th>
                    <th>Email</th>
                    <th>Alamat</th>
                    <th>Photo</th>
                    <!-- <th>Status</th> -->
                    <th>Tanggal Dibuat</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
        <hr>
        <a style="float: right;" type="button" class="btn btn-primary btn-sm" href="<?=base_url()?>activity/logging?menu=<?=$this->modul?>"><i class="fa fa-search"></i> &nbsp; Log Aktifitas</a>
    </div>
    <!-- /.card-body -->
</div>

<div class="modal fade" id="myModalPhoto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form id="formPhoto" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelPhoto"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <img id="detail-photo" style="width: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Tutup
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <form id="form" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <input type="hidden" name="id" id="id">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nama">Nama</label>
                                <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" required />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="no_telepon">No Telepon</label>
                                <input type="number" class="form-control" id="no_telepon" name="no_telepon" placeholder="No Telepon" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="photo">Photo</label>
                            <div id="show-image-ubah">
                                <img id="ubah-photo" style="width: 100%;">
                                <br>
                                <br>
                            </div>
                            <input type="file" class="form-control" id="photo" name="photo" placeholder="Photo">
                          </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="lokasi">Alamat</label>
                                <textarea name="lokasi" id="lokasi" rows="3" class="form-control" placeholder="Alamat"></textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status" required>
                                    <option value="">Pilih Status</option>
                                    <option value="1">Aktif</option>
                                    <option value="0">Tidak Aktif</option>
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


<div class="modal fade" id="myModalLihat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width: 1200px!important;">
        <form id="form-lihat" enctype="multipart/form-data" method="POST" action="<?=base_url()?>data-master/partner/cetak">
            <input type="hidden" id="lihat-id" name="id_lihat">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelLihat"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label for="nama">Nama</label>                                        
                                    </div>
                                    <div class="col-md-1">
                                        <label for="nama">:</label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="lihat-nama" name="nama" placeholder="Nama" required readonly />                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label for="no_telepon">No Telepon</label>
                                    </div>
                                    <div class="col-md-1">
                                        <label for="no_telepon">:</label>
                                    </div>
                                    <div class="col-md-9">
                                       <input type="text" class="form-control" id="lihat-no_telepon" name="no_telepon" placeholder="No Telepon" required readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                 <div class="row">
                                    <div class="col-md-2">
                                        <label for="email">Email</label>
                                    </div>
                                    <div class="col-md-1">
                                        <label for="email">:</label>
                                    </div>
                                    <div class="col-md-9">
                                       <input type="email" class="form-control" id="lihat-email" name="email" placeholder="Email" required readonly/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="lokasi">Alamat&nbsp;&nbsp;&nbsp;:</label>
                                <textarea name="lokasi" id="lihat-lokasi" rows="4" class="form-control" placeholder="Alamat" readonly></textarea>
                            </div>
                        </div>


                        <div class="col-md-12">
                        <hr>
                            <table  class="table table-bordered">
                                <thead>
                                    <th>#</th>
                                    <th>Posisi</th>
                                    <th>NIK</th>
                                    <th>Kategori Anggota</th>
                                    <th>Email</th>
                                    <th>Nama</th>
                                    <th>Jenis Kelamin</th>
                                </thead>
                                <tbody id="table-detail-partner"></tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Tutup
                    </button>
                    <button class="btn btn-primary"><i class="fa fa-print"></i> Cetak</button>
                    <a class="btn btn-success" id="tambah-member"><i class="fa fa-plus"></i> Tambah Member</a>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>data-master/partner/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Import Data</h3>
                </div>
                <div class="modal-body">
                    <label>File(.xls) <a href="<?= base_url() ?>data-master/partner/downloadSample">Download sample file import</a></label>
                    <br>
                    <input type="file" name="file" id="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                </div>
                <div class="modal-footer">
                    <button id="clickImport" type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>

                    <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="modal-tambah-member" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width: 1200px!important;">
        <div class="modal-content">
             <div class="modal-header">
                <h3 class="modal-title custom-font">Tambah Member Baru</h3>
            </div>
            <form id="add-new-member" enctype="multipart/form-data">
                <input type="hidden" name="id" id="member-id">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="id_partner"><?=$partner_alias?></label>
                            <input type="hidden" class="form-control" name="id_partner" id="member-id-keluarga" >
                            <input type="text" class="form-control" id="member-keluarga" readonly="">
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="id_posisi">Posisi</label>
                              <select class="form-control" id="id_posisi" name="id_posisi">
                                <option value="">Pilih Posisi</option>
                                <?php foreach($posisi as $q):?>
                                    <option value="<?=$q['id']?>"><?=$q['nama']?></option>
                                <?php endforeach;?>
                              </select>
                          </div>
                        </div>
                         <div class="col-md-6">
                          <div class="form-group">
                            <label for="nama_belakang">Nama Belakang</label>
                            <input type="text" class="form-control" id="nama_belakang" name="nama_belakang" placeholder="Nama Belakang" required/>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="nama_depan">Nama Depan</label>
                            <input type="text" class="form-control" id="nama_depan" name="nama_depan" placeholder="Nama Depan"/>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email_member" name="email" placeholder="Email"/>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="id_level">Nama Level</label>
                            <select class="form-control" id="id_level" name="id_level">
                              <option value="">Pilih Nama Level</option>
                              <?php foreach ($level as $p) :?>
                                <option value="<?= $p['lev_id'] ?>" <?php if($p['lev_nama'] == "Reader") echo "selected";?>><?= $p['lev_nama'] ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                        </div>
                         <div class="col-md-4">
                          <div class="form-group">
                            <label for="nama_depan">Tanggal Registrasi</label>
                            <input type="date" class="form-control" id="tanggal_registrasi" name="tanggal_registrasi" placeholder="Tanggal Registrasi" value="<?php echo date('Y-m-d');?>" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="id_level">Flag</label>
                            <select class="form-control" id="flag" name="flag">
                              <option value="">Pilih Flag</option>
                              <option value="1">Aktif</option>
                              <option value="2">Pasif</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="nik">NIK</label>
                            <input type="text" class="form-control" id="nik" name="nik" placeholder="NIK" required readonly />
                          </div>
                        </div>
                       
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="jk">Jenis Kelamin</label>
                            <select class="form-control" id="jk" name="jk" required>
                              <option value="Laki-Laki">Laki-Laki</option>
                              <option value="Perempuan">Perempuan</option>
                            </select>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="photo">Photo</label>
                            <input type="file" class="form-control" id="photo" name="photo" placeholder="Photo" ?>
                          </div>
                        </div>        

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="nama_depan">Tanggal Lahir</label>
                            <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir" placeholder="Tanggal Lahir"/>
                          </div>
                        </div>

                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="nama_depan">Umur</label>
                            <input type="text" class="form-control" id="umur" name="umur" placeholder="Umur" />
                          </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="nama_depan">Tanggal Meninggal</label>
                            <input type="date" class="form-control" id="tanggal_meninggal" name="tanggal_meninggal" placeholder="Tanggal Meninggal"/>
                          </div>
                        </div>

                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="nama_depan">Umur(Terakhir)</label>
                            <input type="text" class="form-control" id="umur_terakhir" name="umur_terakhir" placeholder="Umur Terakhir" />
                          </div>
                        </div>

                    </div>
                </div>
                 <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Submit</button>

                    <button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
                </div>
            </form>
        </div>
    </div>
</div>

