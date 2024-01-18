import 'package:ovo_ui/features/env_learning/entities/challenge_image.dart';

class Challenge {
  final int id;
  final String judul;
  final String deskripsi;
  final String link;
  final List<String> images;
  final int point;

  Challenge({
    required this.id,
    required this.judul,
    required this.link,
    required this.deskripsi,
    required this.images,
    required this.point,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    var imageList = json['challenge_images'] as List<dynamic>;
    List<String> images =
        imageList.map((image) => ChallengeImage.fromJson(image).image).toList();

    return Challenge(
      id: json['id'],
      judul: json['judul'],
      link: json['link'],
      deskripsi: json['deskripsi'],
      images: images,
      point: json['point'] is int ? json['point'] : int.parse(json['point']),
    );
  }
}
