import 'package:investify/data/remote/models/portfolio/portfolio.dart';

abstract interface class PortfolioRepository {
  Future<List<Portfolio>> getPortfolios(int userId);
  Future<Portfolio> makePortfolio(Portfolio portfolio);
}
