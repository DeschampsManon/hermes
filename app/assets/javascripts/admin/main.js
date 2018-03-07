function change_avatar_source() {
    var authorized_image_format = ['gif', 'png', 'jpeg', 'jpg'];
    var $input = $(this);
    var input_file_extension = $input[0].files[0].name.substring($input[0].files[0].name.lastIndexOf('.') + 1).toLowerCase();

    $('label[for=' + $input.attr('id') + ']').html($input.val());
}

function ajax_image_upload(e) {
    e.preventDefault();
    var formData = new FormData($(this)[0]);
    $.ajax({
        url: $(this).attr('action'),
        type: $(this).attr('method'),
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function () {
            $('#modal-new-stored-image').modal('hide');
        }
    });
}

$(document).on('turbolinks:load', function() {
    $('#admin_stored_image_url').change(change_avatar_source);
    $('#new_admin_stored_image').submit(ajax_image_upload);
});