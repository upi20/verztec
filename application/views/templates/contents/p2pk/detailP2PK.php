<div class="">
	<div class="card">
		<div class="card-header">
			<div class="d-flex justify-content-between w-100">
				<h3 class="card-title">Detail P2PK</h3>
				<div class="row">
					<div class="col-md-12">
				       <a style="float: right;" type="button" class="btn btn-primary btn-sm" href="<?=base_url()?>activity/logging?menu=<?=$this->modul?>&cari=<?=$isi['kode']?>"><i class="fa fa-search"></i> &nbsp; Log Aktifitas</a>
						<!-- <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Tambah</button> -->
					</div>
				</div>

			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body">

			<div class="informasi-head">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<table id="" class="table table-bordered table-striped table-hover">
									<tbody>
										<tr>
											<td>Kategori</td>
											<td><?= $isi['kategori'] ?></td>
										</tr>
										<tr>
											<td>Kode</td>
											<td><?= $isi['kode'] ?></td>
										</tr>
										<tr>
											<td>Klien</td>
											<td><?= $isi['client'] ?></td>
										</tr>
										<tr>
											<td>PIC</td>
											<td><?= $isi['pic'] ?></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-6">
								<table id="" class="table table-bordered table-striped table-hover">
									<tbody>
										<tr>
											<td>Judul</td>
											<td><?= $isi['judul'] ?></td>
										</tr>
										<tr>
											<td>Risiko</td>
											<td><label class="btn <?php if($isi['resiko'] == 'High') echo 'btn-danger'; elseif($isi['resiko'] == 'Medium') echo 'btn-warning'; else echo 'btn-success';?> btn-sm" style="margin-bottom: -2px;margin-top: -2px;"><?= $isi['resiko'] ?></label></td>
										</tr>
										<tr>
											<td>Status</td>
											<td><?= $isi['status_str'] ?></td>
										</tr>
										<tr>
											<td>Status Proses</td>
											<td><?= $isi['status_proses_str'] ?></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
								
					</div>
				</div>
			</div>

			<div class="tombol">
				<div class="d-md-flex justify-content-around">
					<button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-planning">PLANNING</button>
					<button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-audit">PROSES AUDIT</button>
					<button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-report">REPORT</button>
				</div>
			</div>

			<div class="planning m-1" id="v-planning">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body ">
							<div class="row">
			                  <div class="col-sm-12">
			                  	<div class="callout callout-info">
				                  <h5>Catatan</h5>

				                  <p>1. Form bisa di isi sebagian terlebih dahulu untuk disimpan</p>
				                  <p>2. Untuk lanjut ke tahap <b>Proses Audit</b>, harus diisi lengkap form <b>Planning</b> nya</p>
				                </div>
			                  </div>
			                </div>
							<h3 class="text-center">Planning</h3>
							<form id="form-planning" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="id_p2pk" id="id_p2pk" value="<?= $isi['id'] ?>">
								<input type="hidden" name="id_planning" id="id_planning" value="<?= $planning != null ? $planning['id'] : '' ?>">

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="judul">Judul</label>
											<input type="text" class="form-control" id="judul" name="judul" placeholder="Judul" value="<?= $planning != null ? $planning['judul'] : '' ?>" <?= !isset($setshow) ? ('readonly') : '' ?> <?= $isi['status'] == 2 ? ('readonly') : '' ?> required />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="deskripsi">Deskripsi</label>
											<textarea name="deskripsi" id="deskripsi" rows="3" required class="form-control" placeholder="Deskripsi" <?= !isset($setshow) ? ('readonly') : '' ?> <?= $isi['status'] == 2 ? ('readonly') : '' ?>><?= $planning != null ? $planning['deskripsi'] : '' ?></textarea>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<table style="width: 100%;" class="table table-bordered">
												<thead>
													<tr>
														<th colspan="3" style="text-align: center;">
															<label for="timeline">Data Timeline</label>
														</th>
													</tr>
													<tr>
														<th style="width: 33.3%;">File Template</th>
														<th style="width: 33.3%;">Upload File</th>
														<th style="width: 33.3%;">File Terlampir</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<a href="#" data-toggle="modal" data-target="#download-timeline" id="btn-download-timeline" class="btn btn-sm btn-default" style="width: 100%;">Unduh File Template</a>
														</td>
														<td>
															<?php if (isset($setshow)) : ?>
																<?php if ($isi['status'] == '1') : ?>
																	<input type="file" class="form-control" name="timeline" id="timeline" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip">
																<?php endif; ?>
															<?php endif; ?>
														</td>
														<td>
															<?php if ($planning != null && $planning['timeline'] != null) :?>
																<input type="hidden" id="planning_isi_timeline" value="<?= $planning['timeline'] ?>">
																<a class="btn btn-primary btn-sm float-right" href="<?= base_url() ?>files/p2pk/planning/<?= $planning['timeline'] ?>" style="width: 100%;"><i class="fa fa-download"></i> &nbsp;<?= $planning['timeline'] ?></a>
															<?php else:?>
																File belum diupload
															<?php endif;?>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<table style="width: 100%;" class="table table-bordered">
												<thead>
													<tr>
														<th colspan="3" style="text-align: center;">
															<label for="timeline">Data SDM</label>
														</th>
													</tr>
													<tr>
														<th style="width: 33.3%;">File Template</th>
														<th style="width: 33.3%;">Upload File</th>
														<th style="width: 33.3%;">File Terlampir</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<a href="#" data-toggle="modal" data-target="#download-sdm" id="btn-download-sdm" class="btn btn-sm btn-default" style="width: 100%;">Unduh File Template</a>
														</td>
														<td>
															<?php if (isset($setshow)) : ?>
																<?php if ($isi['status'] == '1') : ?>
																	<input type="file" class="form-control" name="sdm" id="sdm" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip">
																<?php endif; ?>
															<?php endif; ?>
														</td>
														<td>
															<?php if ($planning != null && $planning['sdm'] != null) :?>
																<input type="hidden" id="planning_isi_sdm" value="<?= $planning['sdm'] ?>">
																<a class="btn btn-primary btn-sm float-right" href="<?= base_url() ?>files/p2pk/planning/<?= $planning['sdm'] ?>" style="width: 100%;"><i class="fa fa-download"></i> &nbsp;<?= $planning['sdm'] ?></a>
															<?php else:?>
																File belum diupload
															<?php endif;?>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<table style="width: 100%;" class="table table-bordered">
												<thead>
													<tr>
														<th colspan="3" style="text-align: center;">
															<label for="timeline">Data Yang Diminta</label>
														</th>
													</tr>
													<tr>
														<th style="width: 33.3%;">File Template</th>
														<th style="width: 33.3%;">Upload File</th>
														<th style="width: 33.3%;">File Terlampir</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<a href="#" data-toggle="modal" data-target="#download-data-yang-diminta" id="btn-download-data-yang-diminta" class="btn btn-sm btn-default" style="width: 100%;">Unduh File Template</a>
														</td>
														<td>
															<?php if (isset($setshow)) : ?>
																<?php if ($isi['status'] == '1') : ?>
																	<input type="file" class="form-control" name="diminta" id="diminta" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip">
																<?php endif; ?>
															<?php endif; ?>
														</td>
														<td>
															<?php if ($planning != null && $planning['diminta'] != null) :?>
																<input type="hidden" id="planning_isi_diminta" value="<?= $planning['diminta'] ?>">
																<a class="btn btn-primary btn-sm float-right" href="<?= base_url() ?>files/p2pk/planning/<?= $planning['diminta'] ?>" style="width: 100%;"><i class="fa fa-download"></i> &nbsp;<?= $planning['diminta'] ?></a>
															<?php else:?>
																File belum diupload
															<?php endif;?>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<?php
								if ($lvuser == "Super Admin" || $lvuser == "Partner L2") : ?>
									<?php if ($isi['status'] == '1') : ?>
										<hr>
										<button type="submit" class="btn btn-primary">
											Simpan Data Planning
										</button>
										<span class="btn btn-warning" id="planning_info_persentase">
											Total Persentase Form Planning [0%]
										</span>
									<?php endif; ?>
								<?php endif; ?>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="audit m-1" id="v-audit">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body ">
							<div class="row">
			                  <div class="col-sm-12">
			                  	<div class="callout callout-info">
				                  <h5>Catatan</h5>

				                  <p>1. Form bisa di isi sebagian terlebih dahulu untuk disimpan</p>
				                  <p>2. Untuk lanjut ke tahap <b>Report</b>, harus diisi lengkap form <b>Proses Audit</b> nya</p>
				                </div>
			                  </div>
			                </div>
							<h3 class="text-center">Proses Audit</h3>
							<?php
							if ($isi['status_proses'] < 2) :
								echo '<h3 class="text-center">Selesaikan Planning Terlebih Dahulu</h3>';
							else :
							?>
								<form id="form-audit" method="" action="" enctype="multipart/form-data">
									<input type="hidden" name="id_p2pk" id="id_p2pk" value="<?= $isi['id'] ?>">
									<input type="hidden" name="id_audit" id="id_audit" value="<?= $audit != null ? $audit['id'] : '' ?>">

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="judul">Judul</label>
												<input type="text" class="form-control" id="judul_audit" name="judul" placeholder="Judul" value="<?= $audit != null ? $audit['judul'] : '' ?>" <?= !isset($setshow) ? ('readonly') : '' ?> <?= $isi['status'] == 2 ? ('readonly') : '' ?> required />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="deskripsi">Deskripsi</label>
												<textarea name="deskripsi" id="deskripsi_audit" required rows="3" class="form-control" placeholder="Deskripsi" <?= !isset($setshow) ? ('readonly') : '' ?> <?= $isi['status'] == 2 ? ('readonly') : '' ?>><?= $audit != null ? $audit['deskripsi'] : '' ?></textarea>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<table style="width: 100%;" class="table table-bordered">
													<thead>
														<tr>
															<th colspan="3" style="text-align: center;">
																<label for="timeline">Data Kertas Kerja</label>
															</th>
														</tr>
														<tr>
															<th style="width: 33.3%;">File Template</th>
															<th style="width: 33.3%;">Upload File</th>
															<th style="width: 33.3%;">File Terlampir</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<a href="#" data-toggle="modal" data-target="#download-kertas-kerja" id="btn-download-kertas-kerja" class="btn btn-sm btn-default" style="width: 100%;">Unduh File Template</a>
															</td>
															<td>
																<?php if (isset($setshow)) : ?>
																	<?php if ($isi['status'] == '1') : ?>
																		<input type="file" class="form-control" name="kertas_kerja" id="kertas_kerja" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip">
																	<?php endif; ?>
																<?php endif; ?>
															</td>
															<td>
																<?php if ($audit != null && $audit['kertas_kerja'] != null) :?>
																	<input type="hidden" id="proses_audit_kertas_kerja" value="<?= $audit['kertas_kerja'] ?>">
																	<a class="btn btn-primary btn-sm float-right" href="<?= base_url() ?>files/p2pk/audit/<?= $audit['kertas_kerja'] ?>" style="width: 100%;"><i class="fa fa-download"></i> &nbsp;<?= $audit['kertas_kerja'] ?></a>
																<?php else:?>
																	File belum diupload
																<?php endif;?>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<table style="width: 100%;" class="table table-bordered">
													<thead>
														<tr>
															<th colspan="3" style="text-align: center;">
																<label for="timeline">Data Pengujian</label>
															</th>
														</tr>
														<tr>
															<th style="width: 33.3%;">File Template</th>
															<th style="width: 33.3%;">Upload File</th>
															<th style="width: 33.3%;">File Terlampir</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<a href="#" data-toggle="modal" data-target="#download-pengujian" id="btn-download-pengujian" class="btn btn-sm btn-default" style="width: 100%;">Unduh File Template</a>
															</td>
															<td>
																<?php if (isset($setshow)) : ?>
																	<?php if ($isi['status'] == '1') : ?>
																		<input type="file" class="form-control" name="pengujian" id="pengujian" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip">
																	<?php endif; ?>
																<?php endif; ?>
															</td>
															<td>
																<?php if ($audit != null && $audit['pengujian'] != null) :?>
																	<input type="hidden" id="proses_audit_pengujian" value="<?= $audit['pengujian'] ?>">
																	<a class="btn btn-primary btn-sm float-right" href="<?= base_url() ?>files/p2pk/audit/<?= $audit['pengujian'] ?>" style="width: 100%;"><i class="fa fa-download"></i> &nbsp;<?= $audit['pengujian'] ?></a>
																<?php else:?>
																	File belum diupload
																<?php endif;?>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<?php
									if ($lvuser == "Super Admin" || $lvuser == "Partner L2") :
									?>
										<?php if ($isi['status'] == '1') : ?>
											<hr>
											<button type="submit" class="btn btn-primary">
												Simpan Data Proses Audit
											</button>
											<span class="btn btn-warning" id="proses_audit_info_persentase">
												Total Persentase Form Proses Audit [0%]
											</span>
										<?php endif; ?>
									<?php
									endif;
									?>
								</form>
							<?php
							endif;
							?>
						</div>
					</div>
				</div>
			</div>

			<div class="report m-1" id="v-report">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body ">
							<h3 class="text-center">Report</h3>
							<?php
							if ($isi['status_proses'] < 4) :
								echo '<h3 class="text-center">Selesaikan Proses Audit Terlebih Dahulu</h3>';
							else :
							?>
								<form id="form-report" method="" action="" enctype="multipart/form-data">
									<input type="hidden" name="id" id="id">
									<div class="row">
										<div class="col-md-12">
											<table class="table table-striped table-hover">
												<thead>
													<tr>
														<th scope="col">Report Phase</th>
														<th scope="col">Status</th>
													</tr>
												</thead>
												<tbody>
													<?php
													foreach ($dataReportHead as $rpth) :
													?>
														<tr>
															<td><?= $rpth['report_phase'] != 3 ? ('Phase ' . $rpth['report_phase']) : 'Final Report' ?></td>
															<td><?= $rpth['status_str'] ?></td>
														</tr>
													<?php
													endforeach;
													?>
												</tbody>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<h3 for="">Draft Report</h3>
												<a href="#" data-toggle="modal" data-target="#download-report" id="btn-download-report" class="btn btn-sm btn-default">Unduh File Template</a>
											</div>
										</div>
									</div>

									<!-- Untuk Admin Staff -->
									<div class="row">
										<div class="col-md-12">
											<table id="formReport" class="table table-bordered table-striped table-hover">
												<thead>
													<th>Report Phase</th>
													<th>File</th>
													<th>Tanggal Upload</th>
													<th>Approval</th>
													<th>Tanggal Approval Diminta</th>
													<th>Komentar</th>
													<th>Status</th>
													<th>Aksi</th>
												</thead>
												<tbody>
													<?php
													$status_file_komentar = 0;
													if ($lvmember != 1 || $lvuser == "Super Admin" || $lvuser == "Partner L2") :
													?>
														<?php
														foreach ($dataReport as $rpt) :
															$status_file_komentar = $rpt['status_kondisi_file_komentar'];
															?>
															<tr>
																<td>Phase <?= $rpt['report_phase'] ?></td>
																<td>
																	<button type="button" class="btn btn-primary btn-sm" data-status_kondisi_upload_file="<?=$rpt['status_kondisi_upload_file']?>" data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-report_phase="<?= $rpt['report_phase'] ?>" data-file="<?= $rpt['file'] ?>" onclick="uploadReport(this)"><i class="fa fa-search"></i> Lihat Data Upload</button>
																</td>
																<td><?= $rpt['tanggal_upload'] != '' ? date('H:i d-m-Y', strtotime($rpt['tanggal_upload'])) : 'Waiting for Document' ?></td>
																<td>
																	<?php if ($rpt['id_approval'] != 0):?>
																		<button type="button" class="btn btn-primary btn-sm" data-status_kondisi_approval="<?=$rpt['status_kondisi_approval']?>" data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-kode="<?= $rpt['kode'] != 0 ? $rpt['kode'] : '' ?>" data-approval="<?= $rpt['id_approval'] != 0 ? $rpt['id_approval'] : '' ?>" data-report_phase="<?= $rpt['report_phase'] != 0 ? $rpt['report_phase'] : '' ?>" onclick="pilihApproval(this)"><i class="fa fa-search"></i> Lihat Approval</button>
																	<?php else: ?>
																		<button type="button" class="btn btn-primary btn-sm" data-status_kondisi_approval="<?=$rpt['status_kondisi_approval']?>" data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-kode="<?= $rpt['kode'] != 0 ? $rpt['kode'] : '' ?>" data-approval="<?= $rpt['id_approval'] != 0 ? $rpt['id_approval'] : '' ?>" data-report_phase="<?= $rpt['report_phase'] != 0 ? $rpt['report_phase'] : '' ?>" onclick="pilihApproval(this)"><i class="fa fa-search"></i> Pilih Approval</button>
																	<?php endif;?>
																</td>
																<td><?= $rpt['tanggal_approval_diminta'] != '' ? date('H:i d-m-Y', strtotime($rpt['tanggal_approval_diminta'])) : 'Waiting for Select Approval' ?></td>
																<td>
																	<?php
																	if ($rpt['file_komen'] != null || $rpt['file_komen'] != '' || $rpt['komentar'] != null || $rpt['komentar'] != '') {
																	?>
																		<button type="button" class="btn btn-primary btn-sm" data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-report_phase="<?= $rpt['report_phase'] ?>" data-file_komen="<?= $rpt['file_komen'] ?>" data-tanggal_komentar_submit="<?= $rpt['tanggal_komentar_submit'] != '' ? date('H:i d-m-Y', strtotime($rpt['tanggal_komentar_submit'])) : '' ?>" data-komentar="<?= $rpt['komentar'] ?>" onclick="lihatKomen(this)"><i class="fa fa-search"></i> Lihat Komentar</button>
																	<?php
																	} else {
																		echo "Belum ada komentar";
																	}
																	?>
																</td>
																<td>
																	<?php if($rpt['status_kondisi_file_komentar'] == 2):?>
																			Draft selesai di submit
																		<?php else:?>
																			<?= $rpt['status_str'] ?></td>
																		<?php endif;?>

																</td>
																<td>
																	<?php if($rpt['status_kondisi_upload_file'] == 0):?>
																		<!-- <a href="#" class="btn btn-primary">-</a> -->
																	<?php elseif($rpt['status_kondisi_upload_file'] == 1):?>
																		<!-- <a class="btn btn-primary btn-sm" data-status_kondisi_upload_file="<?=$rpt['status_kondisi_upload_file']?>" data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-report_phase="<?= $rpt['report_phase'] ?>" data-file="<?= $rpt['file'] ?>" onclick="updateReport(this)"><i class="fa fa-save"></i> Submit Data Upload</a> -->
																	<?php elseif($rpt['status_kondisi_upload_file'] == 2):?>
																	<?php endif;?>

																	<?php if($rpt['status_kondisi_approval'] == 0):?>
																		<!-- <a href="#" class="btn btn-primary"></a> -->
																	<?php elseif($rpt['status_kondisi_approval'] == 1):?>
																		<a class="btn btn-primary btn-sm" data-status_kondisi_approval="<?=$rpt['status_kondisi_approval']?>"  data-id_p2pk="<?= $rpt['id_p2pk'] ?>" data-id="<?= $rpt['id'] ?>" data-kode="<?= $rpt['kode'] != 0 ? $rpt['kode'] : '' ?>" data-approval="<?= $rpt['id_approval'] != 0 ? $rpt['id_approval'] : '' ?>" data-report_phase="<?= $rpt['report_phase'] != 0 ? $rpt['report_phase'] : '' ?>" onclick="updateApproval(this)"><i class="fa fa-save"></i> Submit Data Approval</a>
																	<?php elseif($rpt['status_kondisi_approval'] == 2):?>
																	<?php endif;?>

																</td>
															</tr>
														<?php
														endforeach;
														?>
													<?php
													else :
													?>
														<?php
														foreach ($dataReportApprover as $rpta) :
															if($rpta['status_kondisi_approval'] == 2):
															$status_file_komentar = $rpta['status_kondisi_file_komentar'];
															?>
																<tr>
																	<td> Phase <?= $rpta['report_phase'] ?></td>
																	<td>
																		<?php
																		if ($rpta['file'] == '') {
																			echo "Waiting for Document";
																		} else {
																		?>
																			<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/<?= $rpta['file'] ?>"><i class="fa fa-download"></i> <?= $rpta['file'] ?></a>
																		<?php
																		}
																		?>
																	</td>
																	<td>
																		<?= $rpta['tanggal_upload'] != '' ? date('H:i d-m-Y', strtotime($rpta['tanggal_upload'])) : 'Waiting for Document' ?></td>
																	<td>
																		<?= $rpta['approval']; ?>
																	</td>
																	<td><?= $rpta['tanggal_approval_diminta'] != '' ? date('H:i d-m-Y', strtotime($rpta['tanggal_approval_diminta'])) : 'Waiting for Select Approval' ?></td>
																	<td>
																		<button type="button" class="btn btn-primary btn-sm" data-status_kondisi_file_komentar="<?=$rpta['status_kondisi_file_komentar']?>" data-id_p2pk="<?= $rpta['id_p2pk'] ?>" data-id="<?= $rpta['id'] ?>" data-report_phase="<?= $rpta['report_phase'] ?>" data-file_komen="<?= $rpta['file_komen'] ?>" data-komentar="<?= $rpta['komentar'] ?>" data-tanggal_komentar_submit="<?= $rpta['tanggal_komentar_submit'] != '' ? date('H:i d-m-Y', strtotime($rpta['tanggal_komentar_submit'])) : '' ?>" onclick="uploadKomentar(this)"><i class="fa fa-search"></i> Lihat Data Komentar</button>
																	</td>
																	<td>
																		<?php if($rpta['status_kondisi_file_komentar'] == 2):?>
																			Draft selesai di submit
																		<?php else:?>
																			<?= $rpta['status_str'] ?></td>
																		<?php endif;?>

																	<td>
																		<?php if($rpta['status_kondisi_file_komentar'] == 0):?>
																			<!-- <a href="#" class="btn btn-primary">-</a> -->
																		<?php elseif($rpta['status_kondisi_file_komentar'] == 1):?>
																			<button type="button" class="btn btn-primary btn-sm" data-id_p2pk="<?= $rpta['id_p2pk'] ?>" data-id="<?= $rpta['id'] ?>" data-report_phase="<?= $rpta['report_phase'] ?>" data-file_komen="<?= $rpta['file_komen'] ?>" data-komentar="<?= $rpta['komentar'] ?>" data-tanggal_komentar_submit="<?= $rpta['tanggal_komentar_submit'] != '' ? date('H:i d-m-Y', strtotime($rpta['tanggal_komentar_submit'])) : '' ?>" onclick="updateKomentar(this)"><i class="fa fa-save"></i> Submit komentar</button>
																		<?php elseif($rpta['status_kondisi_file_komentar'] == 2):?>
																		<?php endif;?>
																	</td>
																</tr>
															<?php
															endif;
														endforeach;
														?>
													<?php
													endif;
													?>

													<?php if($cekFinalReport > 0):?>
														<?php
														if ($dataFinalReport != null && $dataReportHead[0]['status'] > 4) :
														?>
															<?php if($status_file_komentar == 2):?>
																<?php
																if ($lvmember != 1 || $lvuser == "Super Admin" || $lvuser == "Partner L2"):
																?>

																	<tr>
																		<td>Final Report</td>
																		<td>
																			<button type="button" class="btn btn-primary btn-sm" data-id_p2pk="<?= $dataFinalReport['id_p2pk'] ?>" data-id="<?= $dataFinalReport['id'] ?>" data-report_phase="<?= $dataFinalReport['report_phase'] ?>" data-file="<?= $dataFinalReport['file'] ?>" onclick="uploadFinalReport(this)"><i class="fa fa-search"></i> Lihat Data Upload</button>
																		</td>
																		<td><?= $dataFinalReport['tanggal_upload'] != '' ? date('H:i d-m-Y', strtotime($dataFinalReport['tanggal_upload'])) : 'Waiting for Document' ?></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td><?= $dataFinalReport['status_str'] ?></td>
																		<td>
																			<?php if($dataFinalReport['status_kondisi_upload_file'] == 1):?>
																				<a type="button" class="btn btn-primary btn-sm" data-id_p2pk="<?= $dataFinalReport['id_p2pk'] ?>" data-id="<?= $dataFinalReport['id'] ?>" data-report_phase="<?= $dataFinalReport['report_phase'] ?>" data-file="<?= $dataFinalReport['file'] ?>" onclick="selesaikanSemua(this)"><i class="fa fa-save"></i> Selesai</a>
																			<?php endif;?>
																		</td>
																	</tr>
																<?php
																else :
																?>
																	<tr>
																		<td>Final Report</td>
																		<td>
																			<?php
																			if ($dataFinalReport['file'] == '') {
																				echo "Waiting for Document";
																			} else {
																			?>
																				<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/<?= $dataFinalReport['file'] ?>"><i class="fa fa-download"></i> <?= $dataFinalReport['file'] ?></a>
																			<?php
																			}
																			?>
																		</td>
																		<td><?= $dataFinalReport['tanggal_upload'] != '' ? date('H:i d-m-Y', strtotime($dataFinalReport['tanggal_upload'])) : 'Waiting for Document' ?></td>
																		<td></td>	
																		<td></td>
																		<td></td>
																		<td><?= $dataFinalReport['status_str'] ?></td>
																		<td></td>
																	</tr>
																<?php
																endif;
																?>
															<?php
															endif;
															?>

														<?php
														endif;
														?>
													<?php endif;?>
												</tbody>
											</table>
										</div>
									</div>
									
								</form>
							<?php
							endif;
							?>

						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.card-body -->
	</div>
</div>

<!-- Pilih Approval -->
<div class="modal fade" id="ApprovalModal" tabindex="-1" role="dialog" aria-labelledby="ApprovalModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form id="form-pilih-approval" method="post" action="" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="ApprovalModalLabel">Pilih Approval</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="id_p2pk" id="p_id_p2pk">
					<input type="hidden" name="id_p2pk_report" id="p_id_p2pk_report">
					<input type="hidden" name="kode" id="kode">
					<input type="hidden" name="report_phase_approval" id="report_phase_approval">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="id_approval">Approval</label>
								<select class="form-control" id="id_approval" name="id_approval" style="width: 100%;" required></select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div id="isi-submit-pilih-approval">
						<button type="submit" class="btn btn-primary">
							Simpan
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							Cancel
						</button>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<input type="hidden" name="rpf" id="rpf">

<!-- Upload Report -->
<div class="modal fade" id="UploadReportModal" tabindex="-1" role="dialog" aria-labelledby="UploadReportModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form id="form-upload-report" method="post" action="" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="UploadReportModalLabel">Upload Report</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="id_p2pk" id="r_id_p2pk">
					<input type="hidden" name="id_p2pk_report" id="r_id_p2pk_report">
					<input type="hidden" name="report_phase" id="r_report_phase">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>File Sebelumnya</label>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group" style="margin-top: -20px;">
								<div id="sfile"></div>
							</div>
						</div>
					</div>
					<div class="row <?= $isi['status'] == 2 ? ('d-none') : '' ?>">
						<div class="col-md-12">
							<div class="form-group">
								<label for="fileReport">File</label>
								<input class="form-control" type="file" name="fileReport" id="fileReport" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document" required>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div id="isi-submit-upload-file">
						<button type="submit" class="btn btn-primary <?= $isi['status'] == 2 ? ('d-none') : '' ?>">
							Simpan
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							Cancel
						</button>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Upload Final Report -->
<div class="modal fade" id="UploadFinalReportModal" tabindex="-1" role="dialog" aria-labelledby="UploadFinalReportModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form id="form-upload-final-report" method="post" action="" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="UploadFinalReportModalLabel">Upload Final Report</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="id_p2pk" id="r_id_p2pk_f">
					<input type="hidden" name="id_p2pk_report" id="r_id_p2pk_f_report">
					<input type="hidden" name="report_phase" id="r_report_f_phase">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>File Sebelumnya</label>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group" style="margin-top: -20px;">
								<div id="sffile"></div>
							</div>
						</div>
					</div>
					<div class="row <?= $isi['status'] == 2 ? ('d-none') : '' ?>">
						<div class="col-md-12">
							<div class="form-group">
								<label for="fileReport">File</label>
								<input class="form-control" type="file" name="fileReport" id="fileReportf" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document" required>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary <?= $isi['status'] == 2 ? ('d-none') : '' ?>" style="float: right;" data-id="<?= $id_selesaikan ?>" onclick="event.preventDefault();selesaiReport(this)"><i class="fa fa-check"></i> Simpan</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Cancel
					</button>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Upload Komentar -->
<div class="modal fade" id="UploadKomentarModal" tabindex="-1" role="dialog" aria-labelledby="UploadKomentarModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form id="form-upload-komentar" method="post" action="" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="UploadKomentarModalLabel">Upload Komentar</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="id_p2pk" id="k_id_p2pk">
					<input type="hidden" name="id_p2pk_report" id="k_id_p2pk_report">
					<input type="hidden" name="report_phase" id="k_report_phase">

					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>File Sebelumnya</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="sfilekomen"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Tanggal Komentar</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="stglkomen"></div>
							</div>
						</div>
					</div>
					<div class="row <?= $isi['status'] == 2 ? ('d-none') : '' ?>">
						<div class="col-md-12">
							<div class="form-group" id="isi-file-komentar">
								<label for="fileKomentar">File</label>
								<input class="form-control" type="file" name="fileKomentar" id="fileKomentar" accept="application/pdf,application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="komentar">Komentar</label>
								<textarea class="form-control" name="komentar" id="komentar" cols="4" rows="3" <?= $isi['status'] == 2 ? ('readonly') : '' ?> required></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div id="isi-submit-file-komentar">
						<button type="submit" class="btn btn-primary <?= $isi['status'] == 2 ? ('d-none') : '' ?>">
							Simpan
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							Cancel
						</button>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Lihat Komentar -->
<div class="modal fade" id="LihatKomentarModal" tabindex="-1" role="dialog" aria-labelledby="LihatKomentarModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<form id="form-lihat-komentar" method="post" action="" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="LihatKomentarModalLabel">Lihat Komentar</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="lkomen">
						<div class="row">
							<div class="col-md-2">
								<label for="">File Komentar</label>
							</div>
							<div class="col-md-10">
								<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/"><i class="fa fa-download"></i> Download File</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<label for="">Komentar</label>
							</div>
							<div class="col-md-10">
								Komentar
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Kembali
					</button>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Selesaikan Report -->
<div class="modal fade" id="SelesaiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title custom-font" id="SelesaiModalLabel"></h3>
			</div>
			<div class="modal-body" id="SelesaiModalContent">
			</div>
			<div class="modal-footer">
				<button id="SelesaiModalYa" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Ya</button>

				<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tidak</button>
			</div>
			<input type="hidden" id="idSelesai" name="">
		</div>
	</div>
</div>

<!-- Modal Download Template Timeline -->
<div class="modal fade" id="download-timeline" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File Timeline</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-timeline">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Download Template SDM -->
<div class="modal fade" id="download-sdm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File SDM</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-sdm">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Download Template Data Yang Diminta -->
<div class="modal fade" id="download-data-yang-diminta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File Data Yang Diminta</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-data-yang-diminta">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Download Template Kertas Kerja -->
<div class="modal fade" id="download-kertas-kerja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File Kertas Kerja</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-kertas-kerja">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Download Template Pengujian -->
<div class="modal fade" id="download-pengujian" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File Pengujian</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-pengujian">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Download Template Pengujian -->
<div class="modal fade" id="download-report" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="importExcel" method="post" enctype="multipart/form-data" action="<?= base_url() ?>repository/listRepository/import_excel" id="form-import">
                <div class="modal-header">
                    <h3 class="modal-title custom-font">Template File Report</h3>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                    	<thead>
	                    	<tr>
	                    		<th style="width: 7%;">No</th>
	                    		<th>File</th>
	                    	</tr>
                    	</thead>
                    	<tbody id="isi-template-report">
                    		<tr>
	                    		<td style="text-align: center; width: 7%;">1</td>
	                    		<td style=" width: 7%;"><a href="<?= base_url() ?>repository/listRepository/downloadSample">Download sample file</a></td>
	                    	</tr>	
                    	</tbody>
                    </table>
                    <br>
                    <p>*File ini hanya template sebagai acuan untuk di isi dengan data yang benar</p>
                </div>
                <div class="modal-footer">
					<button class="btn btn-danger btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Tutup</button>
				</div>
            </form>
        </div>
    </div>
</div>


<script>
	let global_st_proses = "<?= $isi['status_proses'] ?>";
	let global_id_p2pk = <?= $isi['id'] ?>;
</script>