import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/generate_portfolio/generate_portfolio.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';

abstract interface class PortfolioRepository {
  Future<List<Portfolio>> getPortfolios(int userId);
  Future<FinalGeneratedPortfolio> generatePortfolio(
      GeneratePortfolio portfolio);
  Future<int> addPortfolio(Portfolio portfolio);
}
