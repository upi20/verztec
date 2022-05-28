let global_dinamic = null;
$(function () {
  $('#filter_date').daterangepicker();
  var url_string = location.href;
  var url = new URL(url_string);
  var filter = url.searchParams.get("filter");
  if(filter == null){
    $("#jenis-keanggotaan").val()
  }else{
    $("#jenis-keanggotaan").val(filter).trigger('change')
  }
  let jenis = $("#jenis-keanggotaan").val()

  dynamic()

  $("#btn-filter").click(() => {
    dynamic()
  })

  function dynamic(){
    let tanggal = $("#filter_date").val()
    let jenis = $("#jenis-keanggotaan").val()
    let status = ""
    if(jenis == 99999){
      status = 1
    }
    // cek(jenis)
    let table_html = $('#table_anggota');
    table_html.dataTable().fnDestroy()
    table_html.DataTable({
      "ajax": {
        "url": "<?= base_url()?>dashboard/getReportKeanggotaan/",
        "data": {jenis: jenis, tanggal: tanggal, status: status},
        "type": 'POST'
      },
      "processing": true,
      "serverSide": true,
      "responsive": false,
      "lengthChange": true,
      "autoWidth": false,
      "scrollX": true,
      "columns": [
        {
          "data": "id_profile", render(data, type, full, meta) {
            return `<div class="pull-right">
                <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
                  <i class="fa fa-edit"></i> View
                </a>
              </div>`
          }, className: "nowrap"
        },
        { "data": "keanggotaan" },
        {
            "data": "tanggal_daftar", render(data, type, full, meta) {
                // return data == null || data == '' ? full.created_at : full.updated_at;
                return moment(data == null || data == '' ? full.tanggal_daftar : full.tanggal_daftar, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

            }, className: "nowrap"
        },
        // { "data": "nama_partner" },
        // { "data": "nama_posisi" },
        // { "data": "keanggotaan" },
        { "data": "nik" },
        {
            "data": "nama_belakang", render(data, type, full, meta) {
              return data + " " + full.nama_depan;
            }, className: "nowrap"
        },
        {
            "data": "tanggal_lahir", render(data, type, full, meta) {
              let umur = hitungUmur(full.tanggal_lahir)
              if(full.tanggal_lahir == "" || full.tanggal_lahir == null){
                umur = ""
              }else{
                umur = " ("+umur+" Tahun)"
              }
              return moment(data == null || data == '' ? full.tanggal_lahir : full.tanggal_lahir, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY')+umur;
            }, className: "nowrap"
        },
      ]
    });
  }


  function hitungUmur(tanggal_lahir=null){
    var today = new Date();
    var birthday = new Date(tanggal_lahir);
    var year = 0;
    if (today.getMonth() < birthday.getMonth()) {
      year = 1;
    } else if ((today.getMonth() == birthday.getMonth()) && today.getDate() < birthday.getDate()) {
      year = 1;
    }
    var age = today.getFullYear() - birthday.getFullYear() - year;
 
    if(age < 0){
      age = 0;
    }
    return age;
  }

  function hitungUmurMeninggal(tanggal_lahir=null, tanggal_meninggal = null){
    var tanggal_meninggal = new Date(tanggal_meninggal);
    var birthday = new Date(tanggal_lahir);
    var year = 0;
    if (tanggal_meninggal.getMonth() < birthday.getMonth()) {
      year = 1;
    } else if ((tanggal_meninggal.getMonth() == birthday.getMonth()) && tanggal_meninggal.getDate() < birthday.getDate()) {
      year = 1;
    }
    var age = tanggal_meninggal.getFullYear() - birthday.getFullYear() - year;
 
    if(age < 0){
      age = 0;
    }
    return age;
  }
  

})

