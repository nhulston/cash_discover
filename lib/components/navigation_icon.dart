import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({Key? key, required this.icon, required this.callback}) : super(key: key);
  final IconData icon;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
      onPressed: callback,
      child: Icon(
        icon,
        color: Style.primary,
        size: 35,
      ),
    );
  }
}
