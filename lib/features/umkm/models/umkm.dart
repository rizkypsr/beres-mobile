import 'package:ovo_ui/features/home/entitties/kecamatan.dart';

class Umkm {
  Umkm({
    required this.id,
    required this.idKecamatan,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    this.kecamatan,
  });

  int id;
  int idKecamatan;
  String nama;
  String deskripsi;
  String gambar;
  Kecamatan? kecamatan;

  factory Umkm.fromJson(Map<String, dynamic> json) => Umkm(
        id: json["id_umkm"],
        idKecamatan: json["id_kecamatan_umkm"] is String
            ? int.parse(json["id_kecamatan_umkm"])
            : json["id_kecamatan_umkm"],
        nama: json["nama_umkm"],
        deskripsi: json["deskripsi_umkm"],
        gambar: json["gambar_umkm"],
        // get kecamatan from json if not null
        kecamatan: json["kecamatan"] == null
            ? null
            : Kecamatan.fromJson(json["kecamatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id_umkm": id,
        "id_kecamatan_umkm": idKecamatan,
        "nama_umkm": nama,
        "deskripsi_umkm": deskripsi,
        "gambar_umkm": gambar,
      };
}
