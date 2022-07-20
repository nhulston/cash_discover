import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/marker_widget.dart';

class Coupon {
  String merchantName;
  String couponCode;
  String description;
  DateTime expiration;
  String image;
  Color bgColor;
  MarkerTypes marker;

  Coupon(
    this.merchantName,
    this.couponCode,
    this.description,
    this.expiration,
    this.image,
    this.bgColor,
    this.marker,
  );

  bool isOwned() {
    return myCoupons.contains(this);
  }

  removeFromOwned() {
    myCoupons.remove(this);
  }

  static List<Coupon> coupons = [
    Coupon('Brick Pizza', 'PIZZA', '10% Off All Pizzas', DateTime(2022, 8, 15), 'pizza.png', Colors.blueAccent, MarkerTypes.restaurant),
    Coupon('Sunny Skates', 'SUNNY', '\$15 Off Any Board', DateTime(2022, 7, 30), 'skateboard.png', Colors.purpleAccent, MarkerTypes.activity),
    Coupon('Vintage Fashion', 'VINTAGE', '15% Off Any Order', DateTime(2022, 10, 8), 'fashion.png', Colors.green, MarkerTypes.clothes),
    Coupon('All Halal', 'HALAL', 'Free Dessert', DateTime(2022, 10, 8), 'halal.png', Colors.redAccent, MarkerTypes.restaurant),
    Coupon('Fresh Cuts', 'STAYFRESH', '\$5 Off Any Cut', DateTime(2022, 10, 8), 'barber.png', Colors.purpleAccent, MarkerTypes.activity),
    Coupon('Urban Exchange', 'XCHANGE', '\$5 Off Any T-Shirt', DateTime(2022, 10, 8), 'exchange.png', Colors.blueAccent, MarkerTypes.clothes),
    Coupon('Salad Palace', 'FRESH', '\$5 Off Any Salad', DateTime(2022, 10, 8), 'salad.png', Colors.redAccent, MarkerTypes.restaurant),
    Coupon('Rick\'s Climbing', 'CLIMB', 'Kids Climb Free', DateTime(2022, 10, 8), 'climb.png', Colors.green, MarkerTypes.activity),
    Coupon('Coffee Spot', 'TEA', '\$3 Off Any Iced Tea', DateTime(2022, 10, 8), 'coffee.png', Colors.redAccent, MarkerTypes.coffee),
    Coupon('Bagels n\' Brunch', 'BRUNCH', 'Free Fruit', DateTime(2022, 10, 8), 'bagel.png', Colors.deepPurpleAccent, MarkerTypes.bakery),
    Coupon('Burger Stop', 'FRIES', '20% Off Any Order', DateTime(2022, 10, 8), 'burger.png', Colors.blueAccent, MarkerTypes.restaurant),
    Coupon('Avocado Shop', 'BOWL', '\$5 Off Any Bowl', DateTime(2022, 10, 8), 'avocado.png', Colors.redAccent, MarkerTypes.restaurant),
    Coupon('Ramen Truck', 'SUSHI', '10% Off All Sushis', DateTime(2022, 10, 8), 'ramen.png', Colors.green, MarkerTypes.restaurant),
    Coupon('Frozen Custard', 'FROZEN', '1 Scoop Free', DateTime(2022, 10, 8), 'ice-cream.png', Colors.purpleAccent, MarkerTypes.restaurant),
    Coupon('Super Spa', 'SUPER', '\$10 Off Any Massage', DateTime(2022, 10, 8), 'spa.png', Colors.blueAccent, MarkerTypes.activity),
  ];

  static Set<Coupon> myCoupons = {};
}