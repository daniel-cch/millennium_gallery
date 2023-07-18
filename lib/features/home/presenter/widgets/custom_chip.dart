import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.title,
    required this.selected,
  }) : super(key: key);

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.redAccent),
        color: selected ? Colors.redAccent : Colors.transparent,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
