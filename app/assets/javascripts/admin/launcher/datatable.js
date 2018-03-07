var dataTable;
function datatable_setup() {
    I18n.locale = $('body').data('locale');
    $.extend( true, $.fn.DataTable.defaults, {
        responsive: true,
        language: {
            search: '',
            lengthMenu: '<select>'+
            '<option value="10">10 '   + I18n.t('entries') + '</option>'  +
            '<option value="50">50 '   + I18n.t('entries') + '</option>'  +
            '<option value="100">100 ' + I18n.t('entries') + '</option>' +
            '<option value="-1">'     + I18n.t('all') + '</option>' +
            '</select>',
            paginate: {
                previous:   '<i class="material-icons">keyboard_arrow_left</i>',
                next:   '<i class="material-icons">keyboard_arrow_right</i>',
            },
        },
        stateSave: true
    } );

    dataTable = $('.datatable').DataTable({
        dom: '<"datatable-filters"fl>tip'
    });
}

$(document).on('turbolinks:load', function() {
    datatable_setup();
    $('.dataTables_length select').addClass('form-control select2');
    $('.dataTables_filter input').addClass('form-control');
});
