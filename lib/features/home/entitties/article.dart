import 'package:ovo_ui/features/home/entitties/article_images.dart';

class Article {
  final int id;
  final String judul;
  final String subjudul;
  final String deskripsi;
  final String link;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> images;

  Article({
    required this.id,
    required this.judul,
    required this.subjudul,
    required this.deskripsi,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    var imageList = json['artikel_images'] as List<dynamic>;
    List<String> images =
        imageList.map((image) => ArticleImages.fromJson(image).image).toList();

    return Article(
      id: json['id'],
      judul: json['judul'],
      subjudul: json['subjudul'],
      deskripsi: json['deskripsi'],
      link: json['link'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      images: images,
    );
  }
}
