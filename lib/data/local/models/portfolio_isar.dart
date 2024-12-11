import 'package:isar/isar.dart';

part 'portfolio_isar.g.dart';

@Collection()
class PortfolioIsar {
  PortfolioIsar({
    required this.id,
    required this.name,
    required this.userId,
    required this.securitiesTickers,
  });

  Id id;
  String name;
  int userId;

  @Index(type: IndexType.hash)
  List<String> securitiesTickers;
}
