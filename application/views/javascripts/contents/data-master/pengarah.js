moment.defineLocale('id',{});
$(function () {
    let isi_judul = $("#isi-judul").val()
    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/pengarah/ajax_data/",
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
                { "data": "nama" },
                { "data": "keterangan" },
                { "data": "no_urut" },
                { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        // return data == null || data == '' ? full.created_at : full.updated_at;
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

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
                orderable: true,
                // targets: [0, 4]
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
        $("#myModalLabel").text("Tambah List "+isi_judul);
        $('#id').val("");
        $('#nama').val("");
        $('#keterangan').val("");
        $('#no_urut').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/pengarah/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>data-master/pengarah/import_excel',
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
            url: '<?= base_url() ?>data-master/pengarah/delete',
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
let isi_judul = $("#isi-judul").val()

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
        url: '<?= base_url() ?>data-master/pengarah/getPengarah',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            $("#myModalLabel").text("Ubah Data "+isi_judul);
            $('#id').val(data.id);
            $('#nama').val(data.nama);
            $('#keterangan').val(data.keterangan);
            $('#no_urut').val(data.no_urut);
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