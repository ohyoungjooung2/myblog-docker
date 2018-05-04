document.addEventListener('turbolinks:load', function() {
        tinymce.remove();
        tinymce.init(config);
});
