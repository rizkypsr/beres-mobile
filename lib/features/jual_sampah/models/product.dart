class Product {
  final int id;
  final int idKecamatan;
  final String gambar;
  final String judul;
  final String deksripsi;
  final int harga;
  final String satuan;
  final int? jumlah;

  Product({
    required this.id,
    required this.idKecamatan,
    required this.gambar,
    required this.judul,
    required this.deksripsi,
    required this.harga,
    required this.satuan,
    this.jumlah,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_js'],
      idKecamatan: json['id_kecamatan'] is String
          ? int.parse(json['id_kecamatan'])
          : json['id_kecamatan'],
      gambar: json['gambar_js'],
      judul: json['judul_js'],
      deksripsi: json['deskripsi_js'],
      harga: json['harga_js'] is String
          ? int.parse(json['harga_js'])
          : json['harga_js'],
      satuan: json['satuan_js'],
    );
  }
}
