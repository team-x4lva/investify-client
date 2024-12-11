import 'package:dio/dio.dart';
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
  Future<Portfolio> makePortfolio(Portfolio portfolio) {
    // TODO: implement makePortfolio
    throw UnimplementedError();
  }
}
