// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MaintenanceStruct> _$maintenanceStructSerializer =
    new _$MaintenanceStructSerializer();

class _$MaintenanceStructSerializer
    implements StructuredSerializer<MaintenanceStruct> {
  @override
  final Iterable<Type> types = const [MaintenanceStruct, _$MaintenanceStruct];
  @override
  final String wireName = 'MaintenanceStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MaintenanceStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.issue;
    if (value != null) {
      result
        ..add('issue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MaintenanceStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MaintenanceStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'issue':
          result.issue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$MaintenanceStruct extends MaintenanceStruct {
  @override
  final String? issue;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MaintenanceStruct(
          [void Function(MaintenanceStructBuilder)? updates]) =>
      (new MaintenanceStructBuilder()..update(updates))._build();

  _$MaintenanceStruct._(
      {this.issue,
      this.description,
      this.category,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MaintenanceStruct', 'firestoreUtilData');
  }

  @override
  MaintenanceStruct rebuild(void Function(MaintenanceStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaintenanceStructBuilder toBuilder() =>
      new MaintenanceStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaintenanceStruct &&
        issue == other.issue &&
        description == other.description &&
        category == other.category &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, issue.hashCode), description.hashCode),
            category.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaintenanceStruct')
          ..add('issue', issue)
          ..add('description', description)
          ..add('category', category)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MaintenanceStructBuilder
    implements Builder<MaintenanceStruct, MaintenanceStructBuilder> {
  _$MaintenanceStruct? _$v;

  String? _issue;
  String? get issue => _$this._issue;
  set issue(String? issue) => _$this._issue = issue;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MaintenanceStructBuilder() {
    MaintenanceStruct._initializeBuilder(this);
  }

  MaintenanceStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _issue = $v.issue;
      _description = $v.description;
      _category = $v.category;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaintenanceStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MaintenanceStruct;
  }

  @override
  void update(void Function(MaintenanceStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaintenanceStruct build() => _build();

  _$MaintenanceStruct _build() {
    final _$result = _$v ??
        new _$MaintenanceStruct._(
            issue: issue,
            description: description,
            category: category,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MaintenanceStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
