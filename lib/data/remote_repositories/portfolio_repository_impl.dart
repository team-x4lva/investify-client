import 'package:dio/dio.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/generate_portfolio/generate_portfolio.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/data/remote/portfolio_request.dart';
import 'package:investify/domain/remote_repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final Dio dio;

  PortfolioRepositoryImpl({required this.dio});

  @override
  Future<List<Portfolio>> getPortfolios(int userId) async {
    final portfolioRequest = PortfolioRequest(dio: dio);
    final portfolios = await portfolioRequest.getPortfolioByUserId(userId);
    return portfolios;
  }

  @override
  Future<void> addPortfolio(Portfolio portfolio) async {
    final portfolioRequest = PortfolioRequest(dio: dio);
    await portfolioRequest.makePortfolio(portfolio);
  }

  @override
  Future<FinalGeneratePortfolio> generatePortfolio(
      GeneratePortfolio portfolio) async {
    final portfolioRequest = PortfolioRequest(dio: dio);
    final generatedPortfolio =
        await portfolioRequest.generatePortfolio(portfolio);
    return generatedPortfolio;
  }
}
