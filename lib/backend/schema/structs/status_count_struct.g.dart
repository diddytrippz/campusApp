// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_count_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatusCountStruct> _$statusCountStructSerializer =
    new _$StatusCountStructSerializer();

class _$StatusCountStructSerializer
    implements StructuredSerializer<StatusCountStruct> {
  @override
  final Iterable<Type> types = const [StatusCountStruct, _$StatusCountStruct];
  @override
  final String wireName = 'StatusCountStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, StatusCountStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.pending;
    if (value != null) {
      result
        ..add('pending')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  StatusCountStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusCountStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pending':
          result.pending = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$StatusCountStruct extends StatusCountStruct {
  @override
  final double? pending;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$StatusCountStruct(
          [void Function(StatusCountStructBuilder)? updates]) =>
      (new StatusCountStructBuilder()..update(updates))._build();

  _$StatusCountStruct._({this.pending, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'StatusCountStruct', 'firestoreUtilData');
  }

  @override
  StatusCountStruct rebuild(void Function(StatusCountStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusCountStructBuilder toBuilder() =>
      new StatusCountStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusCountStruct &&
        pending == other.pending &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pending.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusCountStruct')
          ..add('pending', pending)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class StatusCountStructBuilder
    implements Builder<StatusCountStruct, StatusCountStructBuilder> {
  _$StatusCountStruct? _$v;

  double? _pending;
  double? get pending => _$this._pending;
  set pending(double? pending) => _$this._pending = pending;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  StatusCountStructBuilder() {
    StatusCountStruct._initializeBuilder(this);
  }

  StatusCountStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pending = $v.pending;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusCountStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusCountStruct;
  }

  @override
  void update(void Function(StatusCountStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusCountStruct build() => _build();

  _$StatusCountStruct _build() {
    final _$result = _$v ??
        new _$StatusCountStruct._(
            pending: pending,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'StatusCountStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
