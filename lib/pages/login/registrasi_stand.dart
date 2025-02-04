import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_canteen/services/api_service.dart'; // Pastikan import ApiServiceStand
import 'package:ukk_canteen/components/login component/formbox_login.dart'; // Perhatikan penulisan nama file jika perlu

class PageRegisterStand extends StatefulWidget {
  const PageRegisterStand({Key? key}) : super(key: key);

  @override
  State<PageRegisterStand> createState() => _RegisterStandPageState();
}

class _RegisterStandPageState extends State<PageRegisterStand> {
  final _formKey = GlobalKey<FormState>();
  String? _standName, _ownerName, _phone, _username, _password;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ApiServiceRegisterStand apiServiceStand =
          ApiServiceRegisterStand(); // Gunakan ApiServiceStand
      bool success = await apiServiceStand.registerStand(
        // Gunakan registerStand
        namaStan: _standName!,
        namaPemilik: _ownerName!,
        telp: _phone!,
        username: _username!,
        password: _password!,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Stand registration successful!')),
        );
        Navigator.pushReplacementNamed(context, '/loginStand');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Stand registration failed!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrasi Akun Stand',
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
                    'Daftar Akun Stand',
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 32),
                  FormBox(
                    hintText: 'Nama Stand',
                    isRequired: true,
                    onSaved: (value) => _standName = value,
                  ),
                  const SizedBox(height: 16),
                  FormBox(
                    hintText: 'Nama Pemilik',
                    isRequired: true,
                    onSaved: (value) => _ownerName = value,
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
                  const SizedBox(height: 32),
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
