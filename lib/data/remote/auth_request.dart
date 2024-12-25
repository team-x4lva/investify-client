import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:investify/data/remote/models/user/user.dart';
import 'package:investify/data/remote/models/user/user_registration/user_registration.dart';

class AuthRequest {
  AuthRequest({
    required this.dio,
  });
  final Dio dio;
  final endpoint = dotenv.get('ENDPOINT');

  Future<String> signInWithEmailAndPassword(User user) async {
    try {
      final data = user.toJson();
      final response = await dio.post('$endpoint/api/auth/signin', data: data);
      return response.data['accessToken'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUpWithEmailAndPassword(UserRegistration user) async {
    try {
      final data = user.toJson();
      await dio.post('$endpoint/api/auth/signup', data: data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
