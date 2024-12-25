// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPortfolioIsarCollection on Isar {
  IsarCollection<PortfolioIsar> get portfolioIsars => this.collection();
}

const PortfolioIsarSchema = CollectionSchema(
  name: r'PortfolioIsar',
  id: 463808185524146165,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'securities': PropertySchema(
      id: 1,
      name: r'securities',
      type: IsarType.longList,
    ),
    r'share': PropertySchema(
      id: 2,
      name: r'share',
      type: IsarType.doubleList,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _portfolioIsarEstimateSize,
  serialize: _portfolioIsarSerialize,
  deserialize: _portfolioIsarDeserialize,
  deserializeProp: _portfolioIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _portfolioIsarGetId,
  getLinks: _portfolioIsarGetLinks,
  attach: _portfolioIsarAttach,
  version: '3.1.0+1',
);

int _portfolioIsarEstimateSize(
  PortfolioIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.securities.length * 8;
  bytesCount += 3 + object.share.length * 8;
  return bytesCount;
}

void _portfolioIsarSerialize(
  PortfolioIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeLongList(offsets[1], object.securities);
  writer.writeDoubleList(offsets[2], object.share);
  writer.writeLong(offsets[3], object.userId);
}

PortfolioIsar _portfolioIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PortfolioIsar();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.securities = reader.readLongList(offsets[1]) ?? [];
  object.share = reader.readDoubleList(offsets[2]) ?? [];
  object.userId = reader.readLong(offsets[3]);
  return object;
}

P _portfolioIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _portfolioIsarGetId(PortfolioIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _portfolioIsarGetLinks(PortfolioIsar object) {
  return [];
}

void _portfolioIsarAttach(
    IsarCollection<dynamic> col, Id id, PortfolioIsar object) {
  object.id = id;
}

extension PortfolioIsarQueryWhereSort
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QWhere> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PortfolioIsarQueryWhere
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QWhereClause> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterWhereClause> idBetween(
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

extension PortfolioIsarQueryFilter
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QFilterCondition> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'securities',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'securities',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'securities',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'securities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      securitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'securities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'share',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      shareLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'share',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PortfolioIsarQueryObject
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QFilterCondition> {}

extension PortfolioIsarQueryLinks
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QFilterCondition> {}

extension PortfolioIsarQuerySortBy
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QSortBy> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension PortfolioIsarQuerySortThenBy
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QSortThenBy> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension PortfolioIsarQueryWhereDistinct
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QDistinct> {
  QueryBuilder<PortfolioIsar, PortfolioIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QDistinct> distinctBySecurities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'securities');
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QDistinct> distinctByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'share');
    });
  }

  QueryBuilder<PortfolioIsar, PortfolioIsar, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension PortfolioIsarQueryProperty
    on QueryBuilder<PortfolioIsar, PortfolioIsar, QQueryProperty> {
  QueryBuilder<PortfolioIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PortfolioIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PortfolioIsar, List<int>, QQueryOperations>
      securitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'securities');
    });
  }

  QueryBuilder<PortfolioIsar, List<double>, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<PortfolioIsar, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
