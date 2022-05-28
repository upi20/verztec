$(function () {
    $("#isi-data").empty()
    $.ajax({
        method: 'get',
        url: 'https://auditany.com/api/aktifitas/list_aktifitas',
        data: null
    }).done((data) => {
        data.data.forEach(e => {
            $("#isi-data").append(''+
                '<tr>'+
                    '<td>'+e.nama+'</td>'+
                    '<td>'+e.keterangan+'</td>'+
                    '<td>'+e.tanggal+'</td>'+
                    '<td>'+e.tempat+'</td>'+
                    '<td>'+e.created_at+'</td>'+
                '</tr>'
            )
        });
    })
})