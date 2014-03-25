$(document).ready(function() {
    $(document).on('click', '#turnup', function() {
        getTweet();
    })
});

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 4
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
        var jaySon = JSON.parse(tweet);
        var myCatlng = new google.maps.LatLng(parseFloat(jaySon.tweet.lat), parseFloat(jaySon.tweet.long));
        var newMarker = placeMarker(myCatlng, "hi");
        placeTurnup(newMarker, jaySon.tweet.content);
    })
};