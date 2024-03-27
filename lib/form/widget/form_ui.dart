import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI(
      {super.key,
      required this.formKey,
      required this.etNama,
      required this.etEmail,
      required this.etAlamat,
      required this.etNo});

  final GlobalKey<FormState> formKey;
  final TextEditingController etNama;
  final TextEditingController etEmail;
  final TextEditingController etAlamat;
  final TextEditingController etNo;

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukan Nama',
              ),
              controller: widget.etNama,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Masukan Email',
              ),
              controller: widget.etEmail,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukan Alamat',
                ),
                controller: widget.etAlamat),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Telepon',
                  hintText: 'Masukan Nomor Telepon',
                ),
                controller: widget.etNo),
          ),
        ],
      ),
    );
  }
}
