import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/auth/presentation/widgets/login_form.dart';
import 'package:recurrly/features/auth/presentation/widgets/logo_section.dart';
import 'package:recurrly/features/splash_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: RColor.lightBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // UPPER SECTION
              LogoSection(),

              SizedBox(height: 90),
              Text(
                'Welcome back',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
              ),
              SizedBox(height: 8),
              Text(
                'Sign in to continue managing your subscriptions.',
                style: TextStyle(fontSize: 12),
              ),

              LoginForm(),

              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "New to Recurly? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    WidgetSpan(
                      child: TextButton(
                        onPressed: () {
                          context.pushTransition(
                            type: PageTransitionType.fade,
                            child: SplashScreen(),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: RColor.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
