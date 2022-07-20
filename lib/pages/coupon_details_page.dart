import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/style/style.dart';
import 'package:cash_discover/models/coupon.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
                        child: Image.asset(
                            'assets/stores/${widget.coupon.image}',
                            width: 65),
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
                AnimatedContainer(
                  //height: sideLength,
                  //width: sideLength,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Material(
                    color: Style.background,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        CouponGridState.myCoupons.add(widget.coupon);
                        setState(() {});
                      },
                      child: Container(
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
                                  Style.couponCode(widget.coupon.couponCode),
                                  SizedBox(height: 16),
                                  Style.couponCodeSub(
                                      'Click to Save in My Coupons'),
                                  //Style.couponCodeSub('My Coupons'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 70),
                    Icon(
                      Icons.access_time_outlined,
                      size: 25,
                      color: Style.lightGray,
                    ),
                    SizedBox(width: 40),
                    Style.couponDetails('Expires in 2 Months'),
                    SizedBox(height: 40),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 70),
                    Icon(
                      Icons.location_on_outlined,
                      size: 25,
                      color: Style.lightGray,
                    ),
                    SizedBox(width: 40),
                    Style.couponDetails('300 ft Away'),
                    SizedBox(height: 40),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 70),
                    Icon(
                      Icons.money_outlined,
                      size: 25,
                      color: Style.lightGray,
                    ),
                    SizedBox(width: 40),
                    Style.couponDetails('Min. Purchase of \$5'),
                    SizedBox(height: 40),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 70),
                    Icon(
                      Icons.play_arrow,
                      size: 25,
                      color: Style.lightGray,
                    ),
                    SizedBox(width: 40),
                    Style.couponDetails('Not Stackable'),
                    SizedBox(height: 40),
                  ],
                ),
                SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Material(
                    color: Style.darkGray,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Style.darkGray,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 16,
                              child: Container(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          QrImage(
                                            data: widget.coupon.couponCode,
                                            version: QrVersions.auto,
                                            size: 200.0,
                                            foregroundColor: Style.primary,
                                          ),
                                          Style.couponDetails(
                                              'Present to Merchant'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code,
                              size: 120,
                              color: Style.lightGray,
                            ),
                            //Style.couponHeader(widget.coupon.description),
                            Style.couponParagraph('Show at Checkout'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
