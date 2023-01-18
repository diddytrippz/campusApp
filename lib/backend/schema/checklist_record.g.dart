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
    value = object.gallery;
    if (value != null) {
      result
        ..add('gallery')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gallery':
          result.gallery = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final String? gallery;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChecklistRecord([void Function(ChecklistRecordBuilder)? updates]) =>
      (new ChecklistRecordBuilder()..update(updates))._build();

  _$ChecklistRecord._({this.gallery, this.ffRef}) : super._();

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
        gallery == other.gallery &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, gallery.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChecklistRecord')
          ..add('gallery', gallery)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChecklistRecordBuilder
    implements Builder<ChecklistRecord, ChecklistRecordBuilder> {
  _$ChecklistRecord? _$v;

  String? _gallery;
  String? get gallery => _$this._gallery;
  set gallery(String? gallery) => _$this._gallery = gallery;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChecklistRecordBuilder() {
    ChecklistRecord._initializeBuilder(this);
  }

  ChecklistRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gallery = $v.gallery;
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
  ChecklistRecord build() => _build();

  _$ChecklistRecord _build() {
    final _$result =
        _$v ?? new _$ChecklistRecord._(gallery: gallery, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
