$(document).ready(() => {
    const table_html = $('#dt_basic');
    table_html.dataTable({
        // "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "scrollX": true,
        columnDefs: [{
            targets: 4,
            render: function (data, type, row) {
                return `
                <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${data}">
                ${data.substr(0, 50) + (data.length > 50 ? '...' : '')}
                </span>
                `;
            }
        }, {
            targets: 5,
            render: function (data, type, row) {
                return secondConverter(data);
            }
        }]
    });

    $('.select2').select2();
})

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