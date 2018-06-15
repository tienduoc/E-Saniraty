$(document).ready(function () {
    // ACTIVE MENU
    $('#tabNavbar li').on("click", function () {
        $('#tabNavbar li').removeClass('active');
        $(this).addClass('active');
    });

    // TOOLTIP
    $('[data-toggle="tooltip"]').tooltip();

    // CAROUSEL AUTO PLAY
    $('.carousel').carousel({
        interval: 3000,
        pause: false
    });

    // DROPDOWN MENU ON HOVER
    $('.dropdown').hover(
        function () {
            $('.dropdown-menu', this).stop().fadeIn('fast');
            $(this).toggleClass('active');
            $(this).toggleClass('open');
        },
        function () {
            $('.dropdown-menu', this).stop().fadeOut('fast');
            $(this).toggleClass('active');
            $(this).toggleClass('open');
        });
});