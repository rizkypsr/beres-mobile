import 'package:ovo_ui/features/home/entitties/kecamatan.dart';
import 'package:ovo_ui/features/jual_sampah/models/product.dart';
import 'package:ovo_ui/features/logs/models/customer.dart';
import 'package:ovo_ui/features/ppob/models/ppob.dart';

class JualSampahTransaction {
  final int idTransaksijs;
  final String idCsJs;
  final String idKcJs;
  final String jenisSampahJs;
  final String satuanJs;
  final String jumlahJs;
  final String hargaJs;
  final String totalJs;
  final String statusJs;
  final String createdAt;
  final String? updatedAt;
  final Kecamatan kecamatan;
  final Customer customer;
  final Product produkjs;

  JualSampahTransaction({
    required this.idTransaksijs,
    required this.idCsJs,
    required this.idKcJs,
    required this.jenisSampahJs,
    required this.satuanJs,
    required this.jumlahJs,
    required this.hargaJs,
    required this.totalJs,
    required this.statusJs,
    required this.createdAt,
    this.updatedAt,
    required this.kecamatan,
    required this.customer,
    required this.produkjs,
  });

  factory JualSampahTransaction.fromJson(Map<String, dynamic> json) {
    return JualSampahTransaction(
      idTransaksijs: json['id_transaksijs'],
      idCsJs: json['id_cs_js'],
      idKcJs: json['id_kc_js'],
      jenisSampahJs: json['jenissampah_js'],
      satuanJs: json['satuan_js'],
      jumlahJs: json['jumlah_js'],
      hargaJs: json['harga_js'],
      totalJs: json['total_js'],
      statusJs: json['status_js'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      kecamatan: Kecamatan.fromJson(json['kecamatan']),
      customer: Customer.fromJson(json['customer']),
      produkjs: Product.fromJson(json['produkjs']),
    );
  }
}
