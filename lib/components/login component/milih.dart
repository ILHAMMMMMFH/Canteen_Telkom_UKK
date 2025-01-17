import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class milih extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  const milih(
      {Key? key,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.onTap,
      this.selectedColor = const Color.fromRGBO(240, 94, 94, 1),
      this.unselectedColor = Colors.white,
      thi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: isSelected ? Colors.white : selectedColor,
          backgroundColor: isSelected ? selectedColor : unselectedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: selectedColor,
            width: 2,
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : selectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
