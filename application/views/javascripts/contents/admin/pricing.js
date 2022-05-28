$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        "responsive": false,
        "lengthChange": true,
        "autoWidth": false,
        "scrollX": true,
    });
})


function features(id) {
    const datas = JSON.parse(features_json).find(e => e.id == id);
    if (!datas) return;
    //  show card
    $('#freature-card').show();

    // destroy current datatable
    const table_html = $('#dt_feature');
    if (table_html.hasClass('dataTable')) {
        table_html.dataTable();
        table_html.fnDestroy();
    }

    // render table
    let tbody = $('#dt_feature').find('tbody');
    tbody.html('');

    datas.data.forEach(e => {
        tbody.append(`<tr>
        <td>${e}</td>
        <td>
            <button class="btn btn-primary btn-sm" onclick="feature_edit(1, '${e}')">
                <i class="fas fa-edit"></i> Edit
            </button>
            <button class="btn btn-danger btn-sm" onclick="delete_fun()">
                <i class="fas fa-trash"></i> Delete
            </button>
        </td>
        </tr>`);
    });


    // set datatable
    table_html.dataTable({
        "responsive": false,
        "lengthChange": true,
        "autoWidth": false,
        "scrollX": true,
    });
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

function feature_edit(id, title) {
    $('#feature').val(title);
    $('#btn-feature-save').hide();
    $('#btn-feature-update').fadeIn();
    $('#btn-feature-cancel').fadeIn();
}

function feature_cancel() {
    $('#btn-feature-update').hide();
    $('#btn-feature-cancel').hide();
    $('#btn-feature-save').fadeIn();
    $('#feature').val('');
}
