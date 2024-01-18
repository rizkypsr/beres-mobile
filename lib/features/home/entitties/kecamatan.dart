import 'package:ovo_ui/features/home/entitties/kota.dart';

class Kecamatan {
  final int id;
  final String nama;
  final int status;
  final Kota? kota;

  Kecamatan({
    required this.id,
    required this.nama,
    required this.status,
    this.kota,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      id: json['id_kecamatan'],
      nama: json['nama_kecamatan'],
      status: json['status_kecamatan'] is String
          ? int.parse(json['status_kecamatan'])
          : json['status_kecamatan'],
      kota: json['kota'] != null ? Kota.fromJson(json['kota']) : null,
    );
  }
}
