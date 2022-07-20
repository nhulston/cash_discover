import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({Key? key, required this.text, required this.icon}) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Style.darkGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
