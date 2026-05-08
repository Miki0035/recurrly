import 'package:recurrly/core/services/supabase_service.dart';
import 'package:recurrly/features/auth/data/models/user_model.dart';

// this layer only fetches data from db or backend
class AuthRemoteDatasource {
  Future<UserModel> login(String email, String password) async {
    final response = await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception("Failed to login");
    }
    final user = response.user!;
    return UserModel.fromMap(user.userMetadata!);
  }
}
