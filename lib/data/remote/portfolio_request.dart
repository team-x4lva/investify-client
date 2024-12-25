import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/generate_portfolio/generate_portfolio.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/data/remote/models/simulation/simulation.dart';
import 'package:investify/data/remote/models/simulation_api/simulation_api.dart';

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

  Future<int> makePortfolio(Portfolio portfolio) async {
    try {
      final data = portfolio.toJson();
      final response = await dio.post('$endpoint/api/portfolios', data: data);
      if (response.data['id'] == null) throw Exception('id in null');
      final int id = response.data['id'];
      return id;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<FinalGeneratedPortfolio> generatePortfolio(
      GeneratePortfolio portfolio) async {
    try {
      final data = portfolio.toJson();
      final response =
          await dio.post('$endpoint/api/portfolios/generate', data: data);
      return FinalGeneratedPortfolio.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SimulationApi> getSimulation(Simulation simulation) async {
    try {
      final data = simulation.toJson();
      final response = await dio.post('$endpoint/api/simulations', data: data);
      final data2 = (response.data as Map<String, dynamic>)['result'];
      return SimulationApi.fromJson(data2);
    } catch (e) {
      throw Exception(e);
    }
  }
}
