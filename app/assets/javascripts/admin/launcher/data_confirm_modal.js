function data_confirm_modal_setup() {
    dataConfirmModal.setDefaults({
        title: I18n.confirmation,
        commit: I18n.translate('confirm'),
        cancel: I18n.cancel,
        backdrop: 'static',
        keyboard: false,
    });
}

$(document).on('turbolinks:load', function() {
    data_confirm_modal_setup();
});