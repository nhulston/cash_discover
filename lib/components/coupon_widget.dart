import 'dart:math';
import 'package:cash_discover/models/coupon.dart';
import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cash_discover/pages/coupon_details_page.dart';

import '../pages/coupons_page.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({Key? key, required this.coupon, required this.updateParentCallback, required this.page}) : super(key: key);
  final Coupon coupon;
  final VoidCallback updateParentCallback;
  final Pages page;

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
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CouponDetailsPage(
                        coupon: widget.coupon,
                        setParentState: widget.updateParentCallback,
                        page: widget.page,
                      ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    if (widget.coupon.isOwned()) CupertinoButton(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Icon(Icons.close_rounded, color: CupertinoColors.destructiveRed),
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return CupertinoAlertDialog(

                              title: const Text('Delete coupon?'),
                              content: const Text(
                                'Are you sure you want to delete this coupon?',
                                style: TextStyle(
                                ),
                              ),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },),
                                CupertinoDialogAction(
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: CupertinoColors.destructiveRed),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.coupon.removeFromOwned();
                                    });
                                    widget.updateParentCallback();
                                    Navigator.of(context).pop();
                                  },),
                              ],
                            );
                          },
                        );
                      }
                    ),
                  ],
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
