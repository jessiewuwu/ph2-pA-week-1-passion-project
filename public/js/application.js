$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#login_form').hide(function(){
    $('.login_section').on('click', function(){
      $('#login_form').slideToggle('slow');
    })
  })

  $('#register_form').hide(function(){
    $('.register_section').on('click', function(){
      $('#register_form').slideToggle('slow');
    })
  })


});
