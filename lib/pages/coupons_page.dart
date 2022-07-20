import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/components/sliding_segment_text.dart';
import 'package:cash_discover/pages/map_page.dart';
import 'package:cash_discover/style/style.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
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
  int? currentPage = 0;
  CustomSegmentedController<int> controller = CustomSegmentedController();

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
                const SizedBox(height: 20),
                Material(
                  color: Colors.transparent,
                  child: CustomSlidingSegmentedControl<int>(
                    controller: controller,
                    decoration: BoxDecoration(
                      color: Style.darkGray,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    thumbDecoration: BoxDecoration(
                      color: Style.gray,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    children: const {
                      0: SlidingSegmentText(text: 'My Coupons'),
                      1: SlidingSegmentText(text: 'Discover'),
                    },
                    onValueChanged: (newValue) {
                      setState(() {
                        page = newValue == 0 ? Pages.myCouponsPage : Pages.discoverCouponsPage;
                      });
                    },
                  ),
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.map_pin_ellipse),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => MapPage(updateParentState: () {
                          setState(() {});
                        })
                      ),
                    );
                  }
                ),
                CouponGrid(
                  page: page,
                  setToDiscover: () {
                    setState(() {
                      page = Pages.discoverCouponsPage;
                      controller.value = 1;
                    });
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
