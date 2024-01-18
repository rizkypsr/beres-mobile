class ChallengeImage {
  final String image;

  ChallengeImage({
    required this.image,
  });

  factory ChallengeImage.fromJson(Map<String, dynamic> json) {
    return ChallengeImage(
      image: json['image'],
    );
  }
}
