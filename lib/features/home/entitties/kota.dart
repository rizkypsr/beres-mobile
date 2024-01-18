class Kota {
  final int id;
  final String nama;

  Kota({
    required this.id,
    required this.nama,
  });

  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
      id: json['id_kota'],
      nama: json['nama_kota'],
    );
  }
}
