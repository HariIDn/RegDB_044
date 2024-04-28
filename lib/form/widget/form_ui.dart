import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:regis_db/home/view/homeview.dart';
import 'package:regis_db/kontak/controller/kontak_controller.dart';
import 'package:regis_db/kontak/model/kontak.dart';
import 'package:regis_db/maps/screen/map_screen.dart';

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
  String? _alamat;
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
            width: double.infinity,
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alamat"),
                _alamat == null
                    ? SizedBox(
                        width: double.infinity,
                        child: Text('Alamat Kosong'),
                      )
                    : Text('$_alamat'),
                _alamat == null
                    ? TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreen(
                                  onLocationSelected: (selectedAddress) {
                                setState(() {
                                  _alamat = selectedAddress;
                                });
                              }),
                            ),
                          );
                        },
                        child: Text('Pilih Alamat'))
                    : TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreen(
                                  onLocationSelected: (selectedAddress) {
                                setState(() {
                                  _alamat = selectedAddress;
                                });
                              }),
                            ),
                          );
                        },
                        child: Text('Ubah Alamat'),
                      ),
              ],
            ),
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
          SizedBox(height: 10),
          _image == null
              ? const Text('Tidak ada gambar yang dipilih')
              : Image.file(_image!),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: getImage, child: const Text('Pilih Gambar')),
          SizedBox(height: 10),
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                      (route) => false);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
