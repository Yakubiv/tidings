ready = ->
  $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id')

$(document).ready(ready)
$(document).on('turbolinks:load', ready)

$(document).on 'turbolinks:load', ->
  $('.c-cards').masonry
    itemSelector: '.c-card-box',
    horizontalOrder: true

$(document).on 'turbolinks:load', ->
  $('#post_back_post').autocomplete({
    source: $('#post_back_post').data('autocomplete-source')
  })
  $('#post_next_post').autocomplete({
    source: $('#post_next_post').data('autocomplete-source')
  })
