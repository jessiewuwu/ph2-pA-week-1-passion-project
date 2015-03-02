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

    $('.drag-dog-container').draggable({helper: 'clone'});

    $('.playground_section').droppable({
      accept: '.drag-dog-container',
      drop: function(event, ui){
        $(this).append($(ui.draggable).clone());
        $('.favorite-button').show();
      }
    });

    $('.favorite-button').on('click', function() {
      var favoriteIds = getFavoriteIds();
      var data = { favorite_ids: favoriteIds };
      var ajaxFave = $.ajax ({
        url: '/favorites',
        type: 'post',
        data: data
      });
    });

    function getFavoriteIds() {
      var $dogImgs = $('.playground_section').find('.browse_dog_pic');

      return $dogImgs.map(function() {
        return this.getAttribute('data-dog-id');
      }).toArray();
    }

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
          $('.blacken').attr("background", "black")
          $('.blacken').attr("opacity", ".7")
          $('.profile_show').dialog({width:'1040'});
        });

}
