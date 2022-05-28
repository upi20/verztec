moment.defineLocale('id',{});
$(function () {
    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/laporanHeader/ajax_data/",
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
                { "data": "judul", className: "nowrap" },
                {
                  "data": "logo_1", render(data, type, full, meta) {
                    let logo = ''
                    if(data == null || data == "null"){
                      logo = 'tidak ada logo'
                    }else{
                      logo = data
                    }
                    return `<a
                    class="btn btn-logo"
                    data-toggle="modal"
                    data-data="${data}"
                    data-target="#logo"
                    onclick="view_logo(this)"
                    id="btn-logo">${logo}</a>`
                  }, className: "nowrap"
                },
                {
                  "data": "logo_2", render(data, type, full, meta) {
                    let logo = ''
                    if(data == null || data == "null"){
                      logo = 'tidak ada logo'
                    }else{
                      logo = data
                    }
                    return `<a
                    class="btn btn-logo"
                    data-toggle="modal"
                    data-data="${data}"
                    data-target="#logo"
                    onclick="view_logo(this)"
                    id="btn-logo">${logo}</a>`
                  }, className: "nowrap"
                },
                { "data": "keterangan_1" },
                { "data": "keterangan_2" },
                { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        // return data == null || data == '' ? full.created_at : full.updated_at;
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD').format('DD-MM-YYYY H:i:s');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
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
                orderable: true
                // targets: [0, 8]
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
        $("#myModalLabel").text("Tambah Laporan Header");
        $('#id').val("");
        $('#judul').val("");
        $('#keterangan_1').val("");
        $('#keterangan_2').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/laporanHeader/' + ($("#id").val() == "" ? 'insert' : 'update'),
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

    // Import
    $("#importExcel").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/laporanHeader/import_excel',
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

    // hapus
    $('#OkCheck').click(() => {
        let id = $("#idCheck").val()
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/laporanHeader/delete',
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

})

const view_logo = (datas) => {
  $("#img-view").attr('src', `<?= base_url() ?>files/laporan-header/${datas.dataset.data}`)
}

// Click Hapus
const Hapus = (id) => {
    $("#idCheck").val(id)
    $("#LabelCheck").text('Form Hapus')
    $("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
    $('#ModalCheck').modal('toggle')
}

// Click Ubah
const Ubah = (id) => {
    $.LoadingOverlay("show");
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>data-master/laporanHeader/getLaporanHeader',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            $("#myModalLabel").text("Ubah Laporan Header");
            $('#id').val(data.id);
            $('#judul').val(data.judul);
            
            if(data.logo_1 != "" || data.logo_1 != null){
                $("#img-view-logo-1").attr('src', `<?= base_url() ?>files/laporan-header/${data.logo_1}`)
            }else{
                $("#img-view-logo-1").css("display", "none")
            }

            if(data.logo_2 != "" || data.logo_2 != null){
                $("#img-view-logo-2").attr('src', `<?= base_url() ?>files/laporan-header/${data.logo_2}`)
            }else{
                $("#img-view-logo-2").css("display", "none")
            }

            $('#keterangan_1').val(data.keterangan_1)
            $('#keterangan_2').val(data.keterangan_2)
            $('#status').val(data.status == 1 ? data.status : (data.status == 2 ? data.status : ''))
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