function masonry_setup() {
    $('.grid').masonry({
        itemSelector: '.grid-item',
    });
}

$(document).on('turbolinks:load', function() {
    masonry_setup();
});
