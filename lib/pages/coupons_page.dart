import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/pages/map_page.dart';
import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

enum Pages {
  myCouponsPage,
  discoverCouponsPage,
}

class _CouponsPageState extends State<CouponsPage> {
  Pages page = Pages.myCouponsPage;

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
                    Style.h1('Coupons'),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        size: 30,
                        color: Style.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                      child: const Text('My Coupons'),
                      onPressed: () {
                        setState(() {
                          page = Pages.myCouponsPage;
                        });
                      },
                    ),
                    CupertinoButton(
                      child: const Text('Discover Coupons'),
                      onPressed: () {
                        setState(() {
                          page = Pages.discoverCouponsPage;
                        });
                      },
                    ),
                  ],
                ),
                CouponGrid(
                    page: page,
                    setToDiscover: () {
                      setState(() {
                        page = Pages.discoverCouponsPage;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
