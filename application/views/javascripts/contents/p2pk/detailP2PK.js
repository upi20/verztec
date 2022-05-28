moment.defineLocale('id',{});
let Htbl = '';
let Hid = '';
let Hactive = '';
$('#id_approval').select2();
$(function () {

    function dynamic() {
        $('#v-planning').css("display", "");
        $('#btn-planning').removeClass("btn-outline-primary");
        $('#btn-planning').addClass("btn-primary");
        $('#v-audit').css("display", "none");
        $('#v-report').css("display", "none");
    }

    dynamic();


    function cek_isian_planning(){
        let title = $("#judul").val()
        let description = $("#deskripsi").val()
        let timeline = $("#planning_isi_timeline").val()
        let sdm = $("#planning_isi_sdm").val()
        let diminta = $("#planning_isi_diminta").val()
        let point = 0;
        if(title != ''){
            point = point + 1
        }

        if(description != ''){
            point = point + 1
        }

        if(typeof timeline !== 'undefined'){
            point = point + 1
        }

        if(typeof sdm !== 'undefined'){
            point = point + 1
        }

        if(typeof diminta !== 'undefined'){
            point = point + 1
        }
        let persentase = (point/5)*parseInt(100)
        persentase = Math.round(persentase)
        $("#planning_info_persentase").text("Total Persentase Form Planning ["+persentase+"%] ")
    }

    function cek_isian_proses_audit(){
        let title = $("#judul_audit").val()
        let description = $("#deskripsi_audit").val()
        let kertas_kerja = $("#proses_audit_kertas_kerja").val()
        let pengujian = $("#proses_audit_pengujian").val()
        let point = 0;
        if(title != ''){
            point = point + 1
        }

        if(description != ''){
            point = point + 1
        }

        if(typeof kertas_kerja !== 'undefined'){
            point = point + 1
        }

        if(typeof pengujian !== 'undefined'){
            point = point + 1
        }

        let persentase = (point/4)*parseInt(100)
        persentase = Math.round(persentase)
        $("#proses_audit_info_persentase").text("Total Persentase Form Proses Audit ["+persentase+"%] ")
    }

    function planningtab() {
        cek_isian_planning()

        $('#v-planning').css("display", "");
        $('#btn-planning').removeClass("btn-outline-primary");
        $('#btn-planning').addClass("btn-primary");
        $('#v-audit').css("display", "none");
        $('#btn-audit').removeClass("btn-primary");
        $('#btn-audit').addClass("btn-outline-primary");
        $('#v-report').css("display", "none");
        $('#btn-report').removeClass("btn-primary");
        $('#btn-report').addClass("btn-outline-primary");
    }
    function audittab() {
        cek_isian_proses_audit()
        $('#v-planning').css("display", "none");
        $('#btn-planning').removeClass("btn-primary");
        $('#btn-planning').addClass("btn-outline-primary");
        $('#v-audit').css("display", "");
        $('#btn-audit').removeClass("btn-outline-primary");
        $('#btn-audit').addClass("btn-primary");
        $('#v-report').css("display", "none");
        $('#btn-report').removeClass("btn-primary");
        $('#btn-report').addClass("btn-outline-primary");
    }
    function reporttab() {
        $('#v-planning').css("display", "none");
        $('#btn-planning').removeClass("btn-primary");
        $('#btn-planning').addClass("btn-outline-primary");
        $('#v-audit').css("display", "none");
        $('#btn-audit').removeClass("btn-primary");
        $('#btn-audit').addClass("btn-outline-primary");
        $('#v-report').css("display", "");
        $('#btn-report').removeClass("btn-outline-primary");
        $('#btn-report').addClass("btn-primary");
    }
    if (window.location.hash === '#planningtab') {planningtab();}
    if (window.location.hash === '#audittab') {audittab();}
    if (window.location.hash === '#v-report') {reporttab();}
    $("#btn-planning").click(() => {
        location.replace("#planningtab");
        planningtab();
    });

    $("#btn-audit").click(() => {
        location.replace("#audittab");
        audittab();
    });

    $("#btn-report").click(() => {
        location.replace("#v-report");
        reporttab();
    });

    $('#btn-add-file').click((ev) => {
        number = number + 1;
        ev.preventDefault();
        $('#list-doc').append(`
        <div class="row doc-${number}" id="list-${number}">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="doc">Attach Doc</label>
                    <div class="row m-1">
                        <div class="col-md-8">
                            <input type="hidden" id="id_doc[]" name="id_doc[]">
                            <input type="file" class="form-control" id="doc[]" name="doc[]" placeholder="Attach Doc" accept="application/pdf,application/msword,
                            application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-danger del-list" data-id='${number}' id="btn-del-file"><i class="fa fa-minus"></i> Hapus File</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `)
        $('.del-list').click(function(){
            $(`#list-${$(this).data('id')}`).remove()
        })
    });    

    $('#btn-download-timeline').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Planning&kategori=Timeline',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-timeline").empty()
            data.forEach(e => {
                $("#isi-template-timeline").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-download-sdm').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Planning&kategori=SDM',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-sdm").empty()
            data.forEach(e => {
                $("#isi-template-sdm").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-download-data-yang-diminta').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Planning&kategori=Data Yang Diminta',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-data-yang-diminta").empty()
            data.forEach(e => {
                $("#isi-template-data-yang-diminta").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-download-kertas-kerja').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Proses Audit&kategori=Kertas Kerja',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-kertas-kerja").empty()
            data.forEach(e => {
                $("#isi-template-kertas-kerja").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-download-pengujian').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Proses Audit&kategori=Pengujian',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-pengujian").empty()
            data.forEach(e => {
                $("#isi-template-pengujian").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-download-report').click(() => {
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/getTemplate?tahapan=Report&kategori=Final Report',
            data: null,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            $("#isi-template-report").empty()
            data.forEach(e => {
                $("#isi-template-report").append('<tr>'+
                        '<td style="width: 7%; text-align: center;">'+e.no_urut+'</td>'+
                        '<td style="width: 93%;"><a target="_BLANK" href="<?= base_url() ?>files/master/template/'+e.berkas+'" style="color: black;"><i class="fa fa-download"> '+e.nama+'</i></a></td>'+
                    '</tr>'
                )
            });
        })
    })

    $('#btn-add-file-audit').click((ev) => {
        numbers = numbers + 1;
        ev.preventDefault();
        $('#list-doc-audit').append(`
        <div class="row list-doc-audit-${numbers}" id="list-doc-audit-${numbers}">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="doc">Attach Doc</label>
                    <div class="row m-1">
                        <div class="col-md-8">
                            <input type="file" class="form-control" id="doc-audit[]" name="doc-audit[]" placeholder="Attach Doc" />
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-danger del-list" data-id='${numbers}' id="btn-del-file-audit"><i class="fa fa-minus"></i> Hapus File</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `)
        $('.del-list').click(function(){
            $(`#list-doc-audit-${$(this).data('id')}`).remove()
        })
    });    

    $("#judul_audit, #deskripsi_audit, #kertas_kerja, #pengujian").change(function () {
        if(global_st_proses < 3){
            $.ajax({
                method: 'post',
                url: '<?= base_url() ?>p2pk/listP2PK/set_st_proses',
                data: {
                    id_p2pk:global_id_p2pk,
                    status:3,
                },
            }).done((data) => {
                global_st_proses = 3;
            }).fail(($xhr) => {
                console.log($xhr);
            })
        }
      })

    
    // Simpan Planning
    $("#form-planning").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_planning',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            data = data.data;
            console.log(data)
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#planningtab");
            location.reload();
            // dynamic();
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
    
    // Simpan Proses Audit
    $("#form-audit").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_audit',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            data = data.data;
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#audittab");
            location.reload();
            // dynamic();
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

    // Simpan Pilih Approval
    $("#form-pilih-approval").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_pilih_approval',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            data = data.data;
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#v-report");
            location.reload();
            // dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#ApprovalModal').modal('toggle')
        })
    });

    // Simpan Komentar
    $("#form-upload-komentar").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_file_komentar',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            data = data.data;
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#v-report");
            location.reload();
            // dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#UploadKomentarModal').modal('toggle')
        })
    });

    // Simpan Pilih Approval
    $("#form-upload-report").submit(function (ev) {
        ev.preventDefault();
        if($("#rpf").val() == "3" && document.getElementById("fileReportf").files.length == 0){
            Toast.fire({
                icon: 'error',
                title: 'File Report harus dipilih!'
            })
            $('#SelesaiModal').modal('toggle');
            return;
        }
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_file_report',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            data = data.data;
            console.log(data[0]);
            if(data[1] == 3){
                    Toast.fire({
                        icon: 'success',
                        title: 'P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK'
                    })
                    setTimeout(() => {  location.replace("<?= base_url() ?>p2pk/listP2PK"); }, 2000);

            }else{
                Toast.fire({
                    icon: 'success',
                    title: 'Data berhasil disimpan'
                })
                location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data[0]+"#v-report");
                location.reload();
            }
            // dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#UploadReportModal').modal('toggle')
        })
    });
    $("#form-upload-final-report").submit(function (ev) {
        ev.preventDefault();
        if($("#rpf").val() == "3" && document.getElementById("fileReportf").files.length == 0){
            Toast.fire({
                icon: 'error',
                title: 'File Report harus dipilih!'
            })
            $('#SelesaiModal').modal('toggle');
            return;
        }
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/simpan_file_report',
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            data = data.data;
            console.log(data[0]);
            // if(data[1] == 3){
            //         Toast.fire({
            //             icon: 'success',
            //             title: 'P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK'
            //         })
            //         setTimeout(() => {  location.replace("<?= base_url() ?>p2pk/listP2PK"); }, 2000);
            //         $('#UploadFinalReportModal').modal('toggle')
            //         $('#SelesaiModal').modal('toggle')

            // }else{
                Toast.fire({
                    icon: 'success',
                    title: 'Data berhasil disimpan'
                })
                location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data[0]+"#v-report");
                location.reload();
            // }
            // dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#UploadFinalReportModal').modal('toggle')
        })
    });

    
    // hapus
    $('#OkCheck').click(() => {
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/hapusFile',
            data: {
                tbl: Htbl,
                id: Hid
            }
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil dihapus'
            })
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+Hactive);
            location.reload();
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

    // Selesaikan
    $('#SelesaiModalYa').click(() => {
        $("#form-upload-final-report").submit();

        // let id = $("#idSelesai").val()
        // $.LoadingOverlay("show");
        // $.ajax({
        //     method: 'post',
        //     url: '<?= base_url() ?>p2pk/listP2PK/selesaikan',
        //     data: {id:id},
        // }).done((data) => {
        //     Toast.fire({
        //         icon: 'success',
        //         title: 'P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK'
        //     })
        //     data = data.data;
        //     setTimeout(() => {  location.replace("<?= base_url() ?>p2pk/listP2PK"); }, 2000);
        // }).fail(($xhr) => {
        //     Toast.fire({
        //         icon: 'error',
        //         title: 'Terjadi kesalahan saat menyelesaikan P2PK'
        //     })
        // }).always(() => {
        //     $('#SelesaiModal').modal('toggle');
        //     $.LoadingOverlay("hide");
        // })
    })

})

// Click HapusFile
const HapusFile = (tbl, id, active) => {
    Htbl = tbl;
    Hid = id;
    Hactive = active;
    $("#LabelCheck").text('Form Hapus')
    $("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
    $('#ModalCheck').modal('toggle')
}


// Click pilihApproval
const pilihApproval = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    $("#ApprovalModalLabel").text("Pilih Approval");
    $('#p_id_p2pk').val(data.id_p2pk);
    $('#p_id_p2pk_report').val(data.id);
    $('#kode').val(data.kode);
    $('#report_phase_approval').val(data.report_phase);
    ajax_select(false, '#id_approval', '<?= base_url(); ?>/p2pk/listP2PK/ajax_select_list_bod', null, false, 'Pilih Approval', data.approval);
    if(data.status_kondisi_approval == 2){
        $("#isi-submit-pilih-approval").hide()
        $('#id_approval').attr("disabled", true);
    }
    $('#ApprovalModal').modal('toggle')
    $.LoadingOverlay("hide");
}

const updateApproval = (datas) => {
    data_lama = datas.dataset;
    console.log(data_lama)
    $.ajax({
        method: 'post',
        url: '<?= base_url() ?>p2pk/listP2PK/update_pilih_approval',
        data: {
            id_p2pk: data_lama.id_p2pk,
            id_p2pk_report: data_lama.id,
            id_approval: data_lama.approval,
            kode: data_lama.kode,
            report_phase: data_lama.report_phase
        },
        cache: true,
        // contentType: false,
        processData: true,
    }).done((data) => {
        Toast.fire({
            icon: 'success',
            title: 'Data berhasil disimpan'
        })
        data = data.data;
        location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#v-report");
        location.reload();
        // dynamic();
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Data gagal disimpan'
        })
    }).always(() => {
        $.LoadingOverlay("hide");
    })
}

// Click uploadReport
const uploadReport = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    $("#UploadReportModalLabel").text("Upload Report");
    $('#r_id_p2pk').val(data.id_p2pk);
    $('#r_id_p2pk_report').val(data.id);
    $('#r_report_phase').val(data.report_phase);
    $('#rpf').val(data.report_phase);
    if(data.status_kondisi_upload_file == 2){
        $("#isi-submit-upload-file").hide()
    }
    if(data.file != ''){
        $('#sfile').empty().append(`<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/${data.file}"><i class="fa fa-download"></i> ${data.file}</a>`);
    }else{
        $('#sfile').empty().append("File belum diupload");
    }
    $('#fileReport').val('');
    $('#UploadReportModal').modal('toggle')
    $.LoadingOverlay("hide");
}
const uploadFinalReport = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    $("#UploadFinalReportModalLabel").text("Upload Final Report");
    $('#r_id_p2pk_f').val(data.id_p2pk);
    $('#r_id_p2pk_f_report').val(data.id);
    $('#r_report_f_phase').val(data.report_phase);
    $('#rpf').val(data.report_phase);
    if(data.file != ''){
        $('#sffile').empty().append(`<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/${data.file}"><i class="fa fa-download"></i> ${data.file}</a>`);
    }else{
        $('#sffile').empty().append("File belum diupload");
    }
    $('#fileReport').val('');
    $('#UploadFinalReportModal').modal('toggle')
    $.LoadingOverlay("hide");
}

const updateReport = (datas) => {
    data_lama = datas.dataset;
    $.ajax({
        method: 'post',
        url: '<?= base_url() ?>p2pk/listP2PK/update_status_file_report',
        data: {
            id_p2pk: data_lama.id_p2pk,
            id_p2pk_report: data_lama.id,
            report_phase: data_lama.report_phase
        },
        cache: true,
        // contentType: true,
        processData: true,
    }).done((data) => {
        // conosle.log(data)
        data = data.data;
        if(data[1] == 3){
            Toast.fire({
                icon: 'success',
                title: 'P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK'
            })
            setTimeout(() => {  location.replace("<?= base_url() ?>p2pk/listP2PK"); }, 2000);
        }else{
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data[0]+"#v-report");
            location.reload();
        }
        // dynamic();
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Data gagal disimpan'
        })
    }).always(() => {
        $.LoadingOverlay("hide");
        // $('#UploadReportModal').modal('toggle')
    })
}

// Click uploadKomentar
const uploadKomentar = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    $("#UploadKomentarModalLabel").text("Upload Komentar");
    $('#k_id_p2pk').val(data.id_p2pk);
    $('#k_id_p2pk_report').val(data.id);
    $('#k_report_phase').val(data.report_phase);
    if(data.file_komen != ''){
        $('#sfilekomen').empty().append(`<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/${data.file_komen}"><i class="fa fa-download"></i> ${data.file_komen}</a>`);
    }else{
        $('#sfilekomen').empty().append("Komentar belum diupload");
    }
    if(data.tanggal_komentar_submit != ''){
        $('#stglkomen').empty().append(data.tanggal_komentar_submit);
    }else{
        $('#stglkomen').empty().append("Komentar belum diupload");
    }
    if(data.status_kondisi_file_komentar == 2){
        $("#isi-submit-file-komentar").hide()
        $('#isi-file-komentar').hide()
        $('#komentar').prop('readonly', true)
    }
    $('#fileKomentar').val('');
    $('#komentar').val(data.komentar);
    $('#UploadKomentarModal').modal('toggle')
    $.LoadingOverlay("hide");
}

const updateKomentar = (datas) => {
    data_lama = datas.dataset;
    $.LoadingOverlay("show");
     $.ajax({
            method: 'post',
            url: '<?= base_url() ?>p2pk/listP2PK/update_file_komentar',
            data: {
                id_p2pk: data_lama.id_p2pk,
                id: data_lama.id,
                report_phase: data_lama.report_phase
            },
            cache: true,
            processData: true,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            data = data.data;
            location.replace("<?= base_url() ?>p2pk/listP2PK/detail/"+data+"#v-report");
            location.reload();
            // dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
        })
}

// Click lihatKomen
const lihatKomen = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    let komen = '';
    if(data.file_komen != ''){
        komen = `<a class="btn btn-primary btn-sm" href="<?= base_url() ?>files/p2pk/report/${data.file_komen}"><i class="fa fa-download"></i> ${data.file_komen}</a>`
    }else{
        komen = `Tidak ada file komentar`
    }
    $("#LihatKomentarModalLabel").text("Lihat Komentar");
    $('#lkomen').empty().append(`
        <div class="row mb-2">
            <div class="col-md-3">
                <label for="">Tanggal Komentar</label>
            </div>
            <div class="col-md-9">
                ${data.tanggal_komentar_submit}
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-md-3">
                <label for="">File Komentar</label>
            </div>
            <div class="col-md-9">
                ${komen}
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label for="">Komentar</label>
            </div>
            <div class="col-md-9 border border-dark">
                 ${data.komentar}
            </div>
        </div>
    `);
    $('#LihatKomentarModal').modal('toggle')
    $.LoadingOverlay("hide");
}

const selesaiReport = (datas) => {
    data = datas.dataset;
    let id = data.id
    $.LoadingOverlay("show");    
    $("#idSelesai").val(id)
    $("#SelesaiModalLabel").text('Apakah anda yakin akan menyelesaikan P2PK ini?')
    $("#SelesaiModalContent").text('Anda tidak bisa mengubah data apapun untuk selanjutnya')
    // $('#SelesaiModal').modal('toggle');
    // alert(1)
    $("#form-upload-final-report").submit();
    // $.LoadingOverlay("hide");
}

const selesaikanSemua = (datas) => {
    data = datas.dataset;
    $.LoadingOverlay("show");
    $.ajax({
        method: 'post',
        url: '<?= base_url() ?>p2pk/listP2PK/simpan_file_report_semua',
        data: {
            id_p2pk: data.id_p2pk,
            id_p2pk_report: data.id,
            report_phase: data.report_phase
        },
        cache: true,
        processData: true,
    }).done((data2) => {
        data2 = data.data;
        Toast.fire({
            icon: 'success',
            title: 'P2PK ini telah berhasil diselesaikan. Silahkan cek di halaman P2PK'
        })
        $.LoadingOverlay("hide");
        setTimeout(() => {  location.replace("<?= base_url() ?>p2pk/listP2PK"); }, 2000);
        // dynamic();
    }).fail(($xhr) => {
        Toast.fire({
            icon: 'error',
            title: 'Data gagal disimpan'
        })
    }).always(() => {
        // $('#UploadFinalReportModal').modal('toggle')
    })
}
