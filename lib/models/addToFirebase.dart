// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../firebase_options.dart';
//
// class Coupon {
//   String merchantName;
//   String couponCode;
//   String description;
//   DateTime expiration;
//   String image;
//
//   Coupon(this.merchantName,
//       this.couponCode,
//       this.description,
//       this.expiration,
//       this.image,);
// }
//
// CollectionReference coupons_db = FirebaseFirestore.instance.collection('coupons');
//
// Future<void> addCoupon(Coupon coupon) {
//   // Call the user's CollectionReference to add a new user
//   return coupons_db
//       .add({
//     'category': coupon.couponCode, // John Doe
//     'company': coupon.merchantName, // Stokes and Sons
//     'date': coupon.expiration, // 42
//     'discount': coupon.description
//   })
//       .then((value) => print("Coupon Added"))
//       .catchError((error) => print("Failed to add coupon: $error"));
// }
//
// List<Coupon> coupons = [
//   Coupon('Sunny Skates', 'SUNNY', '\$15 Off Any Board', DateTime(2022, 7, 30), 'skateboard.png'),
//   Coupon('Vintage Fashion', 'VINTAGE', '15% Off Any Order', DateTime(2022, 10, 8), 'fashion.png'),
//   Coupon('All Halal', 'HALAL', 'Free Dessert', DateTime(2022, 10, 8), 'halal.png'),
//   Coupon('Fresh Cuts', 'STAYFRESH', '\$5 Off Any Cut', DateTime(2022, 10, 8), 'barber.png'),
//   Coupon('Urban Exchange', 'XCHANGE', '\$5 Off Any T-Shirt', DateTime(2022, 10, 8), 'exchange.png'),
//   Coupon('Salad Palace', 'FRESH', '\$5 Off Any Salad', DateTime(2022, 10, 8), 'salad.png'),
//   Coupon('Rick\'s Climbing', 'CLIMB', 'Kids Climb Free', DateTime(2022, 10, 8), 'climb.png'),
//   Coupon('Coffee Spot', 'TEA', '\$3 Off Any Iced Tea', DateTime(2022, 10, 8), 'coffee.png'),
//   Coupon('Bagels n\' Brunch', 'BRUNCH', 'Free Fruit', DateTime(2022, 10, 8), 'bagel.png'),
//   Coupon('Burger Stop', 'FRIES', '20% Off Any Order', DateTime(2022, 10, 8), 'burger.png'),
//   Coupon('Avocado Shop', 'BOWL', '\$5 Off Any Bowl', DateTime(2022, 10, 8), 'avocado.png'),
//   Coupon('Ramen Truck', 'SUSHI', '10% Off All Sushis', DateTime(2022, 10, 8), 'ramen.png'),
//   Coupon('Frozen Custard', 'FROZEN', '1 Scoop Free', DateTime(2022, 10, 8), 'ice-cream.png'),
//   Coupon('Super Spa', 'SUPER', '\$10 Off Any Massage', DateTime(2022, 10, 8), 'spa.png'),
// ];
//
// main(){
//   //list
//   print('main entered');
//
//   //traverse through each element of list
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   for(var i=0;i<1;i++){
//     Coupon myCoupon = coupons[i];
//     addCoupon(myCoupon);
//   }
// }

