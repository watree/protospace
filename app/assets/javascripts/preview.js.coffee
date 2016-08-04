$(document).on 'ready page:load', ->
  $('.js-preview').each ->
     preview = $(this)
     image = preview.find('input[type=file]')
     image.change ->
      file = this.files[0]
      reader = new FileReader
      reader.readAsDataURL(file)
      reader.onload = ->
        preview.css
          'background-image': 'url(' + reader.result + ')',
          'background-size' : 'cover'
