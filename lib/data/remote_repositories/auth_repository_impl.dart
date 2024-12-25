import 'package:dio/dio.dart';
import 'package:investify/data/remote/models/user/user.dart';
import 'package:investify/data/remote/models/user/user_registration/user_registration.dart';
import 'package:investify/data/remote/auth_request.dart';
import 'package:investify/domain/remote_repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl({required this.dio});
  @override
  Future<void> signUp(UserRegistration user) async {
    final authRequest = AuthRequest(dio: dio);
    await authRequest.signUpWithEmailAndPassword(user);
  }

  @override
  Future<String> signIn(User user) async {
    final authRequest = AuthRequest(dio: dio);
    final String jwt = await authRequest.signInWithEmailAndPassword(user);
    return jwt;
  }
}
