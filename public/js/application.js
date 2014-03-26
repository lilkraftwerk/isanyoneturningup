$(document).ready(function() {


    $(document).on('click', '#turnup', function() {
        getTweet();
    })

    $(document).on('click', '#turnloop', function() {
        getTweet();
        turntLoop();
    })
});

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(37.77056, -122.42694),
        zoom: 3
    };
    map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);
image = 'turnip.png';

function placeMarker(position, title) {
    var marker = new google.maps.Marker({
        position: position,
        map: map,
        animation: google.maps.Animation.DROP,
        icon: image,
        title: title
    });
    map.panTo(position);
    return marker;
}

function placeTurnup(marker, content) {
    var infowindow = new google.maps.InfoWindow({
        content: content
    });
    console.log(infowindow);
    $("#tweetbox").html(content);
    google.maps.event.addListener(marker, 'click', function() {
        console.log("sup");
        $("#tweetbox").html(content);
    });
}

function getTweet() {
    $.ajax({
        url: '/tweet',
        type: 'get',
        datatype: 'json'
    }).done(function(tweet) {
        doTweet(tweet)
    })
};

function doTweet(tweet) {
    var jaySon = JSON.parse(tweet);
    var myCatlng = new google.maps.LatLng(parseFloat(jaySon.tweet.lat), parseFloat(jaySon.tweet.long));
    var newMarker = placeMarker(myCatlng, "hi");
    placeTurnup(newMarker, jaySon.tweet.content);
}



looping = null;

function turntLoop() {
    if (!looping) {
        $('#turnloop').html("cancel loop");

        looping = setInterval(function() {
            getTweet()
        }, 4000);
    } else {
        $('#turnloop').html("start loop");
        window.clearInterval(looping);
        looping = null;
    }
}