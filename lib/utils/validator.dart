class RValidator {
  RValidator._();

  static const String emailPattern = r'^[^\s@]+@[^\s@]+\.[^\s@]+';
  static const String specialCharRegex = r'[!@#\$%^&*(),.?":{}|<>]';
  static const String upperCaseRegex = r'[A-Z]';

  static String? emptyString(String value, String fieldName) {
    if (value.isEmpty) return '$fieldName is required';
    return null;
  }

  static String? validateEmail(String email) {
    final validation = emptyString(email, 'Email');
    if (validation != null) return validation;
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    final validation = emptyString(password, 'Password');
    if (validation != null) return validation;
    if (password.length < 6) return 'Password must be at least 6 characters';
    if (!RegExp(upperCaseRegex).hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(specialCharRegex).hasMatch(password)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validateCurrency(String value) {
    final validation = emptyString(value, 'Amount');
    if (validation != null) return validation;
    if (double.parse(value) <= 0) {
      return 'Price must be greater than 0';
    }
    return null;
  }
}
