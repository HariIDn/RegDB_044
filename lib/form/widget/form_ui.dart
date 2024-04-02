import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:regis_db/kontak/controller/kontak_controller.dart';
import 'package:regis_db/kontak/model/kontak.dart';

class FormUI extends StatefulWidget {
  const FormUI({super.key, o});

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  final _formKey = GlobalKey<FormState>();
  final etNama = TextEditingController();
  final etEmail = TextEditingController();
  final etAlamat = TextEditingController();
  final etNo = TextEditingController();

  File? _image;
  final _imagePicker = ImagePicker();
  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('You did not select an image.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukan Nama',
              ),
              controller: etNama,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Masukan Email',
              ),
              controller: etEmail,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukan Alamat',
                ),
                controller: etAlamat),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Telepon',
                  hintText: 'Masukan Nomor Telepon',
                ),
                controller: etNo),
          ),
          Container(
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var result = await KontakController().addPerson(
                        Kontak(
                          nama: etNama.text,
                          email: etEmail.text,
                          alamat: etAlamat.text,
                          noTelepon: etNo.text,
                          foto: _image!.path,
                        ),
                        _image,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result['message'])),
                      );
                    }
                  },
                  child: Text('Simpan')))
        ],
      ),
    );
  }
}
