$(function () {
    $('#id_profile').select2();
    // $('#filter-judul').select2();
    $('#filter_date').daterangepicker();
    function dynamic(datas = {
        start: null,
        end: null,
        judul: null,
    }) {
        let filter = null;
        if (datas.start != null && 
            datas.end != null && 
            datas.judul != null) {
            filter = {
                date_start: datas.start,
                date_end: datas.end,
                judul: datas.judul,
            }
        }

        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>repository/listRepository/ajax_data/",
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
                { "data": "kategori" },
                { "data": "judul" },
                { "data": "keterangan" },
                {
                    "data": "id", render(data, type, full, meta) {
                        if(full.kategori == 'Manual'){
                            return full.attachment != null ? (`${full.attachment} <a class="btn btn-success btn-sm" href="<?= base_url() ?>files/repository/${full.attachment}"><i class="fas fa-paperclip"></i></a>`) : ('');
                        }else{
                            return full.attachment != null ? (`${full.attachment} <a class="btn btn-success btn-sm" href="<?= base_url() ?>${full.attachment}"><i class="fas fa-paperclip"></i></a>`) : ('');                            
                        }
                    }, className: "nowrap"
                },
                // { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        // return data == null || data == '' ? full.created_at : full.updated_at;
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY H:mm:ss');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button
                                    class="btn btn-primary btn-xs"
                                    data-id="${data}"
                                    data-judul="${full.judul}"
                                    data-keterangan="${full.keterangan}"
                                    data-attachment="${full.attachment}"
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

    ajax_select(null, '#filter-judul', '<?= base_url(); ?>/repository/listRepository/ajax_select_list_judul', null, null, 'Nama Artikel');

    $("#btn-filter").click(() => {
        $('#stfilter').val(1);
        const date = $('#filter_date').data('daterangepicker');
        const judul = $('#filter-judul').val();

        var a = document.getElementById('btn_export');
        var b = document.getElementById('btn_export_pdf');
        var link = `<?= base_url() ?>repository/listRepository/export_excel`;
        var link_pdf = `<?= base_url() ?>repository/listRepository/export_pdf`;
        a.href = link + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-judul=${judul}`;
        b.href = link_pdf + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-judul=${judul}`;

        dynamic({
            start: date.startDate.format('YYYY-MM-DD'),
            end: date.endDate.format('YYYY-MM-DD'),
            judul: judul,
        });
    });

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah Repository");
        $('#id').val("");
        // $('#kategori').val("");
        $('#judul').val("");
        $('#keterangan').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>repository/listRepository/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>repository/listRepository/import_excel',
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
            url: '<?= base_url() ?>repository/listRepository/delete',
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
    $("#myModalLabel").text("Ubah Repository");
    $('#id').val(data.id);
    $('#kategori').val(data.kategori);
    $('#judul').val(data.judul);
    $('#keterangan').val(data.keterangan);
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