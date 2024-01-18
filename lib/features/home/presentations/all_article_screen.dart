import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/features/home/entitties/article.dart';
import 'package:ovo_ui/features/home/presentations/article_detail_screen.dart';
import 'package:ovo_ui/features/home/presentations/widgets/article_item.dart';
import 'package:http/http.dart' as http;

class AllArticleScreen extends StatefulWidget {
  const AllArticleScreen({Key? key}) : super(key: key);

  @override
  State<AllArticleScreen> createState() => _AllArticleScreenState();
}

class _AllArticleScreenState extends State<AllArticleScreen> {
  List<Article> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrlApi}/artikel?limit=10&page=1'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> articleList = List.from(data['data']);

        List<Article> parsedArticles = articleList
            .map((articleData) => Article.fromJson(articleData))
            .toList();

        setState(() {
          articles = parsedArticles;
          isLoading = false;
        });
      } else {
        throw Exception('Gagal mendapatkan data artikel');
      }
    } catch (error) {
      print('dasdas $error');
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semua Artikel'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.0,
          mainAxisSpacing: 18.0,
          childAspectRatio: 9 / 12,
        ),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem(
            article: articles[index],
            textButton: "Selengkapnya",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ArticleDetailScreen(
                      article: articles[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
