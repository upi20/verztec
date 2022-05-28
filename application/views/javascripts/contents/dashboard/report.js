let global_dinamic = null;
$(function () {
  let text_partner = $("#isi-partner").val()
  let text_keanggotaan = $("#isi-kategori-keanggotaan").val()
  var url_string = location.href;
  var url = new URL(url_string);
  var filter_jk = url.searchParams.get("jk");
  var filter_level = url.searchParams.get("level");
  var filter_ulang_tahun = url.searchParams.get("ulang-tahun");
  if(filter_ulang_tahun == null){
    filter_ulang_tahun = $("#isi-ulang-tahun").val()
  }
  function dynamic_v2(datas = {
    partner: null,
    posisi: null,
    kategorial: null,
    wilayah: null,
    keanggotaan: null,
    usia: null,
    jenis_kelamin: null,
    level: null,
    ulang_tahun: null
  }) {
    let filter = null;
    // if (datas.partner != null) {
        filter = {
            partner: datas.partner,
            posisi: datas.posisi,
            kategorial: datas.kategorial,
            wilayah: datas.wilayah,
            keanggotaan: datas.keanggotaan,
            usia: datas.usia,
            jenis_kelamin: datas.jenis_kelamin,
            level: datas.level,
            ulang_tahun: datas.ulang_tahun,
        }
    // }
    const table_html = $('#dt_basic_v2');
    table_html.dataTable().fnDestroy()
    table_html.DataTable({
      "ajax": {
        "url": "<?= base_url()?>pengaturan/profile/ajax_data/",
        "data": datas,
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
            "data": "tanggal_daftar", render(data, type, full, meta) {
                // return data == null || data == '' ? full.created_at : full.updated_at;
                return moment(data == null || data == '' ? full.tanggal_daftar : full.tanggal_daftar, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

            }, className: "nowrap"
        },
        { "data": "nama_partner" },
        { "data": "nama_posisi" },
        { "data": "keanggotaan" },
        { "data": "nik" },
        {
          "data": "email", render(data, type, full, meta) {
            return (full.user_email_status == 0 ?  (`<i class="far fa-times-circle text-danger"></i> `) : (`<i class="far fa-check-circle text-success"></i> `)) + full.email
          }, className: "nowrap"
        },
        { "data": "nama_belakang" },
        { "data": "nama_depan" },
        { "data": "jk" },
        {
          "data": "flag", render(data, type, full, meta) {
            if(data == 1){
              return 'Aktif'              
            }else{
              return 'Pasif'
            }
          }, className: "nowrap"
        },
        {
            "data": "tanggal_registrasi", render(data, type, full, meta) {
              return moment(data == null || data == '' ? full.tanggal_registrasi : full.tanggal_registrasi, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');
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
        {
            "data": "tanggal_meninggal", render(data, type, full, meta) {
              let umur = hitungUmurMeninggal(full.tanggal_lahir,full.tanggal_meninggal)
              let tanggal = ''
              if(full.tanggal_meninggal == "" || full.tanggal_meninggal == null || full.tanggal_meninggal == '0000-00-00'){
                tanggal = ''
                umur = ""
              }else{
                tanggal = moment(full.tanggal_meninggal, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY')
                umur = " ("+umur+" Tahun)"
              }
              return tanggal+umur;
            }, className: "nowrap"
        },
      ],
      columnDefs: [{
        orderable: true,
        targets: [0, 5]
      }],
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
  
  // dynamic_v2();
  dynamic_v2({
    partner: null,
    posisi: null,
    kategorial: null,
    wilayah: null,
    keanggotaan: null,
    usia: null,
    jenis_kelamin: filter_jk,
    level: filter_level,
    ulang_tahun: filter_ulang_tahun
  });
  global_dinamic = dynamic_v2;

})

