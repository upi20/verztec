$(function () {
    $('#id_profile').select2();
    $('#filter-trainer').select2();
    $('#trainer').select2();
    $('#filter_date').daterangepicker();
    function dynamic(datas = {
        start: null,
        end: null,
        trainer: null,
    }) {
        let filter = null;
        if (datas.start != null && 
            datas.end != null && 
            datas.trainer != null) {
            filter = {
                date_start: datas.start,
                date_end: datas.end,
                trainer: datas.trainer,
            }
        }

        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>spm/ListSPM/ajax_data/",
                "data": filter,
                "type": 'POST'
            },
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            "columns": [
                { "data": null },
                { "data": "judul" },
                { "data": "trainer" },
                {
                    "data": "id", render(data, type, full, meta) {
                        return full.bahan != null ? (`${full.bahan} <a class="btn btn-success btn-sm" href="<?= base_url() ?>files/spm/${full.bahan}"><i class="fas fa-paperclip"></i></a>`) : ('');
                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return full.absensi != null ? (`${full.absensi} <a class="btn btn-success btn-sm" href="<?= base_url() ?>files/spm/${full.absensi}"><i class="fas fa-paperclip"></i></a>`) : ('');
                    }, className: "nowrap"
                },
                // { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        // return data == null || data == '' ? full.created_at : full.updated_at;
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button
                                    class="btn btn-primary btn-xs"
                                    data-id="${data}"
                                    data-judul="${full.judul}"
                                    data-id_trainer="${full.id_trainer}"
                                    data-trainer="${full.trainer}"
                                    data-bahan="${full.bahan}"
                                    data-absensi="${full.absensi}"
                                    data-status="${full.status}"
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

    ajax_select(null, '#filter-trainer', '<?= base_url(); ?>/spm/listSPM/ajax_select_list_trainer', null, null, 'Trainer');

    $("#btn-filter").click(() => {
        $('#stfilter').val(1);
        const date = $('#filter_date').data('daterangepicker');
        const trainer = $('#filter-trainer').val();

        var a = document.getElementById('btn_export');
        var b = document.getElementById('btn_export_pdf');
        var link = `<?= base_url() ?>spm/listSPM/export_excel`;
        var link_pdf = `<?= base_url() ?>spm/listSPM/export_pdf`;
        a.href = link + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-trainer=${trainer}`;
        b.href = link_pdf + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-trainer=${trainer}`;

        dynamic({
            start: date.startDate.format('YYYY-MM-DD'),
            end: date.endDate.format('YYYY-MM-DD'),
            trainer: trainer,
        });
    });

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah SPM");
        $('#id').val("");
        $('#judul').val("");
        ajax_select(null, '#trainer', '<?= base_url(); ?>/spm/listSPM/ajax_select_list_trainer', null, null, 'Trainer');
        $('#bahan').val("");
        $('#absensi').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>spm/listSPM/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>spm/listSPM/import_excel',
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
            url: '<?= base_url() ?>spm/listSPM/delete',
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
    $.LoadingOverlay("show");
    $("#myModalLabel").text("Ubah SPM");
    $('#id').val(data.id);
    $('#judul').val(data.judul);
    ajax_select(null, '#trainer', '<?= base_url(); ?>/spm/listSPM/ajax_select_list_trainer', null, null, 'Trainer', data.id_trainer);
    $('#bahan').val("");
    $('#absensi').val("");
    $('#status').val(data.status);
    $('#myModal').modal('toggle')
    $.LoadingOverlay("hide");
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