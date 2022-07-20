import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';

class SlidingSegmentText extends StatelessWidget {
  const SlidingSegmentText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(
          color: Style.primary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
