import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/bottom_nav_bar.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: RColors.borderColor),
          ),
          child: Column(
            children: [
              TextFormField(
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your full name",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                // obscureText: true,
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                // obscureText: true,
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Confirm your password",
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TO BE REMOVED
                    context.pushReplacementTransition(
                      type: PageTransitionType.fade,
                      child: RBottomNavBar(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RColors.orange,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
