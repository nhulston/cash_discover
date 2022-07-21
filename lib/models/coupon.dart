import 'dart:math';

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
  int id;

  Coupon(
    this.merchantName,
    this.couponCode,
    this.description,
    this.expiration,
    this.image,
    this.bgColor,
    this.marker,
    this.id,
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

  static int dbMadeCall = 0;

  static Map<int, Color> colorDic = {0: Colors.blueAccent, 1: Colors.purpleAccent, 2: Colors.green, 3: Colors.redAccent};

  static Map<String, MarkerTypes> markerDic = {'restaurant': MarkerTypes.restaurant, 'activity': MarkerTypes.activity, 'clothes': MarkerTypes.clothes,
  'coffee': MarkerTypes.coffee, 'bakery': MarkerTypes.bakery};

  static Future<void> getData() async {
    // Get docs from collection reference
    if (dbMadeCall == 0) {
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

        Coupon newCoupon = Coupon(couponCompany, couponCategory, couponDiscount, couponDate, couponImg, couponColor!, couponMarker!, i); // second to last is placeholder
        coupons.add(newCoupon);
      dbMadeCall = 1;}
    }
  }

  static List<int> months = [];
  static List<int> distances = [];
  static void init() {
    var r = Random();
    for (int i = 0; i < 15; i++) {
      months.add(1 + r.nextInt(9));
      distances.add((1 + Random().nextInt(9)) * 100);
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