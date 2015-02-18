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

  // BROWSE page: drag the photo and drop into playground
  $('.photo_div img').draggable({helper: 'clone'});

  $('.playground_section').droppable({
    accept: '.photo_div img',
    drop: function(event, ui){
      // alert("Added to the Playground");
      $(this).append($(ui.draggable).clone());
    }
  });

  // BROWSE page: click the photo in the playground
  $('.playground_section img').on('click', function(){
      var id = $(this);
      console.log(id);
  })


});
