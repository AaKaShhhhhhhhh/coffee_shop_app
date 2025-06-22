import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  String size;

  CartItem({required this.product, required this.quantity, required this.size});
}
