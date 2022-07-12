// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChecklistRecord> _$checklistRecordSerializer =
    new _$ChecklistRecordSerializer();

class _$ChecklistRecordSerializer
    implements StructuredSerializer<ChecklistRecord> {
  @override
  final Iterable<Type> types = const [ChecklistRecord, _$ChecklistRecord];
  @override
  final String wireName = 'ChecklistRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChecklistRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ChecklistRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChecklistRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$ChecklistRecord extends ChecklistRecord {
  @override
  final String? description;
  @override
  final BuiltList<String>? options;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChecklistRecord([void Function(ChecklistRecordBuilder)? updates]) =>
      (new ChecklistRecordBuilder()..update(updates)).build();

  _$ChecklistRecord._({this.description, this.options, this.ffRef}) : super._();

  @override
  ChecklistRecord rebuild(void Function(ChecklistRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChecklistRecordBuilder toBuilder() =>
      new ChecklistRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChecklistRecord &&
        description == other.description &&
        options == other.options &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, description.hashCode), options.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChecklistRecord')
          ..add('description', description)
          ..add('options', options)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChecklistRecordBuilder
    implements Builder<ChecklistRecord, ChecklistRecordBuilder> {
  _$ChecklistRecord? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _options;
  ListBuilder<String> get options =>
      _$this._options ??= new ListBuilder<String>();
  set options(ListBuilder<String>? options) => _$this._options = options;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChecklistRecordBuilder() {
    ChecklistRecord._initializeBuilder(this);
  }

  ChecklistRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _options = $v.options?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChecklistRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChecklistRecord;
  }

  @override
  void update(void Function(ChecklistRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChecklistRecord build() {
    _$ChecklistRecord _$result;
    try {
      _$result = _$v ??
          new _$ChecklistRecord._(
              description: description,
              options: _options?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChecklistRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
