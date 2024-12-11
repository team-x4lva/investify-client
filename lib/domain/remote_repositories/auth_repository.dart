import 'package:investify/data/remote/models/user/user.dart';
import 'package:investify/data/remote/models/user/user_registration/user_registration.dart';

abstract interface class AuthRepository {
  Future<int> signUp(UserRegistration user);
  Future<String> signIn(User user);
}
