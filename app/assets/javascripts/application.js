$(function() {

 $('a.add_child').live("click", function() {
    var association = $(this).attr('data-association');
    var template = $(this).prev().html();
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    $(this).parent().before(template.replace(regexp, new_id));
    return false;
  });

 $('a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parents('.criterion:first').hide();
    return false;
  });

});
