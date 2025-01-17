import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:ukk_canteen/components/login component/button.dart';
import 'package:ukk_canteen/components/login component/formbox_login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _address, _phone, _username;
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrasi',
          style: GoogleFonts.outfit(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Akun',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 32),
                formbox(
                  hintText: 'Nama Siswa',
                  isRequired: true,
                  //    onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 16),
                formbox(
                  hintText: 'Alamat',
                  isRequired: true,
                  //    onSaved: (value) => _address = value,
                ),
                const SizedBox(height: 16),
                formbox(
                  hintText: 'Telepon',
                  isRequired: true,
                  //     onSaved: (value) => _phone = value,
                ),
                const SizedBox(height: 16),
                formbox(
                  hintText: 'Username',
                  isRequired: true,
                  //       onSaved: (value) => _username = value,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: _image == null
                        ? const Center(child: Text('Pilih Foto'))
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                const Spacer(),
                button(
                  text: 'Daftar',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Lakukan proses registrasi
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on ImagePicker {
  getImage({required ImageSource source}) {}
}
