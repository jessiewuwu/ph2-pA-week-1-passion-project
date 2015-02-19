$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
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

  $('.rate_form').hide(function(){
    $('.rate_section button').on('click', function() {
      $('.rate_form').slideToggle();
    })
  })

  $('.photo_div img').draggable({helper: 'clone'});

  $('.playground_section').droppable({
    accept: '.photo_div img',
    drop: function(event, ui){
      // alert("Added to the Playground");
      $(this).append($(ui.draggable).clone());
    }
  });

    bindEvents();
  });
  // when we try to bind to them

  function bindEvents() {
    $('.playground_section').on('click', 'img', pullUpProfile);
  }

    function pullUpProfile(event){
      event.preventDefault();
      var id = $(this).attr('id');

      var ajaxProfile = $.ajax({
        url: '/dogs/' + id,
        type: 'get'
      })

      ajaxProfile.done(function(data){
        console.log(data);
        //append the data to the div class to make it show up
        // $('.playground_section').scrollTo('.profile_show');
        $('.list').remove();
        $('.profile_show').append(data);
      })

  }


