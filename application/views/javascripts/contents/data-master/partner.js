moment.defineLocale('id',{});
$(function () {
    let judul_text = $("#isi-title").val()
    
    getCode()
    function getCode(){
        let tanggal = $("#tanggal_registrasi").val()
        let bulan = moment(tanggal, 'YYYY-MM-DD').format('MM')
        let tahun = moment(tanggal, 'YYYY-MM-DD').format('YYYY')
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>pengaturan/profile/getCodeKeluarga',
            data: {
              id: 0,
              bulan: bulan,
              tahun: tahun
            }
        }).done((data) => {
            $('#nik').val(data.id);
        })
    }
    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/partner/ajax_data/",
                "data": null,
                "type": 'POST'
            },
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            "columns": [
                { "data": null },
                {
                    "data": "nama", render(data, type, full, meta) {
                        return data
                    }, className: "nowrap"
                },
                { "data": "no_telepon" },
                { "data": "email" },
                { "data": "lokasi" },
                {
                    "data": "photo", render(data, type, full, meta) {
                        if(data == null || data == ''){
                            return `Belum ada photo`
                        }else{
                            return `<a style='cursor: pointer;' onclick='LihatPhoto(${full.id})'><i class='fa fa-eye'></i> Lihat</a>`                                                        
                        }
                    }, className: "nowrap"
                },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button class="btn btn-success btn-xs" onclick="Lihat(${data})">
                                        <i class="fa fa-eye"></i> Lihat
                                    </button>
                                    <button class="btn btn-primary btn-xs" onclick="Ubah(${data})">
										<i class="fa fa-edit"></i> Ubah
									</button>
									<button class="btn btn-danger btn-xs" onclick="Hapus(${data})">
										<i class="fa fa-trash"></i> Hapus
									</button>
								</div>`
                    }, className: "nowrap"
                }
            ],
            columnDefs: [{
                orderable: false,
                targets: [0, 5]
            }],
            order: [
                [1, 'asc']
            ]
        });
        tableUser.on('draw.dt', function () {
            var PageInfo = $(table_html).DataTable().page.info();
            tableUser.column(0, {
                page: 'current'
            }).nodes().each(function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });
    }
    dynamic();

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah Data "+judul_text);
        $("#show-image-ubah").hide()
        $('#id').val("");
        $('#nama').val("");
        $('#no_telepon').val("");
        $('#email').val("");
        $('#lokasi').val("");
        $('#status').val("1");
    });

    $("#tambah-member").click(() => {

        $("#id_posisi").val("")
        $("#nama_depan").val("")
        $("#nama_belakang").val("")
        $("#email_member").val("")
        $("#flag").val("")
        // $("#nik").val("")
        // $("#id_level").val("")
        // $("#tanggal_registrasi").val("")
        $("#tanggal_lahir").val("")
        $("#tanggal_meninggal").val("")
        // getID
        let id_profile = null
         $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/partner/getID',
            data: null
        }).done((data) => {
            $("#member-id").val(data)
        })

        // perhitungan umur saat ini
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

        let tanggal_lahir = $("#tanggal_lahir").val()

        let umur = hitungUmur(tanggal_lahir)
        if(umur >= 0){
            umur = umur+ " Tahun"
        }else{
            umur = ''
        }
        $("#umur").val(umur)

        // perhitungan umur terakhir sebelum meninggal
        let tanggal_meninggal = $("#tanggal_meninggal").val()
        let tanggal_registrasi = $("#tanggal_registrasi").val()
        let umur_terakhir = hitungUmurMeninggal(tanggal_lahir, tanggal_meninggal)
        if(umur_terakhir >= 0){
            umur_terakhir = umur_terakhir+" Tahun";
        }else{
            umur_terakhir = "";
        }
        $("#umur_terakhir").val(umur_terakhir)

         $("#tanggal_lahir").change(function () {
            let tanggal_lahir = $(this).val()
            let umur = hitungUmur(tanggal_lahir)
            $("#umur").val(umur+" Tahun")
        })

        $("#tanggal_meninggal").change(function () {
            let tanggal_meninggal = $(this).val()
            let tanggal_lahir = $("#tanggal_lahir").val()
            let umur_terakhir = hitungUmurMeninggal(tanggal_lahir,tanggal_meninggal)
            $("#umur_terakhir").val(umur_terakhir+" Tahun")
        })

        // tanggal lahir meninggal
        let tanggal = $("#tanggal_registrasi").val()
        let bulan = moment(tanggal, 'YYYY-MM-DD').format('MM')
        let tahun = moment(tanggal, 'YYYY-MM-DD').format('YYYY')
          $.ajax({
            method: 'post',
            url: '<?= base_url() ?>pengaturan/profile/getCodeKeluarga',
            data: {
              id: 0,
              bulan: bulan,
              tahun: tahun
            }
        }).done((data) => {
            $('#nik').val(data.id);
        })
        // tanggal registrasi
        $("#tanggal_registrasi").change(function () {
            let tanggal = $(this).val()
            let bulan = moment(tanggal, 'YYYY-MM-DD').format('MM')
            let tahun = moment(tanggal, 'YYYY-MM-DD').format('YYYY')
              $.ajax({
                method: 'post',
                url: '<?= base_url() ?>pengaturan/profile/getCodeKeluarga',
                data: {
                  id: 0,
                  bulan: bulan,
                  tahun: tahun
                }
            }).done((data) => {
                $('#nik').val(data.id);
            })
        })
        // tutup tanggal registrasi

        let id_keluarga = $('#lihat-id').val()
        $.ajax({
            method: 'get',
            url: '<?= base_url() ?>data-master/partner/getPartner',
            data: {
                id: id_keluarga
            }
        }).done((data) => {
            if (data.data) {
                data = data.data;
                $("#member-id-keluarga").val(id_keluarga)
                $("#member-keluarga").val(data.nama)
                $('#modal-tambah-member').modal('toggle')
            } else {
                Toast.fire({
                    icon: 'error',
                    title: 'Data tidak valid.'
                })
            }
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Gagal mendapatkan data.'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
        })
    });
    

    // Import
    $("#importExcel").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/partner/import_excel',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil diimport'
            })
            dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal diimport'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#import').modal('toggle')
        })
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/partner/' + ($("#id").val() == "" ? 'insert' : 'update'),
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#myModal').modal('toggle')
        })
    });

    // hapus
    $('#OkCheck').click(() => {
        let id = $("#idCheck").val()
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/partner/delete',
            data: {
                id: id
            }
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil dihapus'
            })
            dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal dihapus'
            })
        }).always(() => {
            $('#ModalCheck').modal('toggle')
            $.LoadingOverlay("hide");
        })
    })

    // tambah member baru
    $("#add-new-member").submit(function (ev) {

        ev.preventDefault();
        let id_partner = $("#member-id-keluarga").val()
        const form = new FormData(this);
        $.ajax({
          method: 'post',
          url: '<?= base_url() ?>pengaturan/profile/simpan',
          data: form,
          cache: false,
          contentType: false,
          processData: false,
        }).done((data) => {
          Toast.fire({
            icon: 'success',
            title: 'Data berhasil disimpan'
          })
          tblDetailKeluarga(id_partner)
        }).fail(($xhr) => {
          Toast.fire({
            icon: 'error',
            title: 'Data gagal disimpan'
          })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#modal-tambah-member').modal('toggle')
        })
    });

    function tblDetailKeluarga(id){
        $.ajax({
            method: 'get',
            url: '<?= base_url() ?>data-master/partner/getDetail',
            data: {
                id: id
            }
        }).done((data) => {
            if (data.data) {
                $("#table-detail-partner").html("")
                let detail = data.detail;
                data = data.data;
                $("#myModalLabelLihat").text("Detail "+judul_text);
                $('#lihat-id').val(data.id);
                $('#lihat-nama').val(data.nama);
                $('#lihat-lokasi').val(data.lokasi);
                $('#lihat-no_telepon').val(data.no_telepon);
                $('#lihat-email').val(data.email);
                $('#lihat-status').val(data.status);

                let jk = '';
                let nama_posisi = '';
                detail.forEach(e => {
                    if(e.jenis_kelamin == 1){
                        jk = 'Laki-laki'
                    }else{
                        jk = 'Perempuan'
                    }

                    if(e.nama_posisi == null){
                        nama_posisi = ""
                    }else{
                        nama_posisi = e.nama_posisi
                    }

                    $("#table-detail-partner").append('<tr>'+
                        '<td>'+
                            '<a class="btn btn-xs btn-success" href="<?= base_url() ?>pengaturan/profile/tambah/'+e.id_profil+'"><i class="fa fa-eye"></i> Detail</a>&nbsp;'+
                        '</td>'+
                        '<td>'+nama_posisi+'</td>'+
                        '<td>'+e.nik+'</td>'+
                        '<td>'+e.keterangan_keanggotaan+' ('+e.keanggotaan+')</td>'+
                        '<td>'+e.user_email+'</td>'+
                        '<td>'+e.nama_depan+' '+e.nama_belakang+'</td>'+
                        '<td>'+jk+'</td>'+
                    '</tr>'
                    )
                });
            } else {
                Toast.fire({
                    icon: 'error',
                    title: 'Data tidak valid.'
                })
            }
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Gagal mendapatkan data.'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
        })
    }


})
let judul_text = $("#isi-title").val()

// Click Hapus
const Hapus = (id) => {
    $("#idCheck").val(id)
    $("#LabelCheck").text('Form Hapus '+judul_text)
    $("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
    $('#ModalCheck').modal('toggle')
}

// Click Ubah
const Ubah = (id) => {
    $.LoadingOverlay("show");
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>data-master/partner/getPartner',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            $("#myModalLabel").text("Ubah Data "+judul_text);
            if(data.photo == null || data.photo == ""){
                $("#show-image-ubah").hide()
            }else{
                $("#show-image-ubah").show()
                $('#ubah-photo').attr('src', '<?= base_url() ?>files/partner/'+data.photo);
            }
            $('#id').val(data.id);
            $('#nama').val(data.nama);
            $('#lokasi').val(data.lokasi);
            $('#no_telepon').val(data.no_telepon);
            $('#email').val(data.email);
            $('#status').val(data.status);
            $('#myModal').modal('toggle')
        } else {
            Toast.fire({
                icon: 'error',
                title: 'Data tidak valid.'
            })
        }
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Gagal mendapatkan data.'
        })
    }).always(() => {
        $.LoadingOverlay("hide");
    })
}

// Click Lihat
const LihatPhoto = (id) => {
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>data-master/partner/getPartner',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            $("#myModalLabelPhoto").text("Photo: "+data.nama);
            $('#detail-photo').attr('src', '<?= base_url() ?>files/partner/'+data.photo);
            $('#myModalPhoto').modal('toggle')
        } else {
            Toast.fire({
                icon: 'error',
                title: 'Data tidak valid.'
            })
        }
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Gagal mendapatkan data.'
        })
    }).always(() => {
        $.LoadingOverlay("hide");
    })
}

// Click Lihat
const Lihat = (id) => {
    $.LoadingOverlay("show");
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>data-master/partner/getDetail',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            $("#table-detail-partner").html("")
            let detail = data.detail;
            data = data.data;
            $("#myModalLabelLihat").text("Detail "+judul_text);
            $('#lihat-id').val(data.id);
            $('#lihat-nama').val(data.nama);
            $('#lihat-lokasi').val(data.lokasi);
            $('#lihat-no_telepon').val(data.no_telepon);
            $('#lihat-email').val(data.email);
            $('#lihat-status').val(data.status);

            let jk = '';
            let nama_posisi = '';
            detail.forEach(e => {
                if(e.jenis_kelamin == 1){
                    jk = 'Laki-laki'
                }else{
                    jk = 'Perempuan'
                }

                if(e.nama_posisi == null){
                    nama_posisi = ""
                }else{
                    nama_posisi = e.nama_posisi
                }


                $("#table-detail-partner").append('<tr>'+
                    '<td>'+
                        '<a class="btn btn-xs btn-success" href="<?= base_url() ?>pengaturan/profile/tambah/'+e.id_profil+'"><i class="fa fa-eye"></i> Detail</a>&nbsp;'+
                    '</td>'+
                    '<td>'+nama_posisi+'</td>'+
                    '<td>'+e.nik+'</td>'+
                    '<td>'+e.keterangan_keanggotaan+' ('+e.keanggotaan+')</td>'+
                    '<td>'+e.user_email+'</td>'+
                    '<td>'+e.nama_depan+' '+e.nama_belakang+'</td>'+
                    '<td>'+jk+'</td>'+
                '</tr>'
                )
            });
            $('#myModalLihat').modal('toggle')
        } else {
            Toast.fire({
                icon: 'error',
                title: 'Data tidak valid.'
            })
        }
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Gagal mendapatkan data.'
        })
    }).always(() => {
        $.LoadingOverlay("hide");
    })
}

function handleToltipFromDatatable({ element = '', title = '' }) {
    const el = $(element);
    el.tooltip({ title: title == null ? '' : title });
    el.mouseenter(function () {
        $(this).tooltip('show');
    });
    el.mouseout(function () {
        $(this).tooltip('hide');
    });
}