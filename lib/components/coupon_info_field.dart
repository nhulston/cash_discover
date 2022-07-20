import 'package:flutter/cupertino.dart';

import '../style/style.dart';

class CouponInfoField extends StatelessWidget {
  const CouponInfoField({Key? key, required this.text, required this.icon}) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 70),
        Icon(
          icon,
          size: 25,
          color: Style.lightGray,
        ),
        const SizedBox(width: 40),
        Style.couponDetails(text),
        const SizedBox(height: 35),
      ],
    );
  }
}
