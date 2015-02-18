$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#login_form').hide(function(){
    $('.login_section button').on('click', function(){
      $('#login_form').slideToggle();
    })
  })


  $('#register_form').hide(function(){
    $('.register_section button').on('click', function(){
      $('#register_form').slideToggle();
    })
  })

  $('.photo_div img').draggable();
  $('.playground_section').droppable({
    drop: function() {
      alert("dropped!!!!");
    }
  });

  // $('.photo_div img').draggable({helper: 'clone'});

  // $('.playground_section').droppable({
  //   accept: '.photo_div img',
  //   drop: function(event, ui){
  //     alert("Item was dropped!!!");
  //     $(this).append($(ui.draggable).clone());
  //   }
  // });


});
