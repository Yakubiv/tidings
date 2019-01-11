//= require rails-ujs
//= require jquery
//= require activestorage
//= require jquery_ujs
//= require jquery-ui/widgets/autocomplete
//= require bootstrap-datetimepicker.min
//= require autocomplete-rails
//= require popper.min
//= require masonry.pkgd
//= require bootstrap/bootstrap.min
//= require posts
//= require homes
//= require ckeditor/init

//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
    format: 'yyyy-mm-dd hh:ii'
  });
})
