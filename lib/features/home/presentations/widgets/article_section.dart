import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/home/controllers/article_controller.dart';
import 'package:ovo_ui/features/home/presentations/all_article_screen.dart';
import 'package:ovo_ui/features/home/presentations/article_detail_screen.dart';
import 'package:ovo_ui/features/home/presentations/widgets/article_item.dart';

class ArticleSection extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 25, bottom: 17),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Artikel",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(AllArticleScreen());
                  },
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: cyantext,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(() {
            return articleController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : articleController.articles.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 42,
                          ),
                          child: Text('Tidak ada artikel terbaru'),
                        ),
                      )
                    : SizedBox(
                        height: 280,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          scrollDirection: Axis.horizontal,
                          itemCount: articleController.articles.length,
                          itemBuilder: (ctx, index) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ArticleItem(
                              article: articleController.articles[index],
                              textButton: "Selengkapnya",
                              onTap: () {
                                Get.to(
                                  ArticleDetailScreen(
                                    article: articleController.articles[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
          }),
        ],
      ),
    );
  }
}
