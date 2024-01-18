import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: product.gambar,
              fit: BoxFit.cover,
              height: 130,
              width: double.infinity,
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.judul,
            style:
                TextStyle(fontWeight: FontWeight.w800, color: Colors.black87),
          ),
          Text(
            (product.harga.toString() + " Poin" + "/" + product.satuan),
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          Text(
            product.deksripsi,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
