import 'package:cash_discover/components/style.dart';
import 'package:flutter/cupertino.dart';

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({Key? key, required this.icon, required this.isPrimary}) : super(key: key);
  final IconData icon;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isPrimary ? Style.primary : Style.gray,
      size: isPrimary ? 30 : 25,
    );
  }
}
