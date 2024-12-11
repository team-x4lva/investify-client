import 'package:isar/isar.dart';

part 'portfolio_isar_model.g.dart';

@collection
class PortfolioIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late int userId;

  late List<int> securities;

  late List<int> share;

  PortfolioIsar();
}
