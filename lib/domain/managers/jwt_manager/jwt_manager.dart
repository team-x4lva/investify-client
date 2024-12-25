import 'package:jwt_decoder/jwt_decoder.dart';

class JwtManager {
  static int getId(String token) {
    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['sub'];
  }
}
