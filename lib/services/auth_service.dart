class AuthService {
  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();
  Future<bool> login(String username, String password) async {
    // print("$username - $password");
    return false;
  }
}
