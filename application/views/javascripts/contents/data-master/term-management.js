moment.defineLocale('id',{});
$(function () {
    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/termManagement/ajax_data/",
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
                { "data": "parent" },
                { "data": "menu_nama" },
                { "data": "nama" },
                { "data": "keterangan" },
                { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        // return data == null || data == '' ? full.created_at : full.updated_at;
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY H:mm:ss');

                    }
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button
                                    class="btn btn-primary btn-xs"
                                    data-id="${data}"
                                    data-id_menu="${full.id_menu}"
                                    data-parent="${full.parent_id}"
                                    data-menu="${full.id_menu}"
                                    data-submenu="${full.menu_id}"
                                    data-keterangan="${escape(full.keterangan)}"
                                    data-status="${full.status}"
                                    data-nama="${full.nama}"
                                    onclick="Ubah(this)">
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
                targets: [0, 7]
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
        $("#myModalLabel").text("Tambah Term Management");
        $('#id').val("");
        $('#menu').val("");
        $('#sub_menu').val("");
        $('#nama').val("");
        $('#keterangan').val("");
        $('#status').val("1");
    });

    $('#menu').on('change', () => {
        let menu = $('#menu').val()

        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/termManagement/subMenu',
            data:
            {
                menu: menu
            }
        })
        .done((data) => {
            $('#sub_menu').html('<option value="">--Pilih Sub Menu--</option>')

            $.each(data, (value, key) => {
                $('#sub_menu').append("<option value='" + key.menu_id + "'>" + key.menu_nama + "</option>")
            })
        })
    })

    // Import
    $("#importExcel").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/termManagement/import_excel',
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
            url: '<?= base_url() ?>data-master/termManagement/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>data-master/termManagement/delete',
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

// Click Hapus
const Hapus = (id) => {
    $("#idCheck").val(id)
    $("#LabelCheck").text('Form Hapus')
    $("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
    $('#ModalCheck').modal('toggle')
}

// Click Ubah
const Ubah = (datas) => {
    data = datas.dataset;
    submenu = data.menu;
    dparent = data.parent;
    $("#myModalLabel").text("Ubah Term Management");
    $('#id').val(data.id);
    $('#menu').val(data.parent != "null" ? data.parent : data.submenu)
    $('#sub_menu').val(data.menu)
    $('#nama').val(data.nama);
    $('#status').val(data.status);
    $('#keterangan').val(decodeURIComponent(data.keterangan));
    $('#myModal').modal('toggle')  
    $.ajax({
        method: 'post',
        url: '<?= base_url() ?>data-master/termManagement/subMenu',
        data:
        {
            menu: data.parent != "null" ? data.parent : data.submenu
        }
    })
    .done((data) => {
        $('#sub_menu').html('<option value="">--Pilih Sub Menu--</option>')

        $.each(data, (value, key) => {
            isselect = dparent != "null" ? key.menu_id == submenu ? 'selected' : "" : "";
            $('#sub_menu').append(`<option value="${key.menu_id}" ${isselect} >` + key.menu_nama + "</option>")
        })
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