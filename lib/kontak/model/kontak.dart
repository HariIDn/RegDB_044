// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String tlp;
  final String noTelepon;
  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.tlp,
    required this.noTelepon,
  });

  Kontak copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? tlp,
    String? noTelepon,
  }) {
    return Kontak(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      tlp: tlp ?? this.tlp,
      noTelepon: noTelepon ?? this.noTelepon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'tlp': tlp,
      'noTelepon': noTelepon,
    };
  }

  factory Kontak.fromMap(Map<String, dynamic> map) {
    return Kontak(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      tlp: map['tlp'] as String,
      noTelepon: map['noTelepon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kontak.fromJson(String source) =>
      Kontak.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kontak(nama: $nama, email: $email, alamat: $alamat, tlp: $tlp, noTelepon: $noTelepon)';
  }

  @override
  bool operator ==(covariant Kontak other) {
    if (identical(this, other)) return true;

    return other.nama == nama &&
        other.email == email &&
        other.alamat == alamat &&
        other.tlp == tlp &&
        other.noTelepon == noTelepon;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        email.hashCode ^
        alamat.hashCode ^
        tlp.hashCode ^
        noTelepon.hashCode;
  }
}
