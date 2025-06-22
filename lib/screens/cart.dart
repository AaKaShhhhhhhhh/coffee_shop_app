import 'package:flutter/material.dart';
import '../states/app_state.dart';

class CartScreen extends StatefulWidget {
  final AppState appState;
  const CartScreen({super.key, required this.appState});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    widget.appState.cartState.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    widget.appState.cartState.removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final cartState = widget.appState.cartState;
    final items = cartState.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.brown[900],
      ),
      body: Container(
        color: const Color(0xFFF8F5F2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Text(
                        'Your cart is empty',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CartItemCard(
                          name: item.product.name,
                          description: item.product.description,
                          imageUrl: item.product.imageUrl,
                          price: item.product.price,
                          size: item.size,
                          rating: item.product.rating,
                          quantity: item.quantity,
                          onRemove: () =>
                              setState(() => cartState.removeFromCart(item)),
                          onQuantityChanged: (q) =>
                              setState(() => cartState.updateQuantity(item, q)),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₹${cartState.subtotal.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Checkout'),
              ),
            ),
            const SizedBox(height: 16),
            // Placeholder for map/tracking section
            // Container(
            //   height: 180,
            //   margin: const EdgeInsets.only(top: 8),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Center(child: Text('Map/Tracking Coming Soon')),
            // ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String size;
  final double rating;
  final int quantity;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.rating,
    required this.quantity,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.brown,
                      ),
                      onPressed: onRemove,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.brown[300]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    StarRating(rating: rating),
                    const SizedBox(width: 8),
                    Text(
                      'Size: $size',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.brown[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.brown,
                          ),
                          onPressed: quantity > 1
                              ? () => onQuantityChanged(quantity - 1)
                              : null,
                        ),
                        Text(
                          '$quantity',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.brown,
                          ),
                          onPressed: () => onQuantityChanged(quantity + 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size;
  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating.round()
              ? Icons.star_rounded
              : Icons.star_border_rounded,
          color: Colors.amber,
          size: size,
        );
      }),
    );
  }
}
