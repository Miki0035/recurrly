import 'package:flutter/material.dart';

class AppSnackbar {
  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontWeight: .w600)),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontWeight: .w600)),
        backgroundColor: Colors.red,
      ),
    );
  }
}
