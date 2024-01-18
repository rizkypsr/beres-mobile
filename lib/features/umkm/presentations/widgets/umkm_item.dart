import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/umkm/models/umkm.dart';
import 'package:ovo_ui/features/umkm/presentations/product_umkm_screen.dart';

class UmkmItem extends StatelessWidget {
  const UmkmItem({
    Key? key,
    required this.umkm,
  }) : super(key: key);

  final Umkm umkm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductUmkmScreen(
              id: umkm.id,
            ));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 16),
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: umkm.gambar,
                fit: BoxFit.cover,
                height: 155,
                width: double.infinity,
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${umkm.nama}, ${umkm.kecamatan!.nama}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              umkm.deskripsi,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Selengkapnya',
              style: TextStyle(
                color: darkpurple,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
