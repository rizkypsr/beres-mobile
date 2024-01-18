class ArticleImages {
  final String image;

  ArticleImages({
    required this.image,
  });

  factory ArticleImages.fromJson(Map<String, dynamic> json) {
    return ArticleImages(
      image: json['image'],
    );
  }
}
