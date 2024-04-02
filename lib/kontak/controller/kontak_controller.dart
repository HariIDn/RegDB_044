import 'dart:convert';
import 'dart:io';
import 'dart:html';

import 'package:regis_db/kontak/service/kontak_service.dart';

class KontakController {
  final kontakService = KontakService();

  Future<Map<String, dynamic>> addPerson(Kontak person, File? file) async {
    Map<String, String> data = {
      'nama': person.nama,
      'email': person.email,
      'alamat': person.alamat,
      'no_telepon': person.noTelepon
    };
  }
}
