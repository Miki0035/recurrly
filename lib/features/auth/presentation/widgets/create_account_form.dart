import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:recurrly/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:recurrly/features/auth/domain/usecases/create_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/login_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/logout_usecase.dart';
import 'package:recurrly/features/auth/presentation/controller/auth_controller.dart';
import 'package:recurrly/features/bottom_nav_bar.dart';
import 'package:recurrly/shared/ui/app_snackbar.dart';
import 'package:recurrly/utils/validator.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;

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

  Future<void> _handleAccountCreation() async {
    // add loading

    //  calls auth controller
    final result = await authController.createAccount(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
    );

    // if success nav to home_screen
    if (result.isSuccess) {
      debugPrint('account has been created');
      // Guard the use of context
      if (!mounted) return;
      return context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: RBottomNavBar(),
      );
    }

    if (!mounted) return;
    // if failure show error message
    AppSnackbar.showError(
      context: context,
      message: "Failed to save subscription",
    );
  }

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
                controller: usernameController,
                validator: (val) => RValidator.emptyString(val!, 'Username'),
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your username",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                controller: emailController,
                validator: (val) => RValidator.validateEmail(val!),
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                validator: (val) => RValidator.validatePassword(val!),
                controller: passwordController,
                obscureText: obscurePassword,
                cursorColor: RColors.darkBlack,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: obscurePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                cursorColor: RColors.darkBlack,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Confirm your password",
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleAccountCreation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RColors.orange,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Create',
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
