import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/core/presentations/widgets/form/dropdown_v2.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/cart_controller.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/confirmation_screen.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/widgets/cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);

  final format = NumberFormat('#,###', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: DropdownV2<Kecamatan>(
            label: "Pilih Kecamatan",
            isLoading: cartController.isLoadingKecamatan.value,
            items: cartController.kecamatan.value,
            itemAsString: (Kecamatan? item) =>
                item == null ? "" : "${item.nama}, ${item.kota!.nama}",
            onChanged: (item) {
              cartController.fetchProduct(item!.id);
            },
          ),
        ),
        body: cartController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : cartController.products.value.isEmpty
                ? Center(child: Text('Tidak ada produk'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartController.products.value.length,
                    itemBuilder: (context, index) {
                      final product = cartController.products.value[index];
                      return CartItem(product: product);
                    },
                  ),
        bottomNavigationBar: BottomAppBar(
          height: 120,
          elevation: 10,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Harga: ${format.format(cartController.total.value.toInt())} Poin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: cartController.total.value == 0
                    ? null
                    : () {
                        Get.to(ConfirmationScreen(
                          cart: cartController.cart.value,
                        ));
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkpurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Jual Sampah',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
