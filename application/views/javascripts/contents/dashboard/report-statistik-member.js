let global_dinamic = null;
$(function () {
  $('#filter_date').daterangepicker();

  let text_partner = $("#isi-partner").val()
  let text_keanggotaan = $("#isi-kategori-keanggotaan").val()
  var url_string = location.href;
  var url = new URL(url_string);
  var filter = url.searchParams.get("filter");
  if(filter == null){
    $("#jenis-informasi").val()
  }else{
    $("#jenis-informasi").val(filter).trigger('change')
    if(filter == "Ulang Tahun"){
      $("#bulan").val($("#bulan_ini").val())
    }
  }

  let jenis = $("#jenis-informasi").val()


  $("#jenis-informasi").change(function () {
    cek($(this).val())
  })

  function cek(jenis=null){
    if(jenis == "Jumlah Keluarga"){
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_keluarga").show()
      $("#table_anggota").hide()
      $("#filter-kosong").hide()
      $("#filter-ulang-tahun").hide()
      $("#filter-kelahiran-meninggal").hide()
      $("#filter-all").show()
    }else if(jenis == "Jumlah Anggota"){
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_anggota").show()
      $("#table_keluarga").hide()
      $("#filter-kosong").hide()
      $("#filter-ulang-tahun").hide()
      $("#filter-kelahiran-meninggal").hide()
      $("#filter-all").show()
    }else if(jenis == "Ulang Tahun"){
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_anggota").show()
      $("#table_keluarga").hide()
      $("#filter-kosong").hide()
      $("#filter-kelahiran-meninggal").hide()
      $("#filter-all").hide()
      $("#filter-ulang-tahun").show()
      let bulan_ini = $("#bulan_ini").val()
      if($("#bulan").val() == ""){
        $("#bulan").val(bulan_ini).trigger('change')
      }
    }else if(jenis == "Kelahiran"){
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_anggota").show()
      $("#table_keluarga").hide()
      $("#filter-kosong").hide()
      $("#filter-ulang-tahun").hide()
      $("#filter-all").hide()
      $("#filter-kelahiran-meninggal").show()
    }else if(jenis == "Meninggal"){
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_anggota").show()
      $("#table_keluarga").hide()
      $("#filter-kosong").hide()
      $("#filter-ulang-tahun").hide()
      $("#filter-all").hide()
      $("#filter-kelahiran-meninggal").show()
    }else{
      $('#table_keluarga').dataTable().fnDestroy()
      $('#table_anggota').dataTable().fnDestroy()
      $("#table_anggota").hide()
      $("#table_keluarga").hide()
      $("#filter-kosong").show()
      $("#filter-ulang-tahun").hide()
      $("#filter-kelahiran-meninggal").hide()
      $("#filter-all").show()
    }
  }

  dynamic()


  $("#btn-filter").click(() => {
    dynamic()
  })

  function dynamic(){
    let tanggal = $("#filter_date").val()
    let bulan = $("#bulan").val()
    let usia = $("#filter-usia").val()
    let jenis = $("#jenis-informasi").val()
    cek(jenis)
    if(jenis == "Jumlah Keluarga"){
      let table_html = $('#table_keluarga');
      table_html.dataTable().fnDestroy()
      table_html.DataTable({
        "ajax": {
          "url": "<?= base_url()?>dashboard/getReportKeluarga/",
          "data": {tanggal: tanggal},
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
            "data": "id", render(data, type, full, meta) {
              return `<div class="pull-right">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>data-master/partner">
                    <i class="fa fa-edit"></i> View
                  </a>
                </div>`
            }, className: "nowrap"
          },
          {
              "data": "created_at", render(data, type, full, meta) {
                  return moment(data == null || data == '' ? full.created_at : full.created_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');
              }, className: "nowrap"
          },
          { "data": "nama" },
        ],
      });
    }else if(jenis == "Jumlah Anggota"){
      let table_html = $('#table_anggota');
      table_html.dataTable().fnDestroy()
      table_html.DataTable({
        "ajax": {
          "url": "<?= base_url()?>dashboard/getReportAnggota/",
          "data": {tanggal: tanggal},
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
            "data": "id", render(data, type, full, meta) {
              return `<div class="pull-right">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
                    <i class="fa fa-edit"></i> View
                  </a>
                </div>`
            }, className: "nowrap"
          },
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
    }else if(jenis == "Ulang Tahun"){
      let table_html = $('#table_anggota');
      table_html.dataTable().fnDestroy()
      table_html.DataTable({
        "ajax": {
          "url": "<?= base_url()?>dashboard/getReportUlangTahun/",
          "data": {bulan: bulan},
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
            "data": "id", render(data, type, full, meta) {
              return `<div class="pull-right">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
                    <i class="fa fa-edit"></i> View
                  </a>
                </div>`
            }, className: "nowrap"
          },
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
    }else if(jenis == "Kelahiran"){
      let table_html = $('#table_anggota');
      table_html.dataTable().fnDestroy()
      table_html.DataTable({
        "ajax": {
          "url": "<?= base_url()?>dashboard/getReportKelahiran/",
          "data": {usia: usia},
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
            "data": "id", render(data, type, full, meta) {
              return `<div class="pull-right">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
                    <i class="fa fa-edit"></i> View
                  </a>
                </div>`
            }, className: "nowrap"
          },
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
    }else if(jenis == "Meninggal"){
      let table_html = $('#table_anggota');
      table_html.dataTable().fnDestroy()
      table_html.DataTable({
        "ajax": {
          "url": "<?= base_url()?>dashboard/getReportKematian/",
          "data": {usia: usia},
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
            "data": "id", render(data, type, full, meta) {
              return `<div class="pull-right">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
                    <i class="fa fa-edit"></i> View
                  </a>
                </div>`
            }, className: "nowrap"
          },
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
  }

  // function dynamic_v2(datas = {
  //   partner: null,
  //   posisi: null,
  //   kategorial: null,
  //   wilayah: null,
  //   keanggotaan: null,
  //   usia: null,
  //   jenis_kelamin: null,
  //   level: null,
  //   ulang_tahun: null
  // }) {
  //   let table_html = $('#dt_basic_v2');
  //   table_html.dataTable().fnDestroy()
  //   table_html.DataTable({
  //     "ajax": {
  //       "url": "<?= base_url()?>dashboard/getReportKeluarga/",
  //       "data": datas,
  //       "type": 'POST'
  //     },
  //     "processing": true,
  //     "serverSide": true,
  //     "responsive": false,
  //     "lengthChange": true,
  //     "autoWidth": false,
  //     "scrollX": true,
  //     "columns": [
  //       {
  //         "data": "id", render(data, type, full, meta) {
  //           return `<div class="pull-right">
  //               <a class="btn btn-primary btn-xs" href="<?= base_url() ?>pengaturan/profile/tambah/${data}">
  //                 <i class="fa fa-edit"></i> View
  //               </a>
  //             </div>`
  //         }, className: "nowrap"
  //       },
  //       {
  //           "data": "tanggal_daftar", render(data, type, full, meta) {
  //               // return data == null || data == '' ? full.created_at : full.updated_at;
  //               return moment(data == null || data == '' ? full.tanggal_daftar : full.tanggal_daftar, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

  //           }, className: "nowrap"
  //       },
  //       { "data": "nama_partner" },
  //       { "data": "nama_posisi" },
  //       { "data": "keanggotaan" },
  //       { "data": "nik" },
  //       {
  //           "data": "nama_belakang", render(data, type, full, meta) {
  //             return data + " " + full.nama_depan;
  //           }, className: "nowrap"
  //       },
  //       {
  //           "data": "tanggal_lahir", render(data, type, full, meta) {
  //             let umur = hitungUmur(full.tanggal_lahir)
  //             if(full.tanggal_lahir == "" || full.tanggal_lahir == null){
  //               umur = ""
  //             }else{
  //               umur = " ("+umur+" Tahun)"
  //             }
  //             return moment(data == null || data == '' ? full.tanggal_lahir : full.tanggal_lahir, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY')+umur;
  //           }, className: "nowrap"
  //       },
  //     ],
  //     columnDefs: [{
  //       orderable: true,
  //       targets: [0, 5]
  //     }],
  //   });
  // }

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

