import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class BottomNavUser extends StatelessWidget {
  final int selectedItem;
  final Function(int) onItemTapped;

  const BottomNavUser({
    Key? key,
    required this.selectedItem,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      currentIndex: selectedItem,
      onTap: onItemTapped,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        _buildBottomNavItem(
          icon: SolarIconsOutline.home,
          label: 'Home',
        ),
        _buildBottomNavItem(
          icon: SolarIconsOutline.history3,
          label: 'History',
        ),
        _buildBottomNavItem(
          icon: SolarIconsOutline.user,
          label: 'Profile',
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 24),
      activeIcon: Icon(icon, color: Colors.black, size: 28),
      label: label,
    );
  }
}
