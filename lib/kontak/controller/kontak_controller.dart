import 'dart:convert';
import 'dart:io';

import 'package:regis_db/kontak/model/kontak.dart';
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
        return {'success': true, 'message': 'Data berhasil disimpan,'};
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
    return await addPerson(person, file);
  }

  Future<List<Kontak>> getPeople() async {
    try {
      List<dynamic> peopleData = await kontakService.fetchPeople();
      List<Kontak> people =
          peopleData.map((json) => Kontak.fromMap(json)).toList();
      return people;
    } catch (e) {
      print(e);
      throw Exception("Gagal mengambil data");
    }
  }
}
