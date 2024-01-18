class Customer {
  final int idCustomer;
  final String nama;
  final String alamatCustomer;
  final int saldoCustomer;
  final String pinCustomer;
  final String noHpCustomer;
  final String roleCustomer;
  final String? tempatLahir;
  final String? tglLahir;

  Customer({
    required this.idCustomer,
    required this.nama,
    required this.alamatCustomer,
    required this.saldoCustomer,
    required this.pinCustomer,
    required this.noHpCustomer,
    required this.roleCustomer,
    this.tempatLahir,
    this.tglLahir,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    print(json['saldo_customer']);
    // show type
    print(json['saldo_customer'].runtimeType);
    return Customer(
      idCustomer: json['id_customer'],
      nama: json['nama'],
      alamatCustomer: json['alamat_customer'],
      saldoCustomer: json['saldo_customer'] is int
          ? json['saldo_customer']
          : int.parse(json['saldo_customer']),
      pinCustomer: json['pin_customer'],
      noHpCustomer: json['no_hp_customer'],
      roleCustomer: json['role_customer'],
      tempatLahir: json['tempat_lahir'],
      tglLahir: json['tgl_lahir'],
    );
  }
}
