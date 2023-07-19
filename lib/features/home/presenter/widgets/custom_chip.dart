import 'package:flutter/material.dart';
import 'package:millennium_gallery/features/home/home.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.filter,
    required this.selected,
  }) : super(key: key);

  final CharacterFilters filter;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.redAccent),
        color: selected ? Colors.redAccent : Colors.transparent,
      ),
      child: Center(
        child: Icon(
          _getIcon(filter),
          color: selected ? Colors.white : Colors.redAccent,
        ),
      ),
    );
  }

  IconData _getIcon(CharacterFilters filter) {
    if (filter == CharacterFilters.female) {
      return Icons.female;
    }

    return Icons.male;
  }
}
