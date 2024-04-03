import 'package:flutter/material.dart';
import 'package:regis_db/form/widget/form_head.dart';
import 'package:regis_db/form/widget/form_ui.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var nama = TextEditingController();
  var no = TextEditingController();
  var email = TextEditingController();
  var alamat = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormHead(),
            FormUI(),
          ],
        ),
      ),
    );
  }
}
