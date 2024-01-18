import 'package:ovo_ui/features/jual_sampah/models/cart_data.dart';

class Cart {
  final int id;
  final CartData cartData;

  Cart({
    required this.id,
    required this.cartData,
  });

  Cart copyWith({
    int? id,
    CartData? cartData,
  }) {
    return Cart(
      id: id ?? this.id,
      cartData: cartData ?? this.cartData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_js': cartData.product.id,
      'jumlah_js': cartData.quantity.toInt(),
    };
  }

  @override
  String toString() {
    return 'Cart(id: $id, cartData: ${cartData.toString()})';
  }
}
