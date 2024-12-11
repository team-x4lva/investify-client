// Конвертеры между Portfolio и PortfolioIsar
import 'package:investify/data/local/models/portfolio_isar.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';

extension PortfolioIsarMapper on Portfolio {
  PortfolioIsar toIsarModel() {
    return PortfolioIsar(
      id: id,
      name: name,
      userId: userId,
      securitiesTickers: securitiesTickers,
    );
  }
}

extension PortfolioMapper on PortfolioIsar {
  Portfolio toDomainModel() {
    return Portfolio(
      id: id,
      name: name,
      userId: userId,
      securitiesTickers: securitiesTickers,
    );
  }
}
