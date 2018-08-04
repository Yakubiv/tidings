ready = ->
  $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id')

$(document).ready(ready)
$(document).on('turbolinks:load', ready)

$(document).on 'turbolinks:load', ->
  $('.c-cards').masonry
    itemSelector: '.c-card-box',
    horizontalOrder: true
