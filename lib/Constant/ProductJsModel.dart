class ProductJSModel {
  final int? id;
  final String? juduljs;
  final String? imagejs;
  final String? deskripsijs;
  final String? hargajs;
  final String? satuanjs;

  ProductJSModel(
      {this.id,
      this.juduljs,
      this.imagejs,
      this.deskripsijs,
      this.hargajs,
      this.satuanjs});

  factory ProductJSModel.fromJson(Map<String, dynamic>? json) {
    return ProductJSModel(
      id: json?['id_js'],
      juduljs: json?['judul_js'],
      imagejs: json?['gambar_js'],
      deskripsijs: json?['deskripsi_js'],
      hargajs: json?['harga_js'],
      satuanjs: json?['satuan_js'],
    );
  }
}

class JenisSampahBody {
  final int id_js;
  String judul_js;
  String jumlah_js;

  JenisSampahBody(
      {required this.id_js, required this.jumlah_js, required this.judul_js});

  Map<String, dynamic> toJson() =>
      {'id_js': id_js, 'judul_js': judul_js, 'jumlah_js': jumlah_js};
}

class ProductUMKMmodel {
  final int id_um;
  final String judulum;
  final String imageum;
  final String deskripsium;

  ProductUMKMmodel({
    required this.id_um,
    required this.judulum,
    required this.imageum,
    required this.deskripsium,
  });

  factory ProductUMKMmodel.fromJson(Map<String, dynamic> json) {
    return ProductUMKMmodel(
      id_um: json['id_produk_umkm'],
      judulum: json['nama_produk_umkm'],
      imageum: json['gambar_produk_umkm'],
      deskripsium: json['deskripsi_produk_umkm'],
    );
  }
}

class KotaJSModel {
  final int idkc;
  final KotakecJSModel kotajs;
  final String kecamatanjs;

  KotaJSModel(
      {required this.idkc, required this.kotajs, required this.kecamatanjs});

  factory KotaJSModel.fromJson(Map<String, dynamic> json) {
    return KotaJSModel(
      idkc: json['id_kecamatan'],
      kotajs: KotakecJSModel.fromJson(json['kota']),
      kecamatanjs: json['nama_kecamatan'],
    );
  }
}

class KotakecJSModel {
  final int idkt;
  final String kota;

  KotakecJSModel({required this.idkt, required this.kota});

  factory KotakecJSModel.fromJson(Map<String, dynamic> json) {
    return KotakecJSModel(
      idkt: json['id_kota'],
      kota: json['nama_kota'],
    );
  }
}

class TokoUMKMmodel {
  final int id_um;
  final String namaum;
  final String imageum;
  final String deskripsium;

  TokoUMKMmodel({
    required this.id_um,
    required this.namaum,
    required this.imageum,
    required this.deskripsium,
  });

  factory TokoUMKMmodel.fromJson(Map<String, dynamic> json) {
    return TokoUMKMmodel(
      id_um: json['id_umkm'],
      namaum: json['nama_umkm'],
      imageum: json['gambar_umkm'],
      deskripsium: json['deskripsi_umkm'],
    );
  }
}

class CatPPOBmodel {
  final int id_pp;
  final String cat_pp;

  CatPPOBmodel({
    required this.id_pp,
    required this.cat_pp,
  });

  factory CatPPOBmodel.fromJson(Map<String, dynamic> json) {
    return CatPPOBmodel(
      id_pp: json['id_ppob'],
      cat_pp: json['judul_ppob'],
    );
  }
}

class detailPPOBmodel {
  final int id_detpp;
  final String hrg_detpp;
  final String bayar_detpp;

  detailPPOBmodel(
      {required this.id_detpp,
      required this.hrg_detpp,
      required this.bayar_detpp});

  factory detailPPOBmodel.fromJson(Map<String, dynamic> json) {
    return detailPPOBmodel(
      id_detpp: json['id_detailppob'],
      hrg_detpp: json['harga_detailppob'],
      bayar_detpp: json['bayar_detailppob'],
    );
  }
}

class transPPOBmodel {
  final int produk_transpp;
  final String nomorinput;
  final String pin;
  //final String bayar_detpp;

  transPPOBmodel(
      {required this.produk_transpp,
      required this.nomorinput,
      required this.pin});

  factory transPPOBmodel.fromJson(Map<String, dynamic> json) {
    return transPPOBmodel(
        produk_transpp: json['produk_transaksi_ppob'],
        nomorinput: json['nomor_inputan'],
        pin: json['pin_customer']);
  }
}

class customerModel {
  final int id_customer;
  final String nama_customer;
  final String saldo_customer;
  final String alamat_customer;

  //final String bayar_detpp;

  customerModel(
      {required this.id_customer,
      required this.nama_customer,
      required this.saldo_customer,
      required this.alamat_customer});

  factory customerModel.fromJson(Map<String, dynamic> json) {
    return customerModel(
        id_customer: json['id_customer'],
        nama_customer: json['nama_customer'],
        saldo_customer: json['saldo_customer'],
        alamat_customer: json['alamat_customer']);
  }
}

class LogsModel {
  final int id_transaksippob;
  final int id_tf;
  final int id_transaksijs;
  final String nama_customer;
  final String nomor_input;
  final String jenis_sampah;
  final String tanggal_ppob;
  final String tanggal_transfer;
  final String status_ppob;
  final String status_js;
  final String harga_transaksippob;
  final String jumlah_js;
  final String total_js;
  final String pengirim;
  final String penerima;
  final String nominal;
  final ProductJSModel judulproduk;
  //final String bayar_detpp;

  LogsModel({
    required this.id_tf,
    required this.id_transaksijs,
    required this.id_transaksippob,
    required this.nama_customer,
    required this.nomor_input,
    required this.jenis_sampah,
    required this.tanggal_ppob,
    required this.harga_transaksippob,
    required this.jumlah_js,
    required this.nominal,
    required this.penerima,
    required this.pengirim,
    required this.total_js,
    required this.status_js,
    required this.status_ppob,
    required this.tanggal_transfer,
    required this.judulproduk,
  });

  factory LogsModel.fromJson(Map<String, dynamic> json) {
    print("check convert");
    print(json["nominal"]);
    return LogsModel(
      id_tf: json['id_tf'],
      id_transaksijs: json['id_transaksijs'],
      id_transaksippob: json['id_transaksippob'],
      nominal: json['nominal'],
      nama_customer: json['nama_customer'],
      nomor_input: json['nomor_inputan'],
      jenis_sampah: json['jenissampah_js'],
      harga_transaksippob: json['harga_transaksi_ppob'],
      penerima: json['penerima'],
      pengirim: json['pengirim'],
      status_js: json['status_js'],
      status_ppob: json['status_ppob'],
      tanggal_ppob: json['tanggal_transaksi_ppob'],
      tanggal_transfer: json['tanggal'],
      total_js: json['total_js'],
      jumlah_js: json['jumlah_js'],
      judulproduk: ProductJSModel.fromJson(json['produkjs']),
    );
  }
}

class FAQmodel {
  final int id_faq;
  final String judulfaq;
  final String deskripsifaq;

  FAQmodel({
    required this.id_faq,
    required this.judulfaq,
    required this.deskripsifaq,
  });

  factory FAQmodel.fromJson(Map<String, dynamic> json) {
    return FAQmodel(
      id_faq: json['id_faq'],
      judulfaq: json['judul_faq'],
      deskripsifaq: json['deskripsi_faq'],
    );
  }
}

class Qurbanmodel {
  final int id_qurban;
  final String gambarqurban;
  final String namaqurban;
  final String deskripsiqurban;

  Qurbanmodel({
    required this.id_qurban,
    required this.gambarqurban,
    required this.namaqurban,
    required this.deskripsiqurban,
  });

  factory Qurbanmodel.fromJson(Map<String, dynamic> json) {
    return Qurbanmodel(
        id_qurban: json['id_qurban'],
        gambarqurban: json['gambar_qurban'],
        namaqurban: json['nama_qurban'],
        deskripsiqurban: json['deskripsi_qurban']);
  }
}

class Bannermodel {
  final int id_banner;
  final String gambarbanner;
  final String deskripsibanner;

  Bannermodel({
    required this.id_banner,
    required this.gambarbanner,
    required this.deskripsibanner,
  });

  factory Bannermodel.fromJson(Map<String, dynamic> json) {
    return Bannermodel(
      id_banner: json['id'],
      gambarbanner: json['gambar_banner'],
      deskripsibanner: json['deskripsi_banners'],
    );
  }
}

class WaJsModel {
  final int id_sosmed;
  final String nama_sosmed;
  final String deskripsi_sosmed;
  //final String alamat_customer;

  //final String bayar_detpp;

  WaJsModel(
      {required this.id_sosmed,
      required this.nama_sosmed,
      required this.deskripsi_sosmed});

  factory WaJsModel.fromJson(Map<String, dynamic> json) {
    return WaJsModel(
      id_sosmed: json['id_sosmed'],
      nama_sosmed: json['nama_sosmed'],
      deskripsi_sosmed: json['deskripsi_sosmed'],
      //alamat_customer: json['alamat_customer']
    );
  }
}

class TeleJsModel {
  final int id_sosmed;
  final String nama_sosmed;
  final String deskripsi_sosmed;
  //final String alamat_customer;

  //final String bayar_detpp;

  TeleJsModel(
      {required this.id_sosmed,
      required this.nama_sosmed,
      required this.deskripsi_sosmed});

  factory TeleJsModel.fromJson(Map<String, dynamic> json) {
    return TeleJsModel(
      id_sosmed: json['id_sosmed'],
      nama_sosmed: json['nama_sosmed'],
      deskripsi_sosmed: json['deskripsi_sosmed'],
      //alamat_customer: json['alamat_customer']
    );
  }
}

// class LogsTransferModel {
//   final int id_customer;
//   final String nama_customer;
//   final String saldo_customer;
//   final String alamat_customer;

//   //final String bayar_detpp;

//   LogsTransferModel({this.id_customer, this.nama_customer, this.saldo_customer, this.alamat_customer});

//   factory LogsTransferModel.fromJson(Map<String, dynamic> json) {
//     return LogsTransferModel(
//       id_customer: json['id_customer'],
//       nama_customer: json['nama_customer'],
//       saldo_customer: json['saldo_customer'],
//       alamat_customer: json['alamat_customer']
//     );
//   }
// }