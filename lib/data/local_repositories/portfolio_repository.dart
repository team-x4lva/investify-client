import 'package:investify/data/local/models/isar_exstentions.dart';
import 'package:investify/data/local/portfolios_storage.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/domain/local_repositories/portfolio_repository.dart';
import 'package:isar/isar.dart';

class LocalPortfolioRepositoryImpl implements LocalPortfolioRepository {
  final Isar storage;

  LocalPortfolioRepositoryImpl({required this.storage});
  @override
  Future<Portfolio> getPortfolio(int id) async {
    final localStorage = PortfolioStorage(storage);
    final isarPortfolio = await localStorage.getPortfolioById(id);
    final portfolio = isarPortfolio?.toDomainModel();
    if (portfolio == null) throw Exception("Portfolio not found");
    return portfolio;
  }

  @override
  Future<void> savePortfolio(Portfolio portfolio) async {
    final localStorage = PortfolioStorage(storage);
    await localStorage.savePortfolio(portfolio.toIsarModel());
  }

  @override
  Future<List<Portfolio>> getAllPortfolios() async {
    final localStorage = PortfolioStorage(storage);
    final isarPosrtfolios = await localStorage.getAllPortfolios();
    return isarPosrtfolios.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<void> deletePortfolio(int id) async {
    final localStorage = PortfolioStorage(storage);
    await localStorage.deletePortfolio(id);
  }
}
