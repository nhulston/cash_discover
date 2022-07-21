import 'package:cash_discover/components/coupon_widget.dart';
import 'package:cash_discover/components/custom_button.dart';
import 'package:cash_discover/pages/coupons_page.dart';
import 'package:flutter/cupertino.dart';
import '../models/coupon.dart';
import '../style/style.dart';
import '../components/marker_widget.dart';

class CouponGrid extends StatefulWidget {
  const CouponGrid({Key? key, required this.page, required this.markerSelected, required this.allMarkers, required this.setToDiscover}) : super(key: key);
  final Pages page;
  final MarkerTypes markerSelected;
  final bool allMarkers;
  final VoidCallback setToDiscover;

  @override
  State<CouponGrid> createState() => CouponGridState();
}

class CouponGridState extends State<CouponGrid> {

  CouponGridState() {
    Coupon.getData(); //this should be called once we add the final field in firebase
  }

  static Set<Coupon> myCoupons = {};
  static Set<Coupon> discoverCoupons = Coupon.coupons.toSet();

  @override
  Widget build(BuildContext context) {
    if (widget.page == Pages.myCouponsPage && Coupon.myCoupons.isEmpty) {
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
          Style.p('Your coupon list is empty.\nAdd some from the discover page!'),
          const SizedBox(height: 90),
          CustomButton(
              text: 'Discover',
              callback: widget.setToDiscover
          ),
        ],
      );
    }

    List<CouponWidget> visibleCoupons;
    if (widget.page == Pages.myCouponsPage) {
      List<Coupon> myCoupons = Coupon.myCoupons.toList();
      visibleCoupons = List.generate(myCoupons.length, (index) {
        return CouponWidget(
            coupon: myCoupons[index],
            updateParentCallback: () {
              setState(() {});
            },
            page: widget.page,
        );
      });
    } else {
      visibleCoupons = [];
      for (Coupon c in Coupon.coupons) {
        if (!c.isOwned() &&
            ((c.marker == widget.markerSelected) || widget.allMarkers)) {
          visibleCoupons.add(
              CouponWidget(
                coupon: c,
                updateParentCallback: () {
                  setState(() {});
                },
                page: widget.page,
              )
          );
        }
      }
    }
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: visibleCoupons,
    );
  }
}
