import 'package:flutter/material.dart';
import 'package:recurrly/core/auth/global_auth.dart';
import 'package:recurrly/core/theme/app_theme.dart';
import 'package:recurrly/features/bottom_nav_bar.dart';
import 'package:recurrly/features/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: RAppTheme.lightTheme,
      home: ListenableBuilder(
        listenable: authState,
        builder: (context, child) =>
            authState.isLoggedIn ? RBottomNavBar() : SplashScreen(),
      ),
    );
  }
}
