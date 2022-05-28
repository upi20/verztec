$(function () {
    var url_string = location.href;
    var url = new URL(url_string);
    var filter_status = url.searchParams.get("filter-status");
    if(filter_status != ''){
        dynamic({
            status: filter_status,
            status_proses: '',
        });
    }else{
        dynamic();
    }

    $('#filter-kategori').select2();
    $('#filter-client').select2();
    $('#id_client').select2();
    $('#id_pic').select2();
    $('#id_resiko').select2();
    $('#filter-status_proses').select2();
    function dynamic(datas = {
        status: null,
        status_proses: null,
    }) {
        let filter = null;
        if (datas.status != null && datas.status_proses != null && datas.client != null && datas.kategori != null) {
            filter = {
                status: datas.status,
                status_proses: datas.status_proses,
                client: datas.client,
                kategori: datas.kategori,
            }
        }
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>p2pk/ListP2PK/ajax_data/",
                "data": filter,
                "type": 'POST'
            },
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            "columns": [
                { "data": "kode" },
                { "data": "kategori" },
                { "data": "client" },
                { "data": "pic" },
                { "data": "judul" },
                {
                    "data": "resiko", render(data, type, full, meta) {
                        if(full.resiko == 'High'){
                            return `<label class="btn btn-sm btn-danger" style="width: 100%;">${data}</label>`
                        }else if(full.resiko == 'Medium'){
                            return `<label class="btn btn-sm btn-warning" style="width: 100%;">${data}</label>`
                        }else if(full.resiko == 'Low'){
                            return `<label class="btn btn-sm btn-success" style="width: 100%;">${data}</label>`
                        }else{
                            return ``
                        }                   
                    }, className: "nowrap"
                },
                { "data": "status_str" },
                { "data": "status_proses_str" },
                {
                    "data": "id", render(data, type, full, meta) {
                        if(full.kode != null){
                            if(full.status == 1){
                                let sw = `<div class="pull-right">
                                        <a class="btn btn-success btn-xs" 
                                        href="<?= base_url() ?>p2pk/listP2PK/detail/${data}">
                                        <i class="fa fa-edit"></i> Detail</a>`;
                                sw += full.lv_login == "Super Admin" || full.lv_login == "Partner L2" ? (
                                    `<button
                                        class="btn btn-primary btn-xs ml-1"
                                        data-id="${data}"
                                        data-kode="${full.kode}"
                                        data-id_kategori="${full.id_kategori}"
                                        data-id_client="${full.id_client}"
                                        data-id_pic="${full.id_pic}"
                                        data-judul="${full.judul}"
                                        data-status="${full.status}"
                                        onclick="Ubah(this)">
                                            <i class="fa fa-edit"></i> Ubah
                                        </button>
                                        <button class="btn btn-danger btn-xs" onclick="Hapus(${data})">
                                            <i class="fa fa-trash"></i> Hapus
                                        </button>`
                                ) : (``);
                                sw +=   `</div>`;
                                return sw;
                            }else{
                                let sw = `<div class="pull-right">
                                            <a class="btn btn-success btn-xs" href="<?= base_url() ?>p2pk/listP2PK/detail/${data}">
                                            <i class="fa fa-edit"></i> Detail</a>`;
                                sw +=   `</div>`;
                                return sw;
                            }
                        }else{
                            return ''
                        }                            
                    }, className: "nowrap"
                }
            ],
            columnDefs: [{
                "defaultContent": "",
                "targets": "_all"
            }]
            // columnDefs: [{
            //     orderable: false,
            //     targets: [0, 5]
            // }],
            // order: [
            //     [0, 'desc']
            // ]
        });
    }

    ajax_select(null, '#filter-client', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_client', null, null, 'Klien');
    ajax_select(null, '#filter-kategori', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_kategori', null, null, 'Kategori');

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah P2PK");
        $('#id').val("");
        ajax_select({ id: '#btn-tambah', pretext: 'Tambah', text: '<i class="fa fa-plus"></i> Tambah' }, '#id_kategori', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_kategori', null, '#myModal', 'Pilih Kategori');
        ajax_select({ id: '#btn-tambah', pretext: 'Tambah', text: '<i class="fa fa-plus"></i> Tambah' }, '#id_client', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_client', null, '#myModal', 'Pilih Klien');
        ajax_select({ id: '#btn-tambah', pretext: 'Tambah', text: '<i class="fa fa-plus"></i> Tambah' }, '#id_pic', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_pic', null, '#myModal', 'Pilih PIC');
        ajax_select({ id: '#btn-tambah', pretext: 'Tambah', text: '<i class="fa fa-plus"></i> Tambah' }, '#id_resiko', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_resiko', null, '#myModal', 'Risiko');
        // $('#id_pic').val("");
        $('#judul').val("");
        $('#resiko').val("");
        $('#status').val("1");
    });

    $("#id_kategori").change(() => {
        let id_kategori = $("#id_kategori").val()
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getCode',
            data: {
                id_kategori: id_kategori
            }
        }).done((data) => {
            console.log(data)
            $('#kode').val(data.id);
        })
    });

    $("#id_client").change(() => {
        id_client = $("#id_client").val();
        ajax_select(false, '#id_resiko', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_resiko', {id_client:id_client}, false, 'Tidak Diketahui', id_client);
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>p2pk/listP2PK/delete',
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

    $("#btn-filter").click(() => {
        $('#stfilter').val(1);
        const status = $('#filter-status').val();
        const status_proses = $('#filter-status_proses').val();
        const client = $('#filter-client').val();
        const kategori = $('#filter-kategori').val();
        var a = document.getElementById('btn_export');
        var b = document.getElementById('btn_export_pdf');
        var link = `<?= base_url() ?>p2pk/listP2PK/export_excel`;
        var link_pdf = `<?= base_url() ?>p2pk/listP2PK/export_pdf`;
        a.href = link + `?status=${status}&status_proses=${status_proses}&client=${client}&kategori=${kategori}`;
        b.href = link_pdf + `?status=${status}&status_proses=${status_proses}&client=${client}&kategori=${kategori}`;
        
        dynamic({
            status: status,
            status_proses: status_proses,
            client: client,
            kategori: kategori,
        });
    });

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
    console.log(data.id_pic)
    $("#myModalLabel").text("Ubah List P2PK");
    $('#id').val(data.id);
    ajax_select(false, '#id_kategori', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_kategori', null, '#myModal', 'Pilih Kategori', data.id_kategori);
    ajax_select(false, '#id_client', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_client', null, '#myModal', 'Pilih Klien', data.id_client);
    ajax_select(false, '#id_resiko', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_resiko', {id_client:data.id_client}, false, 'Tidak Diketahui', data.id_client);
    ajax_select(false, '#id_pic', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_pic', null,  '#myModal', 'Pilih PIC', data.id_pic);
    // $('#id_pic').val(data.id_pic);
    $('#kode').val(data.kode);
    $('#judul').val(data.judul);
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