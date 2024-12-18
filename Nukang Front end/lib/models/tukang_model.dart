class Tukang {
  final int id;
  final String nama;
  final String keahlianUtama;
  final double ratingKeahlian;

  Tukang({
    required this.id,
    required this.nama,
    required this.keahlianUtama,
    required this.ratingKeahlian,
  });

  factory Tukang.fromJson(Map<String, dynamic> json) {
    return Tukang(
      id: json['id_nukang'],
      nama: json['nama'],
      keahlianUtama: json['keahlian_utama'],
      ratingKeahlian: json['rating_keahlian'].toDouble(),
    );
  }
}
