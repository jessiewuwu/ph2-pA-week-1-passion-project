$(document).ready(function() {
    bindEvents();
  });

  ImageResizer = {
    shrinkImage: function(clone) {
      var dogImage = clone[0].getElementsByTagName("img")[0];
      var currW = dogImage.width;
      var currH = dogImage.height;

      var newSize = scaleSize(130, 130, currW, currH);

      function scaleSize(maxW, maxH, currW, currH){

        var ratio = currH / currW;

        if(currW >= maxW && ratio <= 1){
          currW = maxW;
          currH = currW * ratio;
        } else if(currH >= maxH){
          currH = maxH;
          currW = currH / ratio;
        }

        return [currW, currH];
      }

      dogImage.setAttribute("style", "width:"+ newSize[0] + "px;" + "height:" + newSize[1]+"px;");

      return dogImage
    }
  }

  function bindEvents() {

  $('#search_form').on('submit', getSearchResults);

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
        var clone = $(ui.draggable).clone();
        $(this).append(ImageResizer.shrinkImage(clone));
        $('.favorite-button').css('display','block').show();

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
      var id = $(this).data('dog-id');

      var ajaxProfile = $.ajax({
        url: '/dogs/' + id,
        type: 'get'
      });

        ajaxProfile.done(function(data){

          $('.list').remove();
          $('.profile_show').append(data);
          $('.blacken').attr("background", "black")
          $('.blacken').attr("opacity", ".7")
          $('.profile_show').dialog({width:'1240', height: '700'});
        });


}

var getSearchResults = function(event){
  event.preventDefault();
  var formData = $(this).serialize();
  console.log(formData)
  $.ajax({
    url: '/search',
    type: 'post',
    data: formData,
  })
  .done(function(serverData) {
    for (var i in serverData) {
      var id = serverData[i]["id"];
      var name = serverData[i]["name"];
      var breed = serverData[i]["breed"];
      var gender = serverData[i]["gender"];
      var image_link = serverData[i]["image_link"];
      // <img src="direct_url">
      var imgTag = "<img src='"+image_link+"'style='max-width: 350px; max-height: 500px'>"
      var aTag = "<a href='/dogs/" + id + "'>Click here to see their ratings</a>"
      var infoTag = "<span class='search_results'>"+ name +
       "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; " +breed +
      "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; " + gender +
      "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; " + aTag +
      "</span><br><br>";
      $('.search_container').append(imgTag, infoTag)
    }
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

}
