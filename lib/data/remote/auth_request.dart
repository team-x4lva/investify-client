import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:investify/data/models/user/user.dart';
import 'package:investify/data/models/user/user_registration/user_registration.dart';

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

  Future<int> signUpWithEmailAndPassword(UserRegistration user) async {
    try {
      final data = user.toJson();
      final response = await dio.post('$endpoint/api/auth/signup', data: data);
      final int id = response.data['id'];
      return id;
    } catch (e) {
      throw Exception(e);
    }
  }
}
