import 'package:investify/data/local/models/portfolio/portfolio_isar_model.dart';
import 'package:investify/data/local/models/security/security_isar_model.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/data/remote/models/security/security.dart';

extension PortfolioExtensions on Portfolio {
  PortfolioIsar toIsarModel() {
    final portfolioIsar = PortfolioIsar()
      ..name = name
      ..userId = userId
      ..securities = securities
      ..share = share;

    return portfolioIsar;
  }
}

extension PortfolioIsarExtensions on PortfolioIsar {
  Portfolio toDomainModel() {
    return Portfolio(
      id: id,
      name: name,
      userId: userId,
      securities: securities,
      share: share,
    );
  }
}

extension SecurityExtensions on Security {
  SecurityIsar toIsarModel() {
    return SecurityIsar()
      ..name = name
      ..ticker = ticker
      ..category = category
      ..isProfitable = isProfitable
      ..volatility = volatility;
  }
}

extension SecurityIsarExtensions on SecurityIsar {
  Security toDomainModel() {
    return Security(
      id: id,
      name: name,
      ticker: ticker,
      category: category,
      isProfitable: isProfitable,
      volatility: volatility,
    );
  }
}
