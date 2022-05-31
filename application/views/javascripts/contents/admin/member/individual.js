$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        // "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "scrollX": true,
    });

    $('.select2').select2();
    $('#city').select2({ dropdownParent: $('#myModal') });
    $('#organization').select2({ dropdownParent: $('#myModal') });
    $('#country').select2({ dropdownParent: $('#myModal') });
    $('#chruch').select2({ dropdownParent: $('#myModal') });
    $('#packet').select2({ dropdownParent: $('#myModal') });
})

$('.summernote').summernote({

})

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