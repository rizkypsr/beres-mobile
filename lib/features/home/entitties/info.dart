class Info {
  final int id;
  final String descriotion;
  final String image;

  Info({
    required this.id,
    required this.descriotion,
    required this.image,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'],
      descriotion: json['deskripsi_banner'],
      image: json['gambar_banner'],
    );
  }
}
