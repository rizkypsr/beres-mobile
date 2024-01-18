import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/jual_sampah/controllers/cart_controller.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final format = NumberFormat('#,###', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Container(
      height: 135,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: product.gambar,
              fit: BoxFit.cover,
              width: 110,
              height: double.infinity,
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(
                  product.judul,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${format.format(product.harga)} Poin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoSpinBox(
                  min: 0,
                  max: 100,
                  value: 0,
                  onChanged: ((value) {
                    cartController.updateTotal(
                      product.harga,
                      value,
                      product,
                    );
                  }),
                  suffix: Text("${product.satuan}/pcs"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
