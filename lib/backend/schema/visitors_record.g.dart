// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VisitorsRecord> _$visitorsRecordSerializer =
    new _$VisitorsRecordSerializer();

class _$VisitorsRecordSerializer
    implements StructuredSerializer<VisitorsRecord> {
  @override
  final Iterable<Type> types = const [VisitorsRecord, _$VisitorsRecord];
  @override
  final String wireName = 'VisitorsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitorsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tenantCount',
      serializers.serialize(object.tenantCount,
          specifiedType: const FullType(CheckedInStruct)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.surname;
    if (value != null) {
      result
        ..add('surname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.arrived;
    if (value != null) {
      result
        ..add('arrived')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.departed;
    if (value != null) {
      result
        ..add('departed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tenant;
    if (value != null) {
      result
        ..add('tenant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.accessCode;
    if (value != null) {
      result
        ..add('accessCode')
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
  VisitorsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitorsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'arrived':
          result.arrived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'departed':
          result.departed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tenant':
          result.tenant = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'tenantCount':
          result.tenantCount.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CheckedInStruct))!
              as CheckedInStruct);
          break;
        case 'accessCode':
          result.accessCode = serializers.deserialize(value,
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

class _$VisitorsRecord extends VisitorsRecord {
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? contact;
  @override
  final DateTime? date;
  @override
  final bool? arrived;
  @override
  final bool? departed;
  @override
  final DocumentReference<Object?>? tenant;
  @override
  final CheckedInStruct tenantCount;
  @override
  final String? accessCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VisitorsRecord([void Function(VisitorsRecordBuilder)? updates]) =>
      (new VisitorsRecordBuilder()..update(updates))._build();

  _$VisitorsRecord._(
      {this.name,
      this.surname,
      this.contact,
      this.date,
      this.arrived,
      this.departed,
      this.tenant,
      required this.tenantCount,
      this.accessCode,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tenantCount, r'VisitorsRecord', 'tenantCount');
  }

  @override
  VisitorsRecord rebuild(void Function(VisitorsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitorsRecordBuilder toBuilder() =>
      new VisitorsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitorsRecord &&
        name == other.name &&
        surname == other.surname &&
        contact == other.contact &&
        date == other.date &&
        arrived == other.arrived &&
        departed == other.departed &&
        tenant == other.tenant &&
        tenantCount == other.tenantCount &&
        accessCode == other.accessCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, name.hashCode),
                                        surname.hashCode),
                                    contact.hashCode),
                                date.hashCode),
                            arrived.hashCode),
                        departed.hashCode),
                    tenant.hashCode),
                tenantCount.hashCode),
            accessCode.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitorsRecord')
          ..add('name', name)
          ..add('surname', surname)
          ..add('contact', contact)
          ..add('date', date)
          ..add('arrived', arrived)
          ..add('departed', departed)
          ..add('tenant', tenant)
          ..add('tenantCount', tenantCount)
          ..add('accessCode', accessCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VisitorsRecordBuilder
    implements Builder<VisitorsRecord, VisitorsRecordBuilder> {
  _$VisitorsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _contact;
  String? get contact => _$this._contact;
  set contact(String? contact) => _$this._contact = contact;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _arrived;
  bool? get arrived => _$this._arrived;
  set arrived(bool? arrived) => _$this._arrived = arrived;

  bool? _departed;
  bool? get departed => _$this._departed;
  set departed(bool? departed) => _$this._departed = departed;

  DocumentReference<Object?>? _tenant;
  DocumentReference<Object?>? get tenant => _$this._tenant;
  set tenant(DocumentReference<Object?>? tenant) => _$this._tenant = tenant;

  CheckedInStructBuilder? _tenantCount;
  CheckedInStructBuilder get tenantCount =>
      _$this._tenantCount ??= new CheckedInStructBuilder();
  set tenantCount(CheckedInStructBuilder? tenantCount) =>
      _$this._tenantCount = tenantCount;

  String? _accessCode;
  String? get accessCode => _$this._accessCode;
  set accessCode(String? accessCode) => _$this._accessCode = accessCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VisitorsRecordBuilder() {
    VisitorsRecord._initializeBuilder(this);
  }

  VisitorsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _surname = $v.surname;
      _contact = $v.contact;
      _date = $v.date;
      _arrived = $v.arrived;
      _departed = $v.departed;
      _tenant = $v.tenant;
      _tenantCount = $v.tenantCount.toBuilder();
      _accessCode = $v.accessCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitorsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitorsRecord;
  }

  @override
  void update(void Function(VisitorsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitorsRecord build() => _build();

  _$VisitorsRecord _build() {
    _$VisitorsRecord _$result;
    try {
      _$result = _$v ??
          new _$VisitorsRecord._(
              name: name,
              surname: surname,
              contact: contact,
              date: date,
              arrived: arrived,
              departed: departed,
              tenant: tenant,
              tenantCount: tenantCount.build(),
              accessCode: accessCode,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tenantCount';
        tenantCount.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VisitorsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
