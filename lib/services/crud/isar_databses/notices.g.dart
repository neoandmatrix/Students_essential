// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notices.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNoticesCollection on Isar {
  IsarCollection<Notices> get notices => this.collection();
}

const NoticesSchema = CollectionSchema(
  name: r'Notices',
  id: 6253982563211053268,
  properties: {
    r'notice': PropertySchema(
      id: 0,
      name: r'notice',
      type: IsarType.string,
    )
  },
  estimateSize: _noticesEstimateSize,
  serialize: _noticesSerialize,
  deserialize: _noticesDeserialize,
  deserializeProp: _noticesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _noticesGetId,
  getLinks: _noticesGetLinks,
  attach: _noticesAttach,
  version: '3.1.0+1',
);

int _noticesEstimateSize(
  Notices object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _noticesSerialize(
  Notices object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.notice);
}

Notices _noticesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Notices();
  object.id = id;
  object.notice = reader.readStringOrNull(offsets[0]);
  return object;
}

P _noticesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _noticesGetId(Notices object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _noticesGetLinks(Notices object) {
  return [];
}

void _noticesAttach(IsarCollection<dynamic> col, Id id, Notices object) {
  object.id = id;
}

extension NoticesQueryWhereSort on QueryBuilder<Notices, Notices, QWhere> {
  QueryBuilder<Notices, Notices, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NoticesQueryWhere on QueryBuilder<Notices, Notices, QWhereClause> {
  QueryBuilder<Notices, Notices, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Notices, Notices, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Notices, Notices, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Notices, Notices, QAfterWhereClause> idBetween(
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

extension NoticesQueryFilter
    on QueryBuilder<Notices, Notices, QFilterCondition> {
  QueryBuilder<Notices, Notices, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Notices, Notices, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Notices, Notices, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notice',
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notice',
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notice',
        value: '',
      ));
    });
  }

  QueryBuilder<Notices, Notices, QAfterFilterCondition> noticeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notice',
        value: '',
      ));
    });
  }
}

extension NoticesQueryObject
    on QueryBuilder<Notices, Notices, QFilterCondition> {}

extension NoticesQueryLinks
    on QueryBuilder<Notices, Notices, QFilterCondition> {}

extension NoticesQuerySortBy on QueryBuilder<Notices, Notices, QSortBy> {
  QueryBuilder<Notices, Notices, QAfterSortBy> sortByNotice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notice', Sort.asc);
    });
  }

  QueryBuilder<Notices, Notices, QAfterSortBy> sortByNoticeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notice', Sort.desc);
    });
  }
}

extension NoticesQuerySortThenBy
    on QueryBuilder<Notices, Notices, QSortThenBy> {
  QueryBuilder<Notices, Notices, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Notices, Notices, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Notices, Notices, QAfterSortBy> thenByNotice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notice', Sort.asc);
    });
  }

  QueryBuilder<Notices, Notices, QAfterSortBy> thenByNoticeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notice', Sort.desc);
    });
  }
}

extension NoticesQueryWhereDistinct
    on QueryBuilder<Notices, Notices, QDistinct> {
  QueryBuilder<Notices, Notices, QDistinct> distinctByNotice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notice', caseSensitive: caseSensitive);
    });
  }
}

extension NoticesQueryProperty
    on QueryBuilder<Notices, Notices, QQueryProperty> {
  QueryBuilder<Notices, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Notices, String?, QQueryOperations> noticeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notice');
    });
  }
}
