$(document).ready(function() {
    $(document).on('click', '#turnup', function() {
        placeTurnup();
        getTweet();
    })
});

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 2
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
}

function placeTurnup() {

}

function getTweet() {
    $.ajax({
        url: '/tweet',
        type: 'get',
        datatype: 'json'
    }).done(function(tweet) {
        var jaySon = JSON.parse(tweet);
        var myCatlng = new google.maps.LatLng(parseFloat(jaySon.tweet.lat), parseFloat(jaySon.tweet.long));
        console.log(parseFloat(jaySon.tweet.lat));
        console.log(parseFloat(jaySon.tweet.long));
        console.log("here here here");
        console.log(myCatlng);
        placeMarker(myCatlng, "hi");
    })
};