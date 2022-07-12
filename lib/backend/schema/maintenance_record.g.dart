// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MaintenanceRecord> _$maintenanceRecordSerializer =
    new _$MaintenanceRecordSerializer();

class _$MaintenanceRecordSerializer
    implements StructuredSerializer<MaintenanceRecord> {
  @override
  final Iterable<Type> types = const [MaintenanceRecord, _$MaintenanceRecord];
  @override
  final String wireName = 'MaintenanceRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MaintenanceRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.issue;
    if (value != null) {
      result
        ..add('issue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.room;
    if (value != null) {
      result
        ..add('room')
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
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('isDone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assigned;
    if (value != null) {
      result
        ..add('assigned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateTime;
    if (value != null) {
      result
        ..add('updateTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRec;
    if (value != null) {
      result
        ..add('userRec')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  MaintenanceRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MaintenanceRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'issue':
          result.issue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'building':
          result.building = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isDone':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'assigned':
          result.assigned = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateTime':
          result.updateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userRec':
          result.userRec = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$MaintenanceRecord extends MaintenanceRecord {
  @override
  final String? issue;
  @override
  final String? status;
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? displayName;
  @override
  final String? room;
  @override
  final String? building;
  @override
  final String? notes;
  @override
  final int? rating;
  @override
  final bool? isDone;
  @override
  final String? category;
  @override
  final String? assigned;
  @override
  final DateTime? updateTime;
  @override
  final DocumentReference<Object?>? userRec;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MaintenanceRecord(
          [void Function(MaintenanceRecordBuilder)? updates]) =>
      (new MaintenanceRecordBuilder()..update(updates)).build();

  _$MaintenanceRecord._(
      {this.issue,
      this.status,
      this.email,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.displayName,
      this.room,
      this.building,
      this.notes,
      this.rating,
      this.isDone,
      this.category,
      this.assigned,
      this.updateTime,
      this.userRec,
      this.ffRef})
      : super._();

  @override
  MaintenanceRecord rebuild(void Function(MaintenanceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaintenanceRecordBuilder toBuilder() =>
      new MaintenanceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaintenanceRecord &&
        issue == other.issue &&
        status == other.status &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        displayName == other.displayName &&
        room == other.room &&
        building == other.building &&
        notes == other.notes &&
        rating == other.rating &&
        isDone == other.isDone &&
        category == other.category &&
        assigned == other.assigned &&
        updateTime == other.updateTime &&
        userRec == other.userRec &&
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            issue
                                                                                .hashCode),
                                                                        status
                                                                            .hashCode),
                                                                    email
                                                                        .hashCode),
                                                                photoUrl
                                                                    .hashCode),
                                                            uid.hashCode),
                                                        createdTime.hashCode),
                                                    phoneNumber.hashCode),
                                                displayName.hashCode),
                                            room.hashCode),
                                        building.hashCode),
                                    notes.hashCode),
                                rating.hashCode),
                            isDone.hashCode),
                        category.hashCode),
                    assigned.hashCode),
                updateTime.hashCode),
            userRec.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MaintenanceRecord')
          ..add('issue', issue)
          ..add('status', status)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('displayName', displayName)
          ..add('room', room)
          ..add('building', building)
          ..add('notes', notes)
          ..add('rating', rating)
          ..add('isDone', isDone)
          ..add('category', category)
          ..add('assigned', assigned)
          ..add('updateTime', updateTime)
          ..add('userRec', userRec)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MaintenanceRecordBuilder
    implements Builder<MaintenanceRecord, MaintenanceRecordBuilder> {
  _$MaintenanceRecord? _$v;

  String? _issue;
  String? get issue => _$this._issue;
  set issue(String? issue) => _$this._issue = issue;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _room;
  String? get room => _$this._room;
  set room(String? room) => _$this._room = room;

  String? _building;
  String? get building => _$this._building;
  set building(String? building) => _$this._building = building;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  bool? _isDone;
  bool? get isDone => _$this._isDone;
  set isDone(bool? isDone) => _$this._isDone = isDone;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _assigned;
  String? get assigned => _$this._assigned;
  set assigned(String? assigned) => _$this._assigned = assigned;

  DateTime? _updateTime;
  DateTime? get updateTime => _$this._updateTime;
  set updateTime(DateTime? updateTime) => _$this._updateTime = updateTime;

  DocumentReference<Object?>? _userRec;
  DocumentReference<Object?>? get userRec => _$this._userRec;
  set userRec(DocumentReference<Object?>? userRec) => _$this._userRec = userRec;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MaintenanceRecordBuilder() {
    MaintenanceRecord._initializeBuilder(this);
  }

  MaintenanceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _issue = $v.issue;
      _status = $v.status;
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _displayName = $v.displayName;
      _room = $v.room;
      _building = $v.building;
      _notes = $v.notes;
      _rating = $v.rating;
      _isDone = $v.isDone;
      _category = $v.category;
      _assigned = $v.assigned;
      _updateTime = $v.updateTime;
      _userRec = $v.userRec;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaintenanceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MaintenanceRecord;
  }

  @override
  void update(void Function(MaintenanceRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MaintenanceRecord build() {
    final _$result = _$v ??
        new _$MaintenanceRecord._(
            issue: issue,
            status: status,
            email: email,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            displayName: displayName,
            room: room,
            building: building,
            notes: notes,
            rating: rating,
            isDone: isDone,
            category: category,
            assigned: assigned,
            updateTime: updateTime,
            userRec: userRec,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
