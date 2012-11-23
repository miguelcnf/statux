/*
 * statux JavaScript
 *
 * Custom javascript to make things work
 */

$("#gamertag").keyup(function(event){
    if(event.keyCode == 13){
        $("#gamertag_button").click();
    }
});

// From http://djpate.com/2009/10/07/animated-scroll-to-anchorid-function-with-jquery/
function goToByScroll(id){
    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
}

function get_gamercard() {
    
    var gamertag = $('#gamertag').val();
    var url="/gamercard/"+gamertag;
    $("#gamercard_container").fadeOut('fast');
    $("#gamercard").empty();
    $.getJSON(url,function(json){
        $("#gamercard").append('<p>Activity: '+json['Data']['OnlineStatus']+'</p>');
        $("#gamercard").append('<p>Gamertag: '+json['Data']['Gamertag']+'</p>');
        $("#gamercard").append('<p>GamerScore: '+json['Data']['GamerScore']+'</p>');
        $("#gamercard").append('<img src="'+json['Data']['AvatarBody']+'" class="avatar">');
        $('#gamercard_container').fadeIn('slow');
    });
}