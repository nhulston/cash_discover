import 'package:cash_discover/components/coupon_grid.dart';
import 'package:cash_discover/components/filter_box.dart';
import 'package:cash_discover/components/sliding_segment_text.dart';
import 'package:cash_discover/pages/map_page.dart';
import 'package:cash_discover/style/style.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/marker_widget.dart';

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
  bool allMarkers = true;
  CustomSegmentedController<int> controller = CustomSegmentedController();
  MarkerTypes markCat = MarkerTypes.restaurant;
  static const padding = 20.0;

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    filterCallback(value) {
      return () {
        setState(() {
          selected = value;
          allMarkers = false;
          if (value == 0){
            allMarkers = true;
          } else if (value == 1) {
            markCat = MarkerTypes.restaurant;
          } else if (value == 2) {
            markCat = MarkerTypes.activity;
          } else if (value == 3) {
            markCat = MarkerTypes.clothes;
          } else if (value == 4) {
            markCat = MarkerTypes.coffee;
          } else if (value == 5) {
            markCat = MarkerTypes.bakery;
          }
        });
      };
    }

    return CupertinoPageScaffold(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Style.h1('Coupons'),
                    const Spacer(),
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
                        page = newValue == 0
                            ? Pages.myCouponsPage
                            : Pages.discoverCouponsPage;
                      });
                    },
                  ),
                ),
                if (page == Pages.discoverCouponsPage) const SizedBox(height: 30),
                if (page == Pages.discoverCouponsPage) SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterBox(text: 'All', icon: CupertinoIcons.list_bullet, index: 0, selectedIndex: selected, callback: filterCallback(0)),
                      const SizedBox(width: padding / 2),
                      FilterBox(text: 'Restaurants', icon: Icons.restaurant, index: 1, selectedIndex: selected, callback: filterCallback(1)),
                      const SizedBox(width: padding / 2),
                      FilterBox(text: 'Things to Do', icon: CupertinoIcons.tickets_fill, index: 2, selectedIndex: selected, callback: filterCallback(2)),
                      const SizedBox(width: padding / 2),
                      FilterBox(text: 'Shopping', icon: Icons.shopping_bag_rounded, index: 3, selectedIndex: selected, callback: filterCallback(3)),
                      const SizedBox(width: padding / 2),
                      FilterBox(text: 'Coffee', icon: Icons.coffee_rounded, index: 4, selectedIndex: selected, callback: filterCallback(4)),
                      const SizedBox(width: padding / 2),
                      FilterBox(text: 'Bakeries', icon: Icons.bakery_dining_rounded, index: 5, selectedIndex: selected, callback: filterCallback(5)),
                    ],
                  ),
                ),
                if (page == Pages.discoverCouponsPage) const SizedBox(height: 30),
                if (page == Pages.discoverCouponsPage) GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Style.h2('Near You'),
                      const Icon(Icons.arrow_forward_ios, color: Style.lightGray, size: 18),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => MapPage(updateParentState: () {
                            setState(() {});
                          }
                          )
                      ),
                    );
                  },
                ),
                SizedBox(height: page == Pages.discoverCouponsPage ? 15 : 30),
                CouponGrid(
                    page: page,
                    markerSelected: markCat,
                    allMarkers: allMarkers,
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
