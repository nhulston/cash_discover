import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

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
                      child: const Icon(CupertinoIcons.arrow_back
                          //size: 30,
                          //color: Style.primary,
                          ),
                    ),
                    Style.h1(widget.title),
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
