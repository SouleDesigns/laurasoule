/**
 * Created by osoule on 12/17/14.
 * Blog post specific functionality
 */

// Global recaptcha setup
var RecaptchaOptions = {theme: 'custom', custom_theme_widget: 'recaptcha_widget'};

// Doc init
$(document).ready(function() {

    var errors = $('#errorExplanation');
    if(errors.length > 0) {
        $('html, body').animate({
            scrollTop: errors.offset().top - 120
        }, 500);
    }

    $('.gravatar img').each(function() { $(this).attr('src', $(this).attr('src') + '&default=identicon');});

    $('#show_blog_post img').each(function(){
        var current = $(this);

        if(!current.parent().is('a'))
        {
            href = current.attr('src');
            figcap = current.parent().find('figcaption');
            title = '';
            if(figcap.length > 0)
                title = figcap.text();
            current.wrap('<a href="' + href + '" rel="prettyPhoto[pp_gal]" title="' + title + '"></a>');
        }
    });
    $("a[rel^='prettyPhoto']").prettyPhoto();

    $('#commentform').validate({
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
