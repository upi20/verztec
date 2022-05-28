$(function () {
    function dynamic() {
        let filter = null;
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        var tableUser = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>data-master/template/ajax_data/",
                "data": null,
                "type": 'POST'
            },
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            "columns": [
                { "data": "tahapan" },
                { "data": "kategori" },
                { "data": "no_urut" },
                { "data": "nama" },
                {
                    "data": "id", render(data, type, full, meta) {
                        return full.berkas != null ? (`${full.berkas} <a class="btn btn-success btn-sm" href="<?= base_url() ?>files/master/template/${full.berkas}"><i class="fas fa-paperclip"></i></a>`) : ('');
                    }, className: "nowrap"
                },
                { "data": "status_str" },
                {
                    "data": "created_at", render(data, type, full, meta) {
                        return moment(data == null || data == '' ? full.created_at : full.created_at, 'YYYY-MM-DD H:mm:ss').format('DD-MM-YYYY H:mm:ss');

                    }, className: "nowrap"
                },
                {
                    "data": "id", render(data, type, full, meta) {
                        return `<div class="pull-right">
									<button
                                    class="btn btn-primary btn-xs"
                                    data-id="${data}"
                                    data-tahapan="${full.tahapan}"
                                    data-kategori="${full.kategori}"
                                    data-no_urut="${full.no_urut}"
                                    data-nama="${full.nama}"
                                    data-berkas="${full.berkas}"
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
                orderable: true,
                // targets: [0, 5]
            }],
            order: [
                [1, 'asc']
            ]
        });
    }
    dynamic();


    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah File Template");
        $('#id').val("");
        $('#no_urut').val("");
        $('#nama').val("");
        $('#berkas').val("");
        $('#status').val("1");
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/template/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            url: '<?= base_url() ?>data-master/template/delete',
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

    $("#tahapan").change(() => {
        let tahapan = $("#tahapan").val()
        $("#kategori").html('');
        let html = '';
        if(tahapan == ''){
            html += `<option value="">Pilih Kategori</option>`;
        }else if(tahapan == 'Planning'){
            html += `<option value="">Pilih Kategori</option>`;
            html += `<option value="Timeline">Timeline</option>`;
            html += `<option value="SDM">SDM</option>`;
            html += `<option value="Data Yang Diminta">Data Yang Diminta</option>`;
        }else if(tahapan == 'Proses Audit'){
            html += `<option value="">Pilih Kategori</option>`;
            html += `<option value="Kertas Kerja">Kertas Kerja</option>`;
            html += `<option value="Pengujian">Pengujian</option>`;
        }else if(tahapan == 'Report'){
            html += `<option value="">Pilih Kategori</option>`;
            html += `<option value="Final Report">Final Report</option>`;
        }else{
            html += `<option value="">Pilih Kategori</option>`;   
        }
        $("#kategori").html(html);        
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
    $("#myModalLabel").text("Ubah File Template");
    $('#id').val(data.id);
    $('#tahapan').val(data.tahapan);
    $('#kategori').val(data.kategori);
    $('#nama').val(data.nama);
    $('#no_urut').val(data.no_urut);
    $('#berkas').val("");
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