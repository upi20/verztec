$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        // "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "scrollX": true,
        columnDefs: [{
            targets: 5,
            render: function (data, type, row) {
                return `
                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${data}">
                ${data.substr(0, 30) + (data.length > 30 ? '...' : '')}
                </span>
                `;
            }
        }, {
            targets: 3,
            render: function (data, type, row) {
                return `
                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${data}">
                ${data.substr(0, 30) + (data.length > 30 ? '...' : '')}
                </span>
                `;
            }
        }, {
            targets: 6,
            render: function (data, type, row) {
                return secondConverter(data);
            }
        }]
    });

    $('.select2').select2();
    $('#source').on('change', function () {
        setResource($(this).val());
    })
    setResource();
})

function setResource(set = 'file') {
    if (set == 'file') {
        $('.url').each(function () {
            $(this).hide();
        });
        $('.file').each(function () {
            $(this).show();
        });
    } else if (set == 'hyperlink') {
        $('.url').each(function () {
            $(this).show();
        });
        $('.file').each(function () {
            $(this).hide();
        });
    }
}

function secondConverter(data) {
    const m = 60;
    const h = m * 60;
    const d = h * 24;

    const r_d = parseInt(data / d);
    const r_h = parseInt((data % d) / h);
    const r_m = parseInt(((data % d) % h) / m);
    const r_s = (((data % d) % h) % m);

    const addZero = e => (e < 10 ? `0${e}` : e);

    return (r_d ? (addZero(r_d) + '.') : '') + (r_h ? (addZero(r_h) + '.') : '') + (r_m ? (addZero(r_m) + '.') : '') + (r_s ? addZero(r_s) : '');
}

function delete_fun() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
            )
        }
    })
}

$('.summernote').summernote({

})