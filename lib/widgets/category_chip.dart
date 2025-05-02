import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function(bool) onSelected;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        selected: isSelected,
        onSelected: onSelected,
        selectedColor: Colors.orange,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }
}