import 'package:flutter/material.dart';
import '../models/product.dart';
import '../states/app_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  final AppState appState;
  final Product product;
  const ProductDetailsScreen({
    super.key,
    required this.appState,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String selectedSize;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes.first;
  }

  // Adds the selected product, size, and quantity to the cart
  void addToCart() {
    widget.appState.cartState.addToCart(
      widget.product,
      selectedSize,
      quantity: quantity,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Added to cart!')));
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'coffee-image-${product.id}',
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.brown[50],
                  ),
                  child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(product.rating.toStringAsFixed(1)),
                ],
              ),
              const SizedBox(height: 24),
              Text('Size'),
              Row(
                children: product.sizes.map((size) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (_) => setState(() => selectedSize = size),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Text('Quantity'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: quantity > 1
                        ? () => setState(() => quantity--)
                        : null,
                  ),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => setState(() => quantity++),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: addToCart,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
