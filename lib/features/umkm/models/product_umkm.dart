import 'package:ovo_ui/features/umkm/models/umkm.dart';

class ProductUmkm {
  ProductUmkm({
    required this.id,
    required this.idUmkm,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.umkm,
  });

  int id;
  int idUmkm;
  String nama;
  String gambar;
  String deskripsi;
  Umkm umkm;

  factory ProductUmkm.fromJson(Map<String, dynamic> json) => ProductUmkm(
        id: json["id_produk_umkm"],
        idUmkm: json["id_umkm_produk"] is String
            ? int.parse(json["id_umkm_produk"])
            : json["id_umkm_produk"],
        nama: json["nama_produk_umkm"],
        gambar: json["gambar_produk_umkm"],
        deskripsi: json["deskripsi_produk_umkm"],
        umkm: Umkm.fromJson(json["umkm"]),
      );

  Map<String, dynamic> toJson() => {
        "id_produk_umkm": id,
        "id_umkm_produk": idUmkm,
        "nama_produk_umkm": nama,
        "gambar_produk_umkm": gambar,
        "deskripsi_produk_umkm": deskripsi,
        "umkm": umkm.toJson(),
      };
}
