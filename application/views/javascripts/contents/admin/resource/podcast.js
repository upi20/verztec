$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        "responsive": false,
        "lengthChange": true,
        "autoWidth": false,
        "scrollX": true,
    });
})