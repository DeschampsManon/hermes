function validate_setup() {
    $.validator.setDefaults({
        errorElement: 'span',
        highlight: function(element) {
            if (!$(element).parent().hasClass('form-error-container')) {
                $(element).wrap('<div class="form-error-container"></div>');
            }
        }
    });

    $('.form-validation').each(function() {
        $(this).validate({
            rules: {
                'user[password]': {
                    minlength: 8
                },
                'user[password_confirmation]': {
                    equalTo: '#user_password'
                }
            }
        });
    });
}

$( document ).on('turbolinks:load', function() {
    validate_setup();
});
