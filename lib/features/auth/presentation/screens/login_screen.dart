import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/auth/presentation/widgets/create_account_form.dart';
import 'package:recurrly/features/auth/presentation/widgets/login_form.dart';
import 'package:recurrly/features/auth/presentation/widgets/logo_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool createAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: RColors.lightBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // UPPER SECTION
              LogoSection(),

              SizedBox(height: 90),
              Text(
                createAccount ? 'Create an account' : 'Welcome back',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
              ),
              SizedBox(height: 8),
              Text(
                createAccount
                    ? 'Create an account to manage your subscriptions.'
                    : 'Sign in to continue managing your subscriptions.',
                style: TextStyle(fontSize: 12),
              ),

              createAccount ? CreateAccountForm() : LoginForm(),

              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: createAccount
                          ? "Already have an account? "
                          : "New to Recurly? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    WidgetSpan(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            createAccount = !createAccount;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          createAccount ? "Sign in" : "Create an account",
                          style: TextStyle(
                            color: RColors.orange,
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
