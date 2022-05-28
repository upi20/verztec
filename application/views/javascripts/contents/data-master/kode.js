moment.defineLocale('id',{});
$(function () {

    $('#id_menu').select2();
    $('#id_kategori').select2();

    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/kode/ajax_data/",
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
                { "data": "menu" },
                { "data": "keterangan_kategori" },
                { "data": "kode" },
                { "data": "bulan" },
                { "data": "tahun" },
                { "data": "jumlah" },
                { "data": "status_str" },
                {
                    "data": "updated_at", render(data, type, full, meta) {
                        return moment(data == null || data == '' ? full.created_at : full.updated_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button class="btn btn-primary btn-xs" onclick="Ubah(${data},${full.id_menu})">
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
        $("#myModalLabel").text("Tambah Kode");
        $('#id').val("");

        ajax_select(false, '#id_menu', '<?= base_url(); ?>data-master/kode/ajax_select_list_menu', null, '#myModal', 'Pilih Menu', null);

        $('#id_kategori').val('').trigger('change');
        $('#kode').val("");
        $('#bulan').val("Ya");
        $('#tahun').val("Ya");
        $('#jumlah').val("");
        $('#status').val("1");
    });

    $("#id_menu").change(function () {
        const id_menu = {id_menu: $(this).val()};

        // 2 = relasi ke tabel kategori keanggotaan
        if($(this).val() == 2){
            ajax_select(false, '#id_kategori', '<?= base_url(); ?>data-master/kode/ajax_select_list_kategori_anggota', id_menu, '', 'Pilih Kategori', null);
        }else{
            ajax_select(false, '#id_kategori', '<?= base_url(); ?>data-master/kode/ajax_select_list_kategori', id_menu, '', 'Pilih Kategori', null);
        }
    })

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/kode/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>data-master/kode/import_excel',
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
            url: '<?= base_url() ?>data-master/kode/delete',
            data: {
                id: id
            }
        }).done((data) => {
            $('#id_menu').val('').trigger('change');
            $('#id_kategori').val('').trigger('change');
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
const Ubah = (id, id_menu) => {
    $.LoadingOverlay("show");
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>data-master/kode/getKode',
        data: {
            id: id,
            id_menu: id_menu
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            console.log(data)
            $("#myModalLabel").text("Ubah Kode");
            $('#id').val(data.id);

            ajax_select(false, '#id_menu', '<?= base_url(); ?>data-master/kode/ajax_select_list_menu', null, '#myModal', 'Pilih Menu', data.id_menu);
            const id_menu = {id_menu: data.id_menu};            
            // 2 = relasi ke tabel kategori keanggotaan
            if(data.id_menu == 2){
                ajax_select(false, '#id_kategori', '<?= base_url(); ?>data-master/kode/ajax_select_list_kategori_anggota', id_menu, '', 'Pilih Kategori', data.id_kategori);
            }else{
                ajax_select(false, '#id_kategori', '<?= base_url(); ?>data-master/kode/ajax_select_list_kategori', id_menu, '', 'Pilih Kategori', data.id_kategori);
            }
            $('#kode').val(data.kode);
            $('#bulan').val(data.bulan);
            $('#tahun').val(data.tahun);
            $('#jumlah').val(data.jumlah);
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

$("#id_menu").change(function () {
    const id_menu = {id_menu: $(this).val()};
    ajax_select(false, '#id_kategori', '<?= base_url(); ?>data-master/kode/ajax_select_list_kategori', id_menu, '', 'Pilih Menu', null);
})

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