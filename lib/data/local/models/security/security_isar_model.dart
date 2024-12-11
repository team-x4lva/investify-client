import 'package:isar/isar.dart';

part 'security_isar_model.g.dart';

@collection
class SecurityIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late String ticker;
  late String category;
  late bool? isProfitable;
  late double volatility;

  SecurityIsar();
}
