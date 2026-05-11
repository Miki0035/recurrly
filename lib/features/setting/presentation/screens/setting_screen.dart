import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recurrly/core/auth/global_auth.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:recurrly/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:recurrly/features/auth/domain/usecases/create_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/login_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/logout_usecase.dart';
import 'package:recurrly/features/auth/presentation/controller/auth_controller.dart';
import 'package:recurrly/features/auth/presentation/screens/login_screen.dart';
import 'package:recurrly/features/setting/presentation/widgets/notifications_settings_container.dart';
import 'package:recurrly/features/setting/presentation/widgets/user_profile_avatar_username_email_container.dart';
import 'package:recurrly/shared/ui/app_snackbar.dart';

class SettingScreen extends StatefulWidget {
  final int previousScreen;
  final Function(int) onNavigateBack;
  const SettingScreen({
    super.key,
    required this.previousScreen,
    required this.onNavigateBack,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _pushNotifications = false;
  bool _emailNotifications = false;
  bool _renewalReminders = false;
  bool _priceAlerts = false;

  bool _isLoading = false;

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

  Future<void> _handleLogout() async {
    setState(() => _isLoading = true);
    final result = await authController.logout();
    if (result.isSuccess) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      AppSnackbar.showSuccess(context: context, message: "Logged out");
      return context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: LoginScreen(),
      );
    }
    if (!mounted) return;
    setState(() => _isLoading = false);
    AppSnackbar.showError(context: context, message: result.error!);
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: RColors.lightBeige,

          title: Text('Delete Account', style: TextStyle(fontWeight: .w600)),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                _handleDeleteAccount();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleDeleteAccount() async {
    setState(() => _isLoading = true);
    final result = await authController.deleteAccount(
      userId: authState.currentUser!.id!,
    );
    if (result.isSuccess) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      return context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: LoginScreen(),
      );
    }
    if (!mounted) return;
    setState(() => _isLoading = false);
    AppSnackbar.showError(context: context, message: result.error!);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Padding(
            padding: .symmetric(vertical: 120),
            child: Center(child: CircularProgressIndicator()),
          )
        : Column(
            children: [
              Row(
                crossAxisAlignment: .center,
                children: [
                  GestureDetector(
                    onTap: () => widget.onNavigateBack(widget.previousScreen),
                    child: Container(
                      width: 42,
                      padding: .all(8),
                      decoration: BoxDecoration(
                        borderRadius: .circular(50),
                        border: .all(color: RColors.borderColor),
                      ),

                      child: Image.asset(RIcons.back, fit: .contain),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      'Settings',
                      textAlign: .center,
                      style: TextStyle(fontSize: 18, fontWeight: .w700),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),
              // PROFILE AVATAR WITH EMAIL
              UserProfileAvatarUsernameEmailContainer(),

              // Account Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 4,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text('Account', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text(
                        'Payment Methods',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text('****4242'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Security', style: TextStyle(fontSize: 14)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ],
                ),
              ),

              // NOTIFICATIONS SECTION
              NotificationSettingContainer(
                onPushNotificationToggle: (bool value) {
                  setState(() {
                    _pushNotifications = value;
                  });
                },
                onEmailNotificationToggle: (bool value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
                onRenewalReminderToggle: (bool value) {
                  setState(() {
                    _renewalReminders = value;
                  });
                },
                onPriceAlertToggle: (bool value) {
                  setState(() {
                    _priceAlerts = value;
                  });
                },
                pushNotification: _pushNotifications,
                emailNotification: _emailNotifications,
                renewalReminder: _renewalReminders,
                priceAlert: _priceAlerts,
              ),

              // MORE SECTION
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 4,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text('More', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    ListTile(
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 14, fontWeight: .w600),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    Divider(color: RColors.borderColor, thickness: 1),

                    ListTile(
                      title: Text(
                        'Terms of Service Policy',
                        style: TextStyle(fontSize: 14, fontWeight: .w600),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    Divider(color: RColors.borderColor, thickness: 1),

                    ListTile(
                      title: Text(
                        'Help & Support',
                        style: TextStyle(fontSize: 14, fontWeight: .w600),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    Divider(color: RColors.borderColor, thickness: 1),

                    SizedBox(height: 24),
                    ListTile(
                      onTap: _handleLogout,
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: TextStyle(fontSize: 14, fontWeight: .w600),
                      ),
                    ),

                    SizedBox(height: 12),
                    // ListTile(
                    //   onTap: _showDeleteConfirmationDialog,
                    //   tileColor: Colors.red.shade100,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: .circular(15),
                    //   ),
                    //   leading: Icon(
                    //     Icons.delete_forever_rounded,
                    //     color: Colors.red,
                    //   ),
                    //   title: Text(
                    //     'Delete Account',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: .w600,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          );
  }
}
