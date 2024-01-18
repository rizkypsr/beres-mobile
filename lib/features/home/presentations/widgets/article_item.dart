import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/home/entitties/article.dart';

class ArticleItem extends StatelessWidget {
  final Function() onTap;
  final Article article;
  final String textButton;

  const ArticleItem({
    Key? key,
    required this.article,
    required this.textButton,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8)
          ],
          borderRadius: BorderRadius.circular(radius),
        ),
        width: (MediaQuery.of(context).size.width - 57) * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(radius)),
              child: Container(
                height: 83,
                width: double.infinity,
                child: article.images.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl:
                            '$baseUrl/storage/artikel/${article.images[0]}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      )
                    : Center(child: Text('Tidak Ada Gambar')),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(9, 13, 9, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.judul,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  SizedBox(height: 14),
                  Text(
                    article.deskripsi,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, color: greytext),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textButton,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: cyantext,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
