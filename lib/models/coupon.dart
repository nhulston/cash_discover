import 'package:flutter/material.dart';

class Coupon {
  String merchantName;
  String couponCode;
  String description;
  DateTime expiration;
  String image;
  Color bgColor;

  Coupon(
    this.merchantName,
    this.couponCode,
    this.description,
    this.expiration,
    this.image,
    this.bgColor,
  );

  static List<Coupon> coupons = [
    Coupon('Brick Pizza', 'PIZZA', '10% Off All Pizzas', DateTime(2022, 8, 15), 'pizza.png', Colors.blueAccent),
    Coupon('Sunny Skates', 'SUNNY', '\$15 Off Any Board', DateTime(2022, 7, 30), 'skateboard.png', Colors.purpleAccent),
    Coupon('Vintage Fashion', 'VINTAGE', '15% Off Any Order', DateTime(2022, 10, 8), 'fashion.png', Colors.green),
    Coupon('All Halal', 'HALAL', 'Free Dessert', DateTime(2022, 10, 8), 'halal.png', Colors.redAccent),
    Coupon('Fresh Cuts', 'STAYFRESH', '\$5 Off Any Cut', DateTime(2022, 10, 8), 'barber.png', Colors.purpleAccent),
    Coupon('Urban Exchange', 'XCHANGE', '\$5 Off Any T-Shirt', DateTime(2022, 10, 8), 'exchange.png', Colors.blueAccent),
    Coupon('Salad Palace', 'FRESH', '\$5 Off Any Salad', DateTime(2022, 10, 8), 'salad.png', Colors.redAccent),
    Coupon('Rick''s Climbing', 'CLIMB', 'Kids Climb Free', DateTime(2022, 10, 8), 'climb.png', Colors.green),
    Coupon('Coffee Spot', 'TEA', '\$3 Off Any Iced Tea', DateTime(2022, 10, 8), 'coffee.png', Colors.redAccent),
    Coupon('Bagels n\' Brunch', 'BRUNCH', 'Free Fruit', DateTime(2022, 10, 8), 'bagel.png', Colors.deepPurpleAccent),
    Coupon('Burger Stop', 'FRIES', '20% Off Any Order', DateTime(2022, 10, 8), 'burger.png', Colors.blueAccent),
    Coupon('Avocado Shop', 'BOWL', '\$5 Off Any Bowl', DateTime(2022, 10, 8), 'avocado.png', Colors.redAccent),
    Coupon('Ramen Truck', 'SUSHI', '10% Off All Sushis', DateTime(2022, 10, 8), 'ramen.png', Colors.green),
    Coupon('Frozen Custard', 'FROZEN', '1 Scoop Free', DateTime(2022, 10, 8), 'ice-cream.png', Colors.purpleAccent),
    Coupon('Super Spa', 'SUPER', '\$10 Off Any Massage', DateTime(2022, 10, 8), 'spa.png', Colors.blueAccent),
  ];
}