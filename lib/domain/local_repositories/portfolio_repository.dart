import 'package:investify/data/remote/models/portfolio/portfolio.dart';

abstract interface class LocalPortfolioRepository {
  Future<void> savePortfolio(Portfolio portfolio);
  Future<Portfolio> getPortfolio(int id);
  Future<List<Portfolio>> getAllPortfolios();
  Future<void> deletePortfolio(int id);
}
