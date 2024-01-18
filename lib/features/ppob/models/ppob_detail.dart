import 'package:ovo_ui/features/ppob/models/ppob.dart';

class PpobDetail {
  PpobDetail({
    this.idDetailppob,
    this.hargaDetailppob,
    this.bayarDetailppob,
    this.ppob,
  });

  int? idDetailppob;
  String? hargaDetailppob;
  String? bayarDetailppob;
  Ppob? ppob;

  factory PpobDetail.fromJson(Map<String, dynamic> json) => PpobDetail(
        idDetailppob: json["id_detailppob"],
        hargaDetailppob: json["harga_detailppob"],
        bayarDetailppob: json["bayar_detailppob"],
        ppob: json["ppob"] == null ? null : Ppob.fromJson(json["ppob"]),
      );
}
