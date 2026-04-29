import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/home/presentation/screens/home_screen.dart';
import 'package:recurrly/features/insight/presentation/screens/insight_screen.dart';
import 'package:recurrly/features/setting/presentation/screens/setting_screen.dart';
import 'package:recurrly/features/subscription/presentation/screens/subscription_screen.dart';

class RBottomNavBar extends StatefulWidget {
  const RBottomNavBar({super.key});

  @override
  State<RBottomNavBar> createState() => _RBottomNavBarState();
}

class _RBottomNavBarState extends State<RBottomNavBar> {
  List<Widget> get _pages => [
    HomeScreen(onNavigateToSubscription: () => changeTab(1)),
    SubscriptionScreen(),
    InsightScreen(),
    SettingScreen(),
  ];

  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.lightBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 28),

          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: GNav(
              color: Colors.white,
              backgroundColor: RColors.darkBlack,
              tabBackgroundColor: RColors.orange,
              activeColor: Colors.white,
              tabBorderRadius: 50,
              selectedIndex: _selectedIndex,
              gap: 5,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  padding: .all(12),
                  margin: .only(left: 12),
                ),
                GButton(icon: Icons.wallet, padding: .all(12)),
                GButton(icon: Icons.show_chart, padding: .all(12)),
                GButton(
                  icon: Icons.settings,
                  padding: .all(12),
                  margin: .only(right: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
