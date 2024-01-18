import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/features/umkm/controllers/product_umkm_controller.dart';
import 'package:ovo_ui/features/umkm/presentations/widgets/product_umkm_item.dart';

class ProductUmkmScreen extends StatelessWidget {
  final int id;

  const ProductUmkmScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize and fetch products when the controller is created
    final ProductUmkmController controller =
        Get.put(ProductUmkmController()..fetchProduct(id));

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Produk UMKM'),
        ),
        body: controller.isLoadingProduct.value
            ? Center(child: CircularProgressIndicator())
            : controller.products.value.isEmpty
                ? Center(child: Text('Tidak ada UMKM'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.products.value.length,
                    itemBuilder: (context, index) {
                      final product = controller.products.value[index];
                      return ProductUmkmItem(product: product);
                    },
                  ),
      ),
    );
  }
}
