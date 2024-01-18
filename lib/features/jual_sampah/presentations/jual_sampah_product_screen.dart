import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/Screen/Home/Component/Transaction_page.dart';
import 'package:ovo_ui/core/presentations/widgets/form/dropdown_v2.dart';
import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/jual_sampah_controller.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/shopping_cart_screen.dart';
import 'package:ovo_ui/features/jual_sampah/presentations/widgets/product_item.dart';

class JualSampahProductScreen extends StatelessWidget {
  const JualSampahProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JualSampahController jualSampahController =
        Get.put(JualSampahController());

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: DropdownV2<Kecamatan>(
            label: "Pilih Kota/Kecamatan",
            isLoading: jualSampahController.isLoadingKecamatan.value,
            items: jualSampahController.kecamatan.value,
            itemAsString: (Kecamatan? item) =>
                item == null ? "" : "${item.nama}, ${item.kota!.nama}",
            onChanged: (item) {
              jualSampahController.fetchProduct(item!.id);
            },
          ),
        ),
        body: jualSampahController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : jualSampahController.products.value.isEmpty
                ? Center(child: Text('Tidak ada produk'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: jualSampahController.products.value.length,
                    itemBuilder: (context, index) {
                      final product =
                          jualSampahController.products.value[index];
                      return ProductItem(product: product);
                    },
                  ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () => Get.to(() => ShoppingCartScreen()),
            style: ElevatedButton.styleFrom(
              backgroundColor: darkpurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Lanjutkan Transaksi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
