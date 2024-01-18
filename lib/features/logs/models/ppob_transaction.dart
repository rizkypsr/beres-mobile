import 'package:ovo_ui/features/logs/models/customer.dart';

class PpobTransaction {
  final int idTransaksippob;
  final String customerPpob;
  final String produkTransaksiPpob;
  final String hargaTransaksiPpob;
  final String bayarTransaksiPpob;
  final String tanggalTransaksiPpob;
  final String nomorInputan;
  final String statusPpob;
  final String createdAt;

  PpobTransaction({
    required this.idTransaksippob,
    required this.customerPpob,
    required this.produkTransaksiPpob,
    required this.hargaTransaksiPpob,
    required this.bayarTransaksiPpob,
    required this.tanggalTransaksiPpob,
    required this.nomorInputan,
    required this.statusPpob,
    required this.createdAt,
  });

  factory PpobTransaction.fromJson(Map<String, dynamic> json) {
    return PpobTransaction(
      idTransaksippob: json['id_transaksippob'],
      customerPpob: json['customer_ppob'],
      produkTransaksiPpob: json['produk_transaksi_ppob'],
      hargaTransaksiPpob: json['harga_transaksi_ppob'],
      bayarTransaksiPpob: json['bayar_transaksi_ppob'],
      tanggalTransaksiPpob: json['tanggal_transaksi_ppob'],
      nomorInputan: json['nomor_inputan'],
      statusPpob: json['status_ppob'],
      createdAt: json['created_at'],
    );
  }
}
