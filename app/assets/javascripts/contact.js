/**
 * Created by osoule on 12/21/14.
 * Contact specific functionality
 */

// Doc init
$(document).ready(function() {

    var errors = $('#errorExplanation');
    if(errors.length > 0) {
        $('html, body').animate({
            scrollTop: errors.offset().top - 120
        }, 500);
    }

    $('#contactform').validate({
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function (error, element) {
            if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        }
    });

});
