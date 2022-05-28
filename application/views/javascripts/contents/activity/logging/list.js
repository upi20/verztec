$(function () {
    $('#filter-modul').select2();
    $('#filter-by').select2();
    $('#filter_date').daterangepicker();
    function dynamic(datas = {
        start: null,
        end: null,
        modul: null,
        by: null,
        cari: null,
    }) {
        let filter = null;
        if (datas.start != null || datas.end != null || datas.modul != null || datas.by != null || datas.cari != null) {
            filter = {
                date_start: datas.start,
                date_end: datas.end,
                modul: datas.modul,
                by: datas.by,
                // cari: datas.cari,
            }
        }

        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>activity/logging/ajax_data/",
                "data": filter,
                "type": 'POST'
            },
            "search": {
                "search": datas.cari
            },
            "processing": true,
              "serverSide": true,
              "responsive": true,
              "lengthChange": true,
              "autoWidth": true,
              // "scrollX": true,
            "columns": [
                { "data": null },
                { "data": "created_at", render(data, style, full, meta){
                      return moment(data, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY H:mm:ss');
                    },
                },
                { "data": "modul" },
                { "data": "user", render(data, style, full, meta){
                      if(data == null){
                        return 'Super Admin'
                      }else{
                        return data
                      }
                    },
                },
                { "data": "jenis_str" },
                { "data": "data_lama" },
                { "data": "data_baru" }
            ],
            order: [
                [1, 'desc']
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

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
        return null;
    };
    
    var isi_modul = getUrlParameter('menu')
    var isi_by = getUrlParameter('by')

    $('#stfilter').val(1);

    ajax_select(false, '#filter-modul', '<?= base_url() ?>activity/logging/ajax_select_list_modul', null, null, 'Modul', isi_modul);
    ajax_select_by(null, '#filter-by', '<?= base_url() ?>activity/logging/ajax_select_list_by', null, null, 'By');

    $('#stfilter').val(1);
    const date = $('#filter_date').data('daterangepicker')
    var cari = getUrlParameter('cari')
    if(cari != null){
        if(isi_modul == "Data Member"){
            var new_cari = cari.split("_")      
            new_cari = new_cari[0]+" = "+new_cari[1]
            cari = new_cari
        }
    }
    const by = $('#filter-by').val()

    dynamic({
        start: date.startDate.format('YYYY-MM-DD'),
        end: date.endDate.format('YYYY-MM-DD'),
        modul: isi_modul,
        by: isi_by,
        cari: cari,
    });

    $("#btn-filter").click(() => {
        $('#stfilter').val(1);
        const date = $('#filter_date').data('daterangepicker')
        const modul = $('#filter-modul').val()
        const cari = getUrlParameter('cari')
        const by = $('#filter-by').val();
        var a = document.getElementById('btn_export');
        var b = document.getElementById('btn_export_pdf');
        var link = `<?= base_url() ?>activity/logging/export_excel`;
        var link_pdf = `<?= base_url() ?>activity/logging/export_pdf`;
        a.href = link + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-modul=${modul}&&filter-by=${by}`;
        b.href = link_pdf + `?filter-start=${date.startDate.format('YYYY-MM-DD')}&&filter-end=${date.endDate.format('YYYY-MM-DD')}&&filter-modul=${modul}&&filter-by=${by}`;

        dynamic({
            start: date.startDate.format('YYYY-MM-DD'),
            end: date.endDate.format('YYYY-MM-DD'),
            modul: modul,
            by: by,
            cari: cari,
        });
    });

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah List Activity");
        $('#id').val("");
        $('#nama').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>activity/logging/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>activity/logging/import_excel',
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
            url: '<?= base_url() ?>activity/logging/delete',
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
const Ubah = (id) => {
    $.LoadingOverlay("show");
    $.ajax({
        method: 'get',
        url: '<?= base_url() ?>activity/logging/getActivity',
        data: {
            id: id
        }
    }).done((data) => {
        if (data.data) {
            data = data.data;
            $("#myModalLabel").text("Ubah Activity");
            $('#id').val(data.id);
            $('#nama').val(data.nama);
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