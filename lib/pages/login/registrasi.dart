import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ukk_canteen/components/login component/formbox_login.dart';
import 'package:ukk_canteen/services/api_service.dart';

class PageRegisterSiswa extends StatefulWidget {
  const PageRegisterSiswa({Key? key}) : super(key: key);

  @override
  State<PageRegisterSiswa> createState() => _RegisterSiswaPageState();
}

class _RegisterSiswaPageState extends State<PageRegisterSiswa> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _address, _phone, _username, _password;
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ApiServiceRegisterSiswa apiService = ApiServiceRegisterSiswa();
      bool success = await apiService.registerStudent(
        namaSiswa: _name!,
        alamat: _address!,
        telp: _phone!,
        username: _username!,
        password: _password!,
        foto: _image,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrasi Akun Siswa',
          style: GoogleFonts.outfit(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                  FormBox(
                    hintText: 'Nama Siswa',
                    isRequired: true,
                    onSaved: (value) => _name = value,
                  ),
                  const SizedBox(height: 16),
                  FormBox(
                    hintText: 'Alamat',
                    isRequired: true,
                    onSaved: (value) => _address = value,
                  ),
                  const SizedBox(height: 16),
                  FormBox(
                    hintText: 'Telepon',
                    isRequired: true,
                    onSaved: (value) => _phone = value,
                  ),
                  const SizedBox(height: 16),
                  FormBox(
                    hintText: 'Username',
                    isRequired: true,
                    onSaved: (value) => _username = value,
                  ),
                  const SizedBox(height: 16),
                  FormBox(
                    hintText: 'Password',
                    isRequired: true,
                    onSaved: (value) => _password = value,
                    prefixIcon: Icons.lock,
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
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _register,
                      child: Text('Daftar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
