import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:recurrly/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:recurrly/features/auth/domain/usecases/create_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/login_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/logout_usecase.dart';
import 'package:recurrly/features/auth/presentation/controller/auth_controller.dart';
import 'package:recurrly/features/bottom_nav_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  late AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = AuthController(
      LoginUsecase(AuthRepositoryImpl(AuthRemoteDatasource())),
      CreateAccountUsecase(AuthRepositoryImpl(AuthRemoteDatasource())),
      LogoutUsecase(AuthRepositoryImpl(AuthRemoteDatasource())),
      DeleteAccountUsecase(AuthRepositoryImpl(AuthRemoteDatasource())),
    );
  }

  Future<void> handleLogin() async {
    // add loading
    setState(() => isLoading = true);
    //  calls auth controller
    final result = await authController.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    // if success nav to home_screen
    if (result.isSuccess) {
      setState(() => isLoading = false);
      debugPrint('user has been signed in');
      // Guard the use of context
      if (!mounted) return;
      return context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: RBottomNavBar(),
      );
    }

    setState(() => isLoading = false);
    if (!mounted) return;
    // if failure show error message
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(result.error!)));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 120),
            child: Center(child: CircularProgressIndicator()),
          )
        : Form(
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
                      controller: emailController,
                      cursorColor: RColors.darkBlack,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                      ),
                    ),

                    SizedBox(height: 24),

                    TextFormField(
                      // obscureText: true,
                      controller: passwordController,
                      cursorColor: RColors.darkBlack,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                      ),
                    ),

                    SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: handleLogin,
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
