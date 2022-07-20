import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/style/style.dart';
import 'package:cash_discover/models/coupon.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({Key? key, required this.coupon}) : super(key: key);

  final Coupon coupon;

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> {
  //Pages page = Pages.myCouponDetailsPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Style.primary,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: widget.coupon.bgColor,
                        child: Image.asset('assets/stores/${widget.coupon.image}', width: 65),
                      ),
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Style.h1(widget.coupon.merchantName),
                  ],
                ),
                Center(
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      width: 500,
                      child: Material(
                        color: Style.green,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    CouponGridState.myCoupons.add(widget.coupon);
                                    setState(() {
                                    });
                                  },
                                  child: const Text("Save to My Coupons", style: TextStyle(color: Colors.white))
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Style.h1(''),
                        Style.h1(widget.coupon.description),
                        Style.h1(''),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 20,
                      color: Style.lightGray,
                    ),
                    Style.couponDetails('Expires in 2 months'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.money_outlined,
                      size: 20,
                      color: Style.lightGray,
                    ),
                    Style.couponDetails('Min. purchase of \$5'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 20,
                      color: Style.lightGray,
                    ),
                    Style.couponDetails('Not stackable          '),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
