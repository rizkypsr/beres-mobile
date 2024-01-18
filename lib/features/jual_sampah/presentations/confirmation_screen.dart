import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/response.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/cart_controller.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/jual_sampah_controller.dart';
import 'package:ovo_ui/features/jual_sampah/models/cart.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/widgets/confirmation_item.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final List<Cart> cart;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final JualSampahController jualSampahController =
        Get.find<JualSampahController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Jual Sampah'),
      ),
      body: Obx(
        () {
          if (cartController.products.isEmpty) {
            Center(child: Text('Tidak ada produk'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index].cartData.product;
              return ConfirmationItem(
                product: product,
                quantity: cart[index].cartData.quantity.toInt(),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () async {
            final result = await Get.to(() => VerificationScreen());

            if (result != null) {
              jualSampahController.jualsampahjs(
                result['userId'],
                cart,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: darkpurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            'Transfer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
