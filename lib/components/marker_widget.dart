import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MarkerTypes {
  activity,
  bakery,
  clothes,
  coffee,
  restaurant,
}

class MarkerWidget {
  static int idCount = 0;
  static late BitmapDescriptor activityMarker;
  static late BitmapDescriptor bakeryMarker;
  static late BitmapDescriptor clothesMarker;
  static late BitmapDescriptor coffeeMarker;
  static late BitmapDescriptor restaurantMarker;
  static void init() async {
    activityMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/markers/activity.png');
    bakeryMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/markers/bakery.png');
    clothesMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/markers/clothes.png');
    coffeeMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/markers/coffee.png');
    restaurantMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/markers/restaurant.png');
  }

  static Marker getMarker(position, title, description, image, color, id, callback, markerType) {
    idCount++;

    BitmapDescriptor marker = activityMarker;
    switch (markerType) {
      case MarkerTypes.bakery: { marker = bakeryMarker; }
      break;
      case MarkerTypes.clothes: { marker = clothesMarker; }
      break;
      case MarkerTypes.coffee: { marker = coffeeMarker; }
      break;
      case MarkerTypes.restaurant: { marker = restaurantMarker; }
      break;
    }
    return Marker(
      icon: marker,
      markerId: MarkerId(idCount.toString()),
      position: position,
      onTap: () {
        callback(title, description, image, color, id);
      },
      infoWindow: InfoWindow(
        title: title,
      ),
    );
  }
}