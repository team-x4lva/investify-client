import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/local/jwt_storage.dart';

class AuthManager {
  AuthStatus _status = AuthStatus.notLoggedIn;
  JwtStorage jwtStorage = JwtStorage(storage: GetIt.I<FlutterSecureStorage>());

  AuthStatus getStatus() {
    return _status;
  }

  Future<void> setId(int id) async {
    await jwtStorage.setUserId(id);
  }

  Future<int> getId() async {
    return await jwtStorage.getUserId();
  }

  Future<void> initUser() async {
    final jwt = await jwtStorage.getJwt();
    if (jwt != null) {
      _status = AuthStatus.loggedIn;
    }
  }

  Future<void> loggin(String token) async {
    await jwtStorage.setJwt(token);
    _status = AuthStatus.loggedIn;
  }

  Future<void> logout() async {
    await jwtStorage.deleteJwt();
    _status = AuthStatus.notLoggedIn;
  }
}

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}
