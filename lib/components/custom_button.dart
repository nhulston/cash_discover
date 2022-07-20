import 'package:cash_discover/style/style.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.callback}) : super(key: key);

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Style.gray,
      borderRadius: BorderRadius.circular(100),
      onPressed: callback,
      child: Text(
        text,
        style: const TextStyle(
          color: Style.primary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
