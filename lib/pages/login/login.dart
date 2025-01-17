import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_canteen/pages/login/registrasi.dart';
import 'package:ukk_canteen/components/login component/formbox_login.dart';
import 'package:ukk_canteen/components/login component/button.dart';
import 'package:ukk_canteen/components/login component/milih.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                  'Login',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 32),
                formbox(
                  hintText: 'Username',
                  isRequired: true,
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 16),
                formbox(
                  hintText: 'Password',
                  isRequired: true,
                  prefixIcon: Icons.lock,
                ),
                const Spacer(),
                button(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Lakukan proses login
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Belum punya akun? Daftar di sini',
                      style: TextStyle(
                        color: Colors.blue,
                        // fontWeight: Font.bold,
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
