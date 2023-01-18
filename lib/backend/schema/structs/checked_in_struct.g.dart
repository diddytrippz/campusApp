// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checked_in_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheckedInStruct> _$checkedInStructSerializer =
    new _$CheckedInStructSerializer();

class _$CheckedInStructSerializer
    implements StructuredSerializer<CheckedInStruct> {
  @override
  final Iterable<Type> types = const [CheckedInStruct, _$CheckedInStruct];
  @override
  final String wireName = 'CheckedInStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CheckedInStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.tenantList;
    if (value != null) {
      result
        ..add('tenantList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    return result;
  }

  @override
  CheckedInStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckedInStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tenantList':
          result.tenantList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CheckedInStruct extends CheckedInStruct {
  @override
  final BuiltList<DocumentReference<Object?>>? tenantList;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CheckedInStruct([void Function(CheckedInStructBuilder)? updates]) =>
      (new CheckedInStructBuilder()..update(updates))._build();

  _$CheckedInStruct._({this.tenantList, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CheckedInStruct', 'firestoreUtilData');
  }

  @override
  CheckedInStruct rebuild(void Function(CheckedInStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckedInStructBuilder toBuilder() =>
      new CheckedInStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckedInStruct &&
        tenantList == other.tenantList &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, tenantList.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckedInStruct')
          ..add('tenantList', tenantList)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CheckedInStructBuilder
    implements Builder<CheckedInStruct, CheckedInStructBuilder> {
  _$CheckedInStruct? _$v;

  ListBuilder<DocumentReference<Object?>>? _tenantList;
  ListBuilder<DocumentReference<Object?>> get tenantList =>
      _$this._tenantList ??= new ListBuilder<DocumentReference<Object?>>();
  set tenantList(ListBuilder<DocumentReference<Object?>>? tenantList) =>
      _$this._tenantList = tenantList;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CheckedInStructBuilder() {
    CheckedInStruct._initializeBuilder(this);
  }

  CheckedInStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tenantList = $v.tenantList?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckedInStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckedInStruct;
  }

  @override
  void update(void Function(CheckedInStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckedInStruct build() => _build();

  _$CheckedInStruct _build() {
    _$CheckedInStruct _$result;
    try {
      _$result = _$v ??
          new _$CheckedInStruct._(
              tenantList: _tenantList?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'CheckedInStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tenantList';
        _tenantList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CheckedInStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
