<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login | Audit System End to End</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= base_url('assets/template/') ?>plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?= base_url('assets/') ?>plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= base_url('assets/template/') ?>dist/css/adminlte.min.css">
  <link rel="apple-touch-icon" sizes="57x57" href="<?= base_url() ?>assets/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="<?= base_url() ?>assets/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="<?= base_url() ?>assets/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="<?= base_url() ?>assets/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="<?= base_url() ?>assets/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="<?= base_url() ?>assets/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="<?= base_url() ?>assets/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="<?= base_url() ?>assets/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="<?= base_url() ?>assets/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192" href="<?= base_url() ?>assets/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="<?= base_url() ?>assets/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="<?= base_url() ?>assets/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="<?= base_url() ?>assets/favicon/favicon-16x16.png">
  <link rel="manifest" href="<?= base_url() ?>assets/favicon/manifest.json">
  <meta name="msapplication-TileColor" content="#fff">
  <meta name="theme-color" content="#343a40">
  <meta name="msapplication-TileImage" content="<?= base_url() ?>assets/favicon/ms-icon-144x144.png">
</head>

<body class="hold-transition login-page">
  <div id="loader"></div>
  <div class="login-box" style="width: 50%;">
    <!-- /.login-logo -->
    <div class="card card-outline card-primary">
      <div class="card-header text-center">
        <!-- <img src="<?= base_url() ?>assets/images/logo2.png" alt="Kopigadjah" class="brand-image img-circle elevation-3" style="opacity: .8; width: 110px; height: 80px;"> -->
        <img src="<?= base_url() ?>assets/images/logo2.png" alt="Kopigadjah" class="rounded mx-auto d-block" style="max-width: 100px;">
        <span class="h5"><b>Audit System End to End</b></span>
      </div>

      <div class="card-body pt-0">
        <div class="text-center my-2">
          <span class="text-capitalize mt-0 font-weight-bold">Sample Api</span>
        </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Nama</th>
              <th>Keterangan</th>
              <th>Tanggal</th>
              <th>Tempat</th>
              <th>Created Date</th>
            </tr>
          </thead>
          <tbody id="isi-data"></tbody>
        </table>
        <!-- /.social-auth-links -->
      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
  </div>
  <small class="form-text text-muted">&copy; 2021 Developed by <b>AuditAny</b></small>
  <!-- /.login-box -->

  <!-- jQuery -->
  <script src="<?= base_url('assets/template/') ?>plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="<?= base_url('assets/template/') ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="<?= base_url('assets/template/') ?>dist/js/adminlte.min.js"></script>
  <!-- loader -->
  <script src="<?= base_url('assets/template/') ?>plugins/loader/loadingoverlay.min.js"></script>
  <!-- AdminLTE Validator -->
  <script>
    const base_url = '<?= base_url() ?>';
  </script>
  <script src="<?= base_url('assets/plugins/') ?>jquery-validation/jquery.validate.min.js"></script>
  <script src="<?= base_url('assets/plugins/') ?>jquery-validation/additional-methods.min.js"></script>
  <?php if (file_exists(VIEWPATH . "javascripts/contents/{$content}.js")) : ?>
    <script src="<?= $this->plugin->build_url("javascripts/contents/{$content}.js") ?>" type="text/javascript"></script>
  <?php endif; ?>
</body>

</html>