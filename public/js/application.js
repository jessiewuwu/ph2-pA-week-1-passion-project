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
  $('.crazy_section').on('click', randomDog);

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


  $('#hide').click(function(){
    $('.playground_section').hide();
    $('#show').show();
  });

  $('#show').click(function(){
    $('.playground_section').show();
  });

  $('.playground_section').on('click','img', pullUpProfile);

  $('button#show_browse').on('click', function(){
    alert('clicked');
    $('.browse_list').css("display", "inline");
  });
}



var pullUpProfile = function(event){
    event.preventDefault();
    var id = $(this).data('dog-id');

    var ajaxProfile = $.ajax({
      url: '/dogs/' + id,
      type: 'get'
    });
    ajaxProfile.done(function(data){
      $('.list').remove();
      $('.profile_show').append(data);
          // $('.blacken').attr("background", "black")
          // $('.blacken').attr("opacity", ".7")
      // $('.ui-dialog').css('z-index', 9999);
      // $('.browse_list').hide();
      $('.profile_show').dialog({width:'1240', height: '700'});
        });
      $('.profile_show').dialog( "moveToTop" );
      // $('.ui-dialog').first().css('z-index', '9999');      // $('.profile_show').css('z-index', '9999');
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
      var imgTag = "<img src=' "+ image_link + "'style='padding-top: 90px; max-width: 350px; max-height: 400px'>"
      var aTag = "<a href='/dogs/" + id + "'><br>Click here to see their ratings</a>"
      var infoTag = "<p class='search_results'>"+ name +
      "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; " + breed +
      "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; " + gender + aTag +
      "</p><br><br>";
      $('.playground_section').hide();
      $('.browse_list').hide();
      $('.search_section').empty();
      $('.search_section').append(imgTag, infoTag);
      $('.search_section').append("<button id='show_browse'>Browse</button>");
    }
  })
.fail(function() {
  console.log("error");
})
.always(function() {
  console.log("complete");
});

}


  var randomDog = function() {

    var images = ['http://tobystereo.com/wp-content/uploads/2014/05/VVBatchExportergiphy_dog.gif', 'http://24.media.tumblr.com/tumblr_ma2dhq2hsu1qkb04po1_500.gif', 'https://31.media.tumblr.com/d59648a7c875658955dbf9aeab7a8059/tumblr_inline_n0rlqc38vl1s0subn.gif', 'https://33.media.tumblr.com/d2c8354c4159407804910207dc13c9eb/tumblr_n3hgaa9wmz1so0ukuo1_500.gif', 'https://31.media.tumblr.com/25ec1da1ceb3d8c59ff61abda466e66d/tumblr_mqpocpPXk01rtd1nko2_500.gif', 'https://33.media.tumblr.com/4fbb61f48f4c5cfa451a88e14f6579e7/tumblr_mwwh9w2vJf1s6294bo1_400.gif', 'http://24.media.tumblr.com/6c964b25e6e545e116d7062278979b65/tumblr_msy9f60uGy1qcdozto1_r3_500.gif', 'http://media.giphy.com/media/cdnHZOmT7y1Jm/giphy.gif', 'http://media.giphy.com/media/omuVatiGBMBIQ/giphy.gif', 'http://media.giphy.com/media/1snUe9sDi9R2U/giphy.gif', 'http://media.giphy.com/media/2EJRTwQPrYju0/giphy.gif']

    var randomImage = images[Math.floor(Math.random()*images.length)]

    var randomAxis = Math.floor(Math.random()*1000)
    var marginTopRandom = Math.floor(Math.random()*500)

    $('.crazy_section').append("<img src='" + randomImage + "' width='200'>");
    $('.crazy_section img').last().css('left', randomAxis +'px')
    $('.crazy_section img').last().css('margin-top', marginTopRandom + 'px')


 };

// <img src='' width='150' top='200' left='500'>