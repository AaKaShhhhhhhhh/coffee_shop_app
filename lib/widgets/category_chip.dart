import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryChip({
    required this.label,
    this.selected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap?.call(),
        selectedColor: Colors.brown[200],
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(
          color: selected ? Colors.brown[900] : Colors.brown[600],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
