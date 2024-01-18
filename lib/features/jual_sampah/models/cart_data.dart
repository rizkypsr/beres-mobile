import 'package:ovo_ui/features/jual_sampah/models/product.dart';

class CartData {
  final Product product;
  double quantity;

  CartData({
    required this.product,
    required this.quantity,
  });

  CartData copyWith({
    Product? product,
    double? quantity,
  }) {
    return CartData(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() => 'CartData(product: $product, quantity: $quantity)';
}
