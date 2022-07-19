import 'dart:math';
import 'package:cash_discover/models/coupon.dart';
import 'package:cash_discover/style/style.dart';
import 'package:flutter/material.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({Key? key, required this.coupon}) : super(key: key);
  final Coupon coupon;

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Style.darkGray,
      ),
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
              backgroundImage: const AssetImage('assets/images/pay.jpg'),
            ),
            const Spacer(),
            Style.couponHeader(widget.coupon.description),
            Style.couponParagraph(widget.coupon.merchantName),
          ],
        ),
      ),
    );
  }
}
