import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
        ),
        Text('$quantity', style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () => setState(() => quantity++),
        ),
      ],
    );
  }
}
