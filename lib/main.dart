import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login/login.dart';
import 'pages/login/pilih_kriteria.dart';
import 'pages/login/registrasi.dart';
import 'pages/login/registrasi_stand.dart';
import 'pages/login/login_stand.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.outfitTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Tentukan rute awal
      initialRoute: '/role-selection',

      // Definisi rute aplikasi
      routes: {
        '/role-selection': (context) => const PilihKriteria(),
        '/login': (context) => const PageLoginSiswa(),
        '/loginStand': (context) => const PageLoginStand(),
        '/Register': (context) => const PageRegisterSiswa(),
        '/registerStand': (context) => const PageRegisterStand(),
      },

      // Handler untuk rute yang tidak terdefinisi
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
            body: const Center(child: Text('Halaman tidak tersedia')),
          ),
        );
      },
    );
  }
}
