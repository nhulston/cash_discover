import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  static List<Coupon> coupons = [];

  static Set<Coupon> myCoupons = {};

  static CollectionReference couponDB = FirebaseFirestore.instance.collection('coupons');

  static Map<int, Color> colorDic = {0: Colors.blueAccent, 1: Colors.purpleAccent, 2: Colors.green, 3: Colors.redAccent};

  static Map<String, MarkerTypes> markerDic = {'restaurant': MarkerTypes.restaurant, 'activity': MarkerTypes.activity, 'clothes': MarkerTypes.clothes,
  'coffee': MarkerTypes.coffee, 'bakery': MarkerTypes.bakery};

  static Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await couponDB.get();

    final allData = querySnapshot.docs;
    for (var i = 0; i < allData.length; i++){
      var snapshot = allData[i];

      var couponCompany = snapshot.get('company');
      var couponCategory = snapshot.get('category');
      var couponDiscount = snapshot.get('discount');
      var couponDate = snapshot.get('date').toDate();
      var couponImg = snapshot.get('img');
      var couponColor = colorDic[i % 4];
      var couponMarker = markerDic[snapshot.get('marker')];

      Coupon newCoupon = Coupon(couponCompany, couponCategory, couponDiscount, couponDate, couponImg, couponColor!, couponMarker!); //last is placeholer
      coupons.add(newCoupon);
    }
  }

  //function that allows us to add to firebase database
  // static Future<void> addData() async {
  //
  //   for (var i = 0; i < coupons.length; i++) {
  //     Coupon obj = coupons[i];
  //     couponDB.add({
  //       'company': obj.merchantName,
  //       'category': obj.couponCode,
  //       'discount': obj.description,
  //       'date': Timestamp.fromDate(obj.expiration),
  //       'img': obj.image,
  //     });
  //   }
  // }
}