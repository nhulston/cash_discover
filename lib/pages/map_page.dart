import 'package:cash_discover/components/marker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/coupon.dart';
import '../style/style.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.updateParentState}) : super(key: key);

  final VoidCallback updateParentState;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _googleMapController;

  late BitmapDescriptor mapMarker;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/stores/marker.png');
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    MarkerWidget.init();
  }

  @override
  void dispose() {
    MarkerWidget.idCount = 0;
    popupVisible = false;
    _googleMapController.dispose();
    super.dispose();
  }

  static const _initialCameraPos = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 15,
  );

  Set<Marker> markers = {};
  static bool saveVisible = true;
  static bool popupVisible = false;

  late String currentTitle;
  late String currentDesc;
  late int currentID;
  late String currentImg;
  late Color currentColor;

  static List<LatLng> locations = [
    const LatLng(37.778972, -122.430297),
    const LatLng(37.780572, -122.428297),
    const LatLng(37.782572, -122.430347),
    const LatLng(37.782572, -122.430347),
    const LatLng(37.781572, -122.433147),
    const LatLng(37.772972, -122.432197),
    const LatLng(37.776192, -122.433397),
    const LatLng(37.774232, -122.434997),
    const LatLng(37.772752, -122.428597),
    const LatLng(37.776152, -122.426397),
    const LatLng(37.770562, -122.429797),
    const LatLng(37.765562, -122.430797),
    const LatLng(37.763562, -122.433797),
    const LatLng(37.761562, -122.427797),
    const LatLng(37.759562, -122.423797),
  ];

  @override
  Widget build(BuildContext context) {
    updatePopup(title, desc, img, color, id) {
      setState(() {
        currentTitle = title;
        currentDesc = desc;
        currentImg = img;
        currentColor = color;
        currentID = id;
        popupVisible = true;
        saveVisible = true;
      });
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Style.h1('Explore'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
            widget.updateParentState();
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
                  for (int i = 0; i < locations.length; i++) {
                    markers.add(
                      MarkerWidget.getMarker(
                        locations[i],
                        Coupon.coupons[i].merchantName,
                        Coupon.coupons[i].description,
                        Coupon.coupons[i].image,
                        Coupon.coupons[i].bgColor,
                        i,
                        updatePopup,
                      )
                    );
                  }
                });
              }
            },
            markers: markers,
          ),
          Positioned(
            left: 20,
            top: 110,
            child: FloatingActionButton(
              onPressed: () => _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPos)),
              child: const Icon(Icons.center_focus_strong),
            ),
          ),
          if (popupVisible) Positioned(
            left: 30,
            right: 30,
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Style.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: currentColor,
                      child: Image.asset('assets/stores/$currentImg', width: 35),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Style.mapTitle(currentTitle),
                        Style.mapDescription(currentDesc),
                      ],
                    ),
                    const Spacer(),
                    saveVisible ? CupertinoButton(
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 16,
                            color: Style.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            saveVisible = false;
                            Coupon.myCoupons.add(Coupon.coupons[currentID]);
                          });
                        }
                    ) : const Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: Icon(
                        CupertinoIcons.checkmark_alt_circle_fill,
                        color: Style.green,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
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