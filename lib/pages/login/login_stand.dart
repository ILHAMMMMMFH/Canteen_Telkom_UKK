import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ukk_canteen/components/login component/formbox_login.dart';
import 'package:ukk_canteen/components/login component/button.dart';
import 'package:ukk_canteen/pages/login/registrasi_stand.dart';
import 'package:ukk_canteen/services/api_service.dart'; // Import ApiService

class PageLoginStand extends StatefulWidget {
  const PageLoginStand({Key? key}) : super(key: key);

  @override
  State<PageLoginStand> createState() => _LoginStandPageState();
}

class _LoginStandPageState extends State<PageLoginStand> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiServiceLoginStand _apiService = ApiServiceLoginStand();
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    bool success = await _apiService.loginStand(
      username: username,
      password: password,
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login berhasil!')),
      );
      Navigator.pushReplacementNamed(context, '/landing_Stand');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login gagal, periksa username dan password Anda.')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login Sebagai Register',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 32),
                FormBox(
                  hintText: 'Username',
                  isRequired: true,
                  prefixIcon: Icons.person,
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),
                FormBox(
                  hintText: 'Password',
                  isRequired: true,
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                ),
                const Spacer(),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Button(
                        text: 'Login',
                        onPressed: _login,
                      ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageRegisterStand()),
                      );
                    },
                    child: Text(
                      'Belum punya akun Stand? Daftar di sini',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
