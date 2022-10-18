// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationsRecord> _$notificationsRecordSerializer =
    new _$NotificationsRecordSerializer();

class _$NotificationsRecordSerializer
    implements StructuredSerializer<NotificationsRecord> {
  @override
  final Iterable<Type> types = const [
    NotificationsRecord,
    _$NotificationsRecord
  ];
  @override
  final String wireName = 'NotificationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sentBy;
    if (value != null) {
      result
        ..add('sentBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.building;
    if (value != null) {
      result
        ..add('building')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateCreate;
    if (value != null) {
      result
        ..add('dateCreate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.urgency;
    if (value != null) {
      result
        ..add('Urgency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sendToAll;
    if (value != null) {
      result
        ..add('sendToAll')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
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
  NotificationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sentBy':
          result.sentBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'building':
          result.building = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateCreate':
          result.dateCreate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Urgency':
          result.urgency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sendToAll':
          result.sendToAll = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
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

class _$NotificationsRecord extends NotificationsRecord {
  @override
  final String? title;
  @override
  final String? sentBy;
  @override
  final String? building;
  @override
  final DateTime? dateCreate;
  @override
  final String? urgency;
  @override
  final bool? sendToAll;
  @override
  final String? link;
  @override
  final String? content;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationsRecord(
          [void Function(NotificationsRecordBuilder)? updates]) =>
      (new NotificationsRecordBuilder()..update(updates))._build();

  _$NotificationsRecord._(
      {this.title,
      this.sentBy,
      this.building,
      this.dateCreate,
      this.urgency,
      this.sendToAll,
      this.link,
      this.content,
      this.ffRef})
      : super._();

  @override
  NotificationsRecord rebuild(
          void Function(NotificationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsRecordBuilder toBuilder() =>
      new NotificationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsRecord &&
        title == other.title &&
        sentBy == other.sentBy &&
        building == other.building &&
        dateCreate == other.dateCreate &&
        urgency == other.urgency &&
        sendToAll == other.sendToAll &&
        link == other.link &&
        content == other.content &&
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
                            $jc($jc($jc(0, title.hashCode), sentBy.hashCode),
                                building.hashCode),
                            dateCreate.hashCode),
                        urgency.hashCode),
                    sendToAll.hashCode),
                link.hashCode),
            content.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsRecord')
          ..add('title', title)
          ..add('sentBy', sentBy)
          ..add('building', building)
          ..add('dateCreate', dateCreate)
          ..add('urgency', urgency)
          ..add('sendToAll', sendToAll)
          ..add('link', link)
          ..add('content', content)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationsRecordBuilder
    implements Builder<NotificationsRecord, NotificationsRecordBuilder> {
  _$NotificationsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _sentBy;
  String? get sentBy => _$this._sentBy;
  set sentBy(String? sentBy) => _$this._sentBy = sentBy;

  String? _building;
  String? get building => _$this._building;
  set building(String? building) => _$this._building = building;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime? dateCreate) => _$this._dateCreate = dateCreate;

  String? _urgency;
  String? get urgency => _$this._urgency;
  set urgency(String? urgency) => _$this._urgency = urgency;

  bool? _sendToAll;
  bool? get sendToAll => _$this._sendToAll;
  set sendToAll(bool? sendToAll) => _$this._sendToAll = sendToAll;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationsRecordBuilder() {
    NotificationsRecord._initializeBuilder(this);
  }

  NotificationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _sentBy = $v.sentBy;
      _building = $v.building;
      _dateCreate = $v.dateCreate;
      _urgency = $v.urgency;
      _sendToAll = $v.sendToAll;
      _link = $v.link;
      _content = $v.content;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsRecord;
  }

  @override
  void update(void Function(NotificationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsRecord build() => _build();

  _$NotificationsRecord _build() {
    final _$result = _$v ??
        new _$NotificationsRecord._(
            title: title,
            sentBy: sentBy,
            building: building,
            dateCreate: dateCreate,
            urgency: urgency,
            sendToAll: sendToAll,
            link: link,
            content: content,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
