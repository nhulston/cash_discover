import 'package:cash_discover/style/style.dart';
import 'package:flutter/material.dart';

class FilterBox extends StatefulWidget {
  const FilterBox({Key? key, required this.text, required this.icon, required this.index, required this.selectedIndex, required this.callback}) : super(key: key);

  final String text;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final VoidCallback callback;

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: widget.index == widget.selectedIndex ? Colors.white12 : Style.darkGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon),
              const SizedBox(height: 10),
              Text(
                widget.text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}