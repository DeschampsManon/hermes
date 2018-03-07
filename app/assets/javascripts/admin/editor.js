function update_editor() {
    save_editor_source();
    $.post($(this).attr('action'), $(this).serialize()).done(function() {

    });
    return false;
}

function save_editor_source() {
    var source = $('iframe#editor-preview').contents().find('html')[0].outerHTML;
    $('#editor-source').val(source);
}

function set_default_source(e) {
    e.preventDefault();
    var form = $(this);
    var default_source = $(this).find('input[type="submit"]').data('source');
    $.get(default_source, function(data) {
        form.find('#editor-source').val(data);
        $.post(form.attr('action'), form.serialize());
    });
}

$(document).on('turbolinks:load', function() {
    $('.email_templates-edit form').submit(update_editor);
    $('#new_admin_email_template').submit(set_default_source);
    $("#new_admin_email_templat").unbind('submit');
});