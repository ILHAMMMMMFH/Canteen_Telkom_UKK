import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:ukk_canteen/components/login%20component/button.dart';
import 'package:ukk_canteen/components/login%20component/milih.dart';

class PilihKriteria extends StatefulWidget {
  const PilihKriteria({Key? key}) : super(key: key);

  @override
  State<PilihKriteria> createState() => _pilihkriterria();
}

class _pilihkriterria extends State<PilihKriteria> {
  String? selectedRole;

  void onRoleSelected(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Siapa Kamu?",
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 64),

              // Custom Choice Button untuk Siswa
              milih(
                label: "Students",
                icon: SolarIconsBold.user,
                isSelected: selectedRole == "Students",
                onTap: () => onRoleSelected("Students"),
              ),

              const SizedBox(height: 24),

              // Custom Choice Button untuk Pemilik Stan
              milih(
                label: "Booth Owner",
                icon: SolarIconsBold.cartLarge,
                isSelected: selectedRole == "Booth Owner",
                onTap: () => onRoleSelected("Booth Owner"),
              ),

              const SizedBox(height: 64),

              // Deskripsi Peran
              if (selectedRole != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedRole == "Students" ? "Student" : "Booth Owner",
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      selectedRole == "Students"
                          ? "Sebagai siswa kamu harus mematuhi peraturan yang sudah ditetapkan oleh sekolah tentang peraturan yang ada di kantin. Melakukan pembayaran dengan jujur dan juga menjaga kebersihan kantin."
                          : "Sebagai pemilik stan kamu harus mematuhi peraturan yang sudah ditetapkan oleh sekolah tentang peraturan yang ada di kantin. Melakukan pengecekan pengeluaran dengan tepat dan juga menjaga kebersihan kantin.",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

              const Spacer(),
              button(
                text: "Next",
                onPressed: selectedRole != null
                    ? () {
                        // Navigasi ke halaman login
                        Navigator.pushNamed(context, '/login');
                      }
                    : null, // Disable button jika role belum dipilih
              ),
            ],
          ),
        ),
      ),
    );
  }
}
