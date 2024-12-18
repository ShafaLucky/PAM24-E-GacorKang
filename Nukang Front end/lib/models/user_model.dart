class User {
  final int id;
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final double saldoDompet;

  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.saldoDompet,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id_user'],
      nama: json['nama'],
      email: json['email'],
      noHp: json['no_HP'].toString(),
      alamat: json['alamat'] ?? '',
      saldoDompet: json['saldo_dompet'] != null
          ? double.parse(json['saldo_dompet'].toString())
          : 0.0,
    );
  }
}
