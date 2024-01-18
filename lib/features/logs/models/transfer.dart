import 'package:ovo_ui/features/logs/models/customer.dart';

class Transfer {
  final int idTf;
  final String pengirim;
  final String penerima;
  final String tanggal;
  final String nominal;
  final Customer customer;

  Transfer({
    required this.idTf,
    required this.pengirim,
    required this.penerima,
    required this.tanggal,
    required this.nominal,
    required this.customer,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      idTf: json['id_tf'],
      pengirim: json['pengirim'],
      penerima: json['penerima'],
      tanggal: json['tanggal'],
      nominal: json['nominal'],
      customer: Customer.fromJson(json['customer']),
    );
  }
}
