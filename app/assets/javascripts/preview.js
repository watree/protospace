$(window).on('load', function () {
  $('.js-preview').each(function() {
    var preview = $(this),
        image = preview.find('input[type=file]');
    image.change(function(){
      if (!this.files.length) {
        return;
      }
      var file = this.files[0]
      reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
        preview.css({
          'background-image': 'url(' + reader.result + ')',
          'background-size' : 'cover'
        });
      };
    });
  });
});
