import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/data/remote/models/user/user_registration/user_registration.dart';

class PortfolioRequest {
  PortfolioRequest({
    required this.dio,
  });
  final Dio dio;
  final endpoint = dotenv.get('ENDPOINT');

  Future<List<Portfolio>> getPortfolioByUserId(int userid) async {
    try {
      final response = await dio.get('$endpoint/api/users/$userid/portfolios');
      List<Portfolio> portfolios =
          response.data.map((e) => Portfolio.fromJson(e)).toList();
      return portfolios;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> makePortfolio(Portfolio portfolio) async {
    try {
      final data = portfolio.toJson();
      final response = await dio.post('$endpoint/api/portfolios', data: data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
