import 'package:cash_discover/components/marker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../style/style.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _googleMapController;

  late BitmapDescriptor mapMarker;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/marker.png');
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    MarkerWidget.init();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  static const _initialCameraPos = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 15,
  );

  static Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Style.h1('Explore'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close_rounded,
            size: 30,
            color: Style.primary,
          ),
        ),
      ),
      child: Stack(
        children: [
          GoogleMap(
            rotateGesturesEnabled: false,
            initialCameraPosition: _initialCameraPos,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) {
              controller.setMapStyle(Utils.mapStyle);
              _googleMapController = controller;

              if (markers.isEmpty) {
                setState(() {
                  markers = {
                    MarkerWidget.getMarker(const LatLng(37.778972, -122.430297), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.780572, -122.428297), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.782572, -122.430347), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.781572, -122.433147), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.772972, -122.432197), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.776192, -122.433397), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.774232, -122.434997), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.772752, -122.428597), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.776152, -122.426397), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.770562, -122.429797), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.765562, -122.430797), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.763562, -122.433797), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.761562, -122.427797), 'title', 'desc'),
                    MarkerWidget.getMarker(const LatLng(37.759562, -122.423797), 'title', 'desc'),
                  };
                });
              }
            },
            markers: markers,
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () => _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPos)),
              child: const Icon(Icons.center_focus_strong),
            ),
          ),
        ],
      )
    );
  }
}

class Utils {
  static String mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.attraction",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.government",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.government",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
  ''';
}