import 'package:cash_discover/components/coupon_info_field.dart';
import 'package:cash_discover/pages/coupons_page.dart';
import 'package:cash_discover/style/style.dart';
import 'package:cash_discover/models/coupon.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({Key? key, required this.coupon, required this.setParentState, required this.page}) : super(key: key);

  final Coupon coupon;
  final VoidCallback setParentState;
  final Pages page;

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> with SingleTickerProviderStateMixin {
  Color _color = Style.blue;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CupertinoButton(
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
              ),
              Column(
                children: [
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
                  Style.h1(widget.coupon.merchantName),
                ],
              ),
              const SizedBox(height: 30),
              AnimatedContainer(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _color,
                ),
                duration: const Duration(milliseconds: 400),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Coupon.myCoupons.add(widget.coupon);
                    setState(() {
                      _color = CupertinoColors.systemGreen;
                    });
                    widget.setParentState();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Style.couponCode(widget.coupon.couponCode),
                          if (widget.page == Pages.discoverCouponsPage) const SizedBox(height: 16),
                          if (widget.page == Pages.discoverCouponsPage) Style.couponCodeSub(
                              widget.coupon.isOwned() ? 'Coupon successfully saved!' : 'Click to save coupon.'),
                          //Style.couponCodeSub('My Coupons'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Style.h2(widget.coupon.description),
              Column(
                children: const [
                  SizedBox(height: 10),
                  CouponInfoField(text: 'Expires in 2 months', icon: Icons.access_time_outlined),
                  CouponInfoField(text: '300 ft. Away', icon: Icons.location_on_outlined),
                  CouponInfoField(text: 'Min. Purchase of \$5', icon: Icons.monetization_on_outlined),
                  CouponInfoField(text: 'Not Stackable', icon: CupertinoIcons.square_stack_3d_up_fill),
                  SizedBox(height: 30),
                ],
              ),
              if (widget.page == Pages.myCouponsPage) AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Material(
                  color: Style.darkGray,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Style.darkGray,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 16,
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
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
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
              SizedBox(height: widget.page == Pages.myCouponsPage ? 50 : 100),
            ],
          ),
        ),
      ),
    );
  }
}
