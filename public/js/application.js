$(document).ready(function() {
    bindEvents();
  });

  function bindEvents() {

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

    $('.left_column img, .center_column img, .right_column img').draggable({helper: 'clone'});

    $('.playground_section').droppable({
      accept: '.left_column img, .center_column img, .right_column img',
      drop: function(event, ui){
        $(this).append($(ui.draggable).clone());
      }
    });


    $('.playground_section').on('click', 'img', pullUpProfile);


    $('#hide').click(function(){
      $('.playground_section').hide();
      $('#show').show();
    });

    $('#show').click(function(){
      $('.playground_section').show();
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

          $('.list').remove();
          $('.profile_show').append(data);
        });

}
