import 'package:flutter/foundation.dart';
import 'package:recurrly/core/services/supabase_service.dart';
import 'package:recurrly/features/auth/domain/entities/user_entity.dart';

class AuthState extends ChangeNotifier {
  UserEntity? _currentUser;

  UserEntity? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  AuthState() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    SupabaseService.client.auth.onAuthStateChange.listen((event) {
      final user = event.session?.user;
      if (user != null) {
        _currentUser = UserEntity(
          id: user.id,
          email: user.email,
          username: user.userMetadata!['username'],
        );
      } else {
        _currentUser = null;
      }
      notifyListeners();
    });
  }
}
