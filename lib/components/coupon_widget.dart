import 'dart:math';
import 'package:cash_discover/models/coupon.dart';
import 'package:cash_discover/style/style.dart';
import 'package:flutter/material.dart';
import 'package:cash_discover/pages/coupon_details_page.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({Key? key, required this.coupon}) : super(key: key);
  final Coupon coupon;

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      //height: sideLength,
      //width: sideLength,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: Style.darkGray,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CouponDetailsPage(coupon: widget.coupon)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: min(
                    MediaQuery.of(context).size.height / 25,
                    MediaQuery.of(context).size.width / 12,
                  ),
                  backgroundColor: widget.coupon.bgColor,
                  child: Image.asset('assets/stores/${widget.coupon.image}',width: 45),
                ),
                const Spacer(),
                Style.couponHeader(widget.coupon.description),
                Style.couponParagraph(widget.coupon.merchantName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
