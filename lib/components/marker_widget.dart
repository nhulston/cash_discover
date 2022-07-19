import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerWidget {
  static int idCount = 0;
  static late BitmapDescriptor mapMarker;
  static void init() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/marker.png');
  }

  static Marker getMarker(position, title, description) {
    idCount++;
    return Marker(
      icon: mapMarker,
      markerId: MarkerId(idCount.toString()),
      position: position,
      infoWindow: InfoWindow(
        title: idCount.toString(),
        snippet: description,
      )
    );
  }
}