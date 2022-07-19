import 'package:cash_discover/components/coupon_widget.dart';
import 'package:cash_discover/pages/coupons_page.dart';
import 'package:flutter/cupertino.dart';

import '../models/coupon.dart';
import '../style/style.dart';

class CouponGrid extends StatefulWidget {
  const CouponGrid({Key? key, required this.page, required this.setToDiscover}) : super(key: key);
  final Pages page;
  final VoidCallback setToDiscover;

  @override
  State<CouponGrid> createState() => _CouponGridState();
}

class _CouponGridState extends State<CouponGrid> {
  List<Coupon> myCoupons = [];
  List<Coupon> discoverCoupons = [
    Coupon('Brick Pizza', '', 'PIZZA', CouponTypes.percentage, 10, '10% Off All Pizzas', DateTime(2022, 8, 15)),
    Coupon('Sunny Skate Shop', '', 'SUNNY', CouponTypes.fixed, 15, '\$15 Off Any Skateboard', DateTime(2022, 7, 30)),
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.page == Pages.myCouponsPage && myCoupons.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 75),
          Image.asset(
            'assets/images/coupon.png',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          const SizedBox(height: 40),
          Style.h1('No coupons yet'),
          const SizedBox(height: 10),
          Style.p('Your coupon list is empty.\nAdd one from the discover page'),
          const SizedBox(height: 90),
          CupertinoButton(
            onPressed: widget.setToDiscover,
            child: const Text('Discover'),
          ),
        ],
      );
    }

    List<Coupon> currentCoupons =
      widget.page == Pages.myCouponsPage
      ? myCoupons
      : discoverCoupons;
    return GridView.count(
      mainAxisSpacing: 9,
      crossAxisSpacing: 9,
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(currentCoupons.length, (index) {
        return CouponWidget(coupon: currentCoupons[index]);
      }),
    );
  }
}
