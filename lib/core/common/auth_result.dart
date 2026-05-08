class AuthResult<T> {
  final T? data;
  final String? error;

  bool get isSuccess => data != null;

  AuthResult.success(this.data) : error = null;

  AuthResult.failure(this.error) : data = null;
}
