import 'package:investify/data/local/models/portfolio_isar.dart';
import 'package:isar/isar.dart';

class PortfolioStorage {
  final Isar _isar;

  PortfolioStorage(this._isar);

  Future<void> savePortfolio(PortfolioIsar portfolio) async {
    await _isar.writeTxn(() async {
      await _isar.portfolioIsars.put(portfolio);
    });
  }

  Future<PortfolioIsar?> getPortfolioById(int id) async {
    return await _isar.portfolioIsars.get(id);
  }

  Future<List<PortfolioIsar>> getAllPortfolios() async {
    return await _isar.portfolioIsars.where().findAll();
  }

  Future<void> updatePortfolioName(int id, String newName) async {
    await _isar.writeTxn(() async {
      final portfolio = await _isar.portfolioIsars.get(id);
      if (portfolio != null) {
        portfolio.name = newName;
        await _isar.portfolioIsars.put(portfolio);
      }
    });
  }

  Future<void> deletePortfolio(int id) async {
    await _isar.writeTxn(() async {
      await _isar.portfolioIsars.delete(id);
    });
  }

  Future<void> deleteAllPortfolios() async {
    await _isar.writeTxn(() async {
      await _isar.portfolioIsars.where().deleteAll();
    });
  }
}
