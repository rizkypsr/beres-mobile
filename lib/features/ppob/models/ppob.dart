//  {
//             "id_ppob": 1,
//             "gambar_ppob": "ppob",
//             "judul_ppob": "PLN",
//             "ppob_is_delete": "0",
//             "created_at": null,
//             "updated_at": null
//         },

class Ppob {
  int? id;
  String? gambar;
  String? judul;

  Ppob({
    this.id,
    this.gambar,
    this.judul,
  });

  factory Ppob.fromJson(Map<String, dynamic> json) {
    return Ppob(
      id: json['id_ppob'],
      gambar: json['gambar_ppob'],
      judul: json['judul_ppob'],
    );
  }
}
