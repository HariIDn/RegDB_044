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
    try {
      var response = await kontakService.addPerson(data, file);

      if (response.statusCode == 201) {
        return {'succes': true, 'message': 'Data berhasil disimpan,'};
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodeJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodeJson['message'] ?? 'Terjadi Kesalahan',
          };
        }
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi Kesalahan: $e',
      };
    }
  }
}
