$(document).ready(function(){

  //add ajax call to get list of stocks for any wl and populate textfield
  $(".link").click(function(){
    $id = $(this).attr('id');
    $old = $("#stocks").html();
    $("#stocks").load("/stocks/ajax/" + $id, function(){ $("#stocks").append( $old);});
    

  });
});

$(function() {

  $("#clear").click(function () {$("#stocks").html(""); }); 

  //close entries on button clicks
  $(".chart_button").click(function () {$(this).parent().slideUp(); }); 
  $(".rate_button").click(function () {$(this).parent().parent().slideUp(); }); 

  //submit form after enter key pressed on any page
  $("body").keypress(function(event) {
    if (event.which == 13) {
      event.preventDefault();
      $("form").submit();
    }
  });
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
