import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:ukk_canteen/components/login%20component/button.dart';
import 'package:ukk_canteen/components/login%20component/milih.dart';

class PilihKriteria extends StatefulWidget {
  const PilihKriteria({Key? key}) : super(key: key);

  @override
  State<PilihKriteria> createState() => _PilihKriteriaState();
}

class _PilihKriteriaState extends State<PilihKriteria> {
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
              Milih(
                label: "Students",
                icon: SolarIconsBold.user,
                isSelected: selectedRole == "Students",
                onTap: () => onRoleSelected("Students"),
              ),
              const SizedBox(height: 24),
              Milih(
                label: "Stand Owner",
                icon: SolarIconsBold.cartLarge,
                isSelected: selectedRole == "Stand Owner",
                onTap: () => onRoleSelected("Stand Owner"),
              ),
              const SizedBox(height: 64),
              if (selectedRole != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedRole == "Students" ? "Student" : "Stand Owner",
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      selectedRole == "Students"
                          ? "Sebagai siswa kamu harus mematuhi peraturan yang sudah ditetapkan oleh sekolah tentang peraturan yang ada di kantin."
                          : "Sebagai pemilik stan kamu harus mematuhi peraturan yang sudah ditetapkan oleh sekolah tentang peraturan yang ada di kantin.",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              const Spacer(),
              Button(
                text: "Next",
                onPressed: selectedRole != null
                    ? () {
                        if (selectedRole == "Students") {
                          Navigator.pushNamed(context, '/login');
                        } else if (selectedRole == "Stand Owner") {
                          Navigator.pushNamed(context, '/loginStand');
                        }
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
