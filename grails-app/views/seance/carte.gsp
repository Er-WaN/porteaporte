
<%@ page import="fr.ps.porteaporte.Seance"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - <g:message code="seance.list.label"
		args="[entityName]" /></title>
<script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
</head> 
<body>
  <div id="map" style="height: 500px;"></div>

  <script type="text/javascript">
    var locations = [
      ${map}
    ];

    var locations = [
                    <g:each in="${seanceInstanceList}" status="i" var="seanceInstance">
                    "[''"+seanceInstance.dateSeance+"','"+seanceInstance.rue+"']"
                    </g:each>
                   ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: new google.maps.LatLng(48.9265735,2.186558),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();
    var geocoder = new google.maps.Geocoder();

    var marker, i;

    for (i = 0; i < locations.length; i++) {
      geocodeAddress(locations[i]);
    }

function geocodeAddress(location) {
  geocoder.geocode( { 'address': location[1]}, function(results, status) {
  //alert(status);
    if (status == google.maps.GeocoderStatus.OK) {

      //alert(results[0].geometry.location);
      createMarker(results[0].geometry.location,location[0]+"<br>"+location[1]);
    }
    else
    {
      alert("some problem in geocode" + status);
    }
  }); 
}

function createMarker(latlng,html){
  var marker = new google.maps.Marker({
    position: latlng,
    map: map
  }); 

  google.maps.event.addListener(marker, 'mouseover', function() { 
    infowindow.setContent(html);
    infowindow.open(map, marker);
  });
		
  google.maps.event.addListener(marker, 'mouseout', function() { 
    infowindow.close();
  });
}
  </script>
</body>

</html>
