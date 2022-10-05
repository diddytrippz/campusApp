// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatusRecord> _$statusRecordSerializer =
    new _$StatusRecordSerializer();

class _$StatusRecordSerializer implements StructuredSerializer<StatusRecord> {
  @override
  final Iterable<Type> types = const [StatusRecord, _$StatusRecord];
  @override
  final String wireName = 'StatusRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StatusRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.counter;
    if (value != null) {
      result
        ..add('counter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(StatusCountStruct)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  StatusRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'counter':
          result.counter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(StatusCountStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$StatusRecord extends StatusRecord {
  @override
  final BuiltList<StatusCountStruct>? counter;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StatusRecord([void Function(StatusRecordBuilder)? updates]) =>
      (new StatusRecordBuilder()..update(updates))._build();

  _$StatusRecord._({this.counter, this.ffRef}) : super._();

  @override
  StatusRecord rebuild(void Function(StatusRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusRecordBuilder toBuilder() => new StatusRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusRecord &&
        counter == other.counter &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, counter.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusRecord')
          ..add('counter', counter)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StatusRecordBuilder
    implements Builder<StatusRecord, StatusRecordBuilder> {
  _$StatusRecord? _$v;

  ListBuilder<StatusCountStruct>? _counter;
  ListBuilder<StatusCountStruct> get counter =>
      _$this._counter ??= new ListBuilder<StatusCountStruct>();
  set counter(ListBuilder<StatusCountStruct>? counter) =>
      _$this._counter = counter;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StatusRecordBuilder() {
    StatusRecord._initializeBuilder(this);
  }

  StatusRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _counter = $v.counter?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusRecord;
  }

  @override
  void update(void Function(StatusRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusRecord build() => _build();

  _$StatusRecord _build() {
    _$StatusRecord _$result;
    try {
      _$result =
          _$v ?? new _$StatusRecord._(counter: _counter?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'counter';
        _counter?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StatusRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
