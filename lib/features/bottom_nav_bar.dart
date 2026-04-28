import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recurrly/core/constants/colors.dart';

class RBottomNavBar extends StatelessWidget {
  const RBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.lightBeige,
      bottomNavigationBar: SafeArea(
        child: GNav(
          tabs: [
            GButton(icon: Icons.home),
            GButton(icon: Icons.wallet),
            GButton(icon: Icons.show_chart),
            GButton(icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}
