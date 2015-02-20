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
      // alert("Added to the Playground");
      $(this).append($(ui.draggable).clone());
    }
  });

  // $('.playground_section').on('click', 'h1', function(){
  //   $('.playground_section').slideToggle();
  // });
  $('#hide').click(function(){
    $('.playground_section').hide();
    $('#show').show(); // Adell added this line
  });

  $('#show').click(function(){
    $('.playground_section').show();
  });

    bindEvents();
  });
  // when we try to bind to them

  function bindEvents() {
    $('.playground_section').on('click', 'img', pullUpProfile);
    $('.rate_form').on('submit', function(event) {

      event.preventDefault();
      var id = $(this).attr("id")
      // var id = $(this).attr("action").substring(6)
      whatever = {"affectionate": "on"}
      var ajaxRating = $.post('/dogs', { dog: whatever, id: id }, function(data, textStatus, xhr) {

        debugger;
        $('.affectionate').text(data);
      });


      // var ajaxRating = $.ajax({
      //   url: '/dogs/' + id,
      //   type: 'post',
      //   dataType: 'json',
      //   data: $(this).serialize()
      // });
      //   ajaxRating.done(function(data){
      //     var affectionate_count = data.affectionate;
      //     console.log(affectionate_count);
      //   //   $('.affectionate').text("Affectionate: " + )
      //   })

    });
  }

    function pullUpProfile(event){

      event.preventDefault();
      var id = $(this).attr('id');

      var ajaxProfile = $.ajax({
        url: '/dogs/' + id,
        type: 'get'
      });

        ajaxProfile.done(function(data){
          //append the data to the div class to make it show up
          // $('.playground_section').scrollTo('.profile_show');
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
