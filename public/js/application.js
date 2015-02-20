$(document).ready(function() {

  $('#login_form').hide(function(){
    $('.login_section button').on('click', function(){
      $('#login_form').slideToggle();
    });
  });

  $('#register_form').hide(function(){
    $('.register_section button').on('click', function(){
      $('#register_form').slideToggle();
    });
  });

  $('.rate_form').hide(function(){
    $('.rate_section button').on('click', function() {
      $('.rate_form').slideToggle();
    });
  });

  $('.photo_div img').draggable({helper: 'clone'});

  $('.playground_section').droppable({
    accept: '.photo_div img',
    drop: function(event, ui){
      $(this).append($(ui.draggable).clone());
    }
  });

  $('#hide').click(function(){
    $('.playground_section').hide();
    $('#show').show();
  });

  $('#show').click(function(){
    $('.playground_section').show();
  });

    bindEvents();
  });

  function bindEvents() {
    $('.playground_section').on('click', 'img', pullUpProfile);
  }

    function pullUpProfile(event){

      event.preventDefault();
      var id = $(this).attr('id');

      var ajaxProfile = $.ajax({
        url: '/dogs/' + id,
        type: 'get'
      });

        ajaxProfile.done(function(data){

          $('.list').remove();
          $('.profile_show').append(data);
        });


    // function newRating(event){
    //   alert("here!");
    //   event.preventDefault();
    //   console.log($(this).serialize());

    //   var ajaxRating = $.ajax({
    //     url: '/dogs/' + id,
    //     type: 'post',
    //     dataType: 'json',
    //     data: $(this).serialize()
    //   });
    // }



}
