import 'package:flutter/cupertino.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.text, required this.callbackFunction}) : super(key: key);
  final String text;
  final VoidCallback callbackFunction;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.activeGreen,
      onPressed: widget.callbackFunction,
      child: Text(widget.text),
    );
  }
}
