$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        // "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        // "scrollX": true,
        columnDefs: [{
            targets: 2,
            render: function (data, type, row) {
                return `
                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${data}">
                ${data.substr(0, 100) + (data.length > 100 ? '...' : '')}
                </span>
                `;
            }
        }]
    });
})

$('.summernote').summernote({

    height: 200,
})