$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        // "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "scrollX": true,
    });

    $('.select2').select2();
})