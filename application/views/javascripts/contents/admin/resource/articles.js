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
        }]
    });

    $('.select2').select2();
    $('#author').select2({ dropdownParent: $('#myModal') });
    $('#category').select2({ dropdownParent: $('#myModal') });
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