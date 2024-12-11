// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSecurityIsarCollection on Isar {
  IsarCollection<SecurityIsar> get securityIsars => this.collection();
}

const SecurityIsarSchema = CollectionSchema(
  name: r'SecurityIsar',
  id: 416819839685722578,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'isProfitable': PropertySchema(
      id: 1,
      name: r'isProfitable',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'ticker': PropertySchema(
      id: 3,
      name: r'ticker',
      type: IsarType.string,
    ),
    r'volatility': PropertySchema(
      id: 4,
      name: r'volatility',
      type: IsarType.double,
    )
  },
  estimateSize: _securityIsarEstimateSize,
  serialize: _securityIsarSerialize,
  deserialize: _securityIsarDeserialize,
  deserializeProp: _securityIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _securityIsarGetId,
  getLinks: _securityIsarGetLinks,
  attach: _securityIsarAttach,
  version: '3.1.0+1',
);

int _securityIsarEstimateSize(
  SecurityIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.ticker.length * 3;
  return bytesCount;
}

void _securityIsarSerialize(
  SecurityIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeBool(offsets[1], object.isProfitable);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.ticker);
  writer.writeDouble(offsets[4], object.volatility);
}

SecurityIsar _securityIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SecurityIsar();
  object.category = reader.readString(offsets[0]);
  object.id = id;
  object.isProfitable = reader.readBoolOrNull(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.ticker = reader.readString(offsets[3]);
  object.volatility = reader.readDouble(offsets[4]);
  return object;
}

P _securityIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _securityIsarGetId(SecurityIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _securityIsarGetLinks(SecurityIsar object) {
  return [];
}

void _securityIsarAttach(
    IsarCollection<dynamic> col, Id id, SecurityIsar object) {
  object.id = id;
}

extension SecurityIsarQueryWhereSort
    on QueryBuilder<SecurityIsar, SecurityIsar, QWhere> {
  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SecurityIsarQueryWhere
    on QueryBuilder<SecurityIsar, SecurityIsar, QWhereClause> {
  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SecurityIsarQueryFilter
    on QueryBuilder<SecurityIsar, SecurityIsar, QFilterCondition> {
  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      isProfitableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isProfitable',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      isProfitableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isProfitable',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      isProfitableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isProfitable',
        value: value,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> tickerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> tickerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticker',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition> tickerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticker',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticker',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      tickerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticker',
        value: '',
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      volatilityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volatility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      volatilityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volatility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      volatilityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volatility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterFilterCondition>
      volatilityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volatility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SecurityIsarQueryObject
    on QueryBuilder<SecurityIsar, SecurityIsar, QFilterCondition> {}

extension SecurityIsarQueryLinks
    on QueryBuilder<SecurityIsar, SecurityIsar, QFilterCondition> {}

extension SecurityIsarQuerySortBy
    on QueryBuilder<SecurityIsar, SecurityIsar, QSortBy> {
  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy>
      sortByIsProfitableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByTicker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticker', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByTickerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticker', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> sortByVolatility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volatility', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy>
      sortByVolatilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volatility', Sort.desc);
    });
  }
}

extension SecurityIsarQuerySortThenBy
    on QueryBuilder<SecurityIsar, SecurityIsar, QSortThenBy> {
  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy>
      thenByIsProfitableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByTicker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticker', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByTickerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticker', Sort.desc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy> thenByVolatility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volatility', Sort.asc);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QAfterSortBy>
      thenByVolatilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volatility', Sort.desc);
    });
  }
}

extension SecurityIsarQueryWhereDistinct
    on QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> {
  QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> distinctByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isProfitable');
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> distinctByTicker(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticker', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SecurityIsar, SecurityIsar, QDistinct> distinctByVolatility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volatility');
    });
  }
}

extension SecurityIsarQueryProperty
    on QueryBuilder<SecurityIsar, SecurityIsar, QQueryProperty> {
  QueryBuilder<SecurityIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SecurityIsar, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<SecurityIsar, bool?, QQueryOperations> isProfitableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isProfitable');
    });
  }

  QueryBuilder<SecurityIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SecurityIsar, String, QQueryOperations> tickerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticker');
    });
  }

  QueryBuilder<SecurityIsar, double, QQueryOperations> volatilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volatility');
    });
  }
}
