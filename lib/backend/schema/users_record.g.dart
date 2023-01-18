// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactList;
    if (value != null) {
      result
        ..add('contactList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ContactsStruct)])));
    }
    value = object.residence;
    if (value != null) {
      result
        ..add('RESIDENCE')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bedCode;
    if (value != null) {
      result
        ..add('BED_CODE')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roomType;
    if (value != null) {
      result
        ..add('ROOM_TYPE')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('FIRST_NAME')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('LAST_NAME')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cellNumber;
    if (value != null) {
      result
        ..add('CELL_NUMBER')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.studentNumber;
    if (value != null) {
      result
        ..add('STUDENT_NUMBER')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('BOOKING_REF')
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
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
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
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'building':
          result.building = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contactList':
          result.contactList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ContactsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'RESIDENCE':
          result.residence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'BED_CODE':
          result.bedCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ROOM_TYPE':
          result.roomType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FIRST_NAME':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'LAST_NAME':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CELL_NUMBER':
          result.cellNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'STUDENT_NUMBER':
          result.studentNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'BOOKING_REF':
          result.bookingRef = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? room;
  @override
  final String? building;
  @override
  final String? role;
  @override
  final BuiltList<ContactsStruct>? contactList;
  @override
  final String? residence;
  @override
  final String? bedCode;
  @override
  final String? roomType;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? cellNumber;
  @override
  final String? studentNumber;
  @override
  final String? bookingRef;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.room,
      this.building,
      this.role,
      this.contactList,
      this.residence,
      this.bedCode,
      this.roomType,
      this.firstName,
      this.lastName,
      this.cellNumber,
      this.studentNumber,
      this.bookingRef,
      this.displayName,
      this.photoUrl,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        room == other.room &&
        building == other.building &&
        role == other.role &&
        contactList == other.contactList &&
        residence == other.residence &&
        bedCode == other.bedCode &&
        roomType == other.roomType &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        cellNumber == other.cellNumber &&
        studentNumber == other.studentNumber &&
        bookingRef == other.bookingRef &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
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
                                                                            $jc(
                                                                                0,
                                                                                email
                                                                                    .hashCode),
                                                                            uid
                                                                                .hashCode),
                                                                        createdTime
                                                                            .hashCode),
                                                                    phoneNumber
                                                                        .hashCode),
                                                                room.hashCode),
                                                            building.hashCode),
                                                        role.hashCode),
                                                    contactList.hashCode),
                                                residence.hashCode),
                                            bedCode.hashCode),
                                        roomType.hashCode),
                                    firstName.hashCode),
                                lastName.hashCode),
                            cellNumber.hashCode),
                        studentNumber.hashCode),
                    bookingRef.hashCode),
                displayName.hashCode),
            photoUrl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('room', room)
          ..add('building', building)
          ..add('role', role)
          ..add('contactList', contactList)
          ..add('residence', residence)
          ..add('bedCode', bedCode)
          ..add('roomType', roomType)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('cellNumber', cellNumber)
          ..add('studentNumber', studentNumber)
          ..add('bookingRef', bookingRef)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _room;
  String? get room => _$this._room;
  set room(String? room) => _$this._room = room;

  String? _building;
  String? get building => _$this._building;
  set building(String? building) => _$this._building = building;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  ListBuilder<ContactsStruct>? _contactList;
  ListBuilder<ContactsStruct> get contactList =>
      _$this._contactList ??= new ListBuilder<ContactsStruct>();
  set contactList(ListBuilder<ContactsStruct>? contactList) =>
      _$this._contactList = contactList;

  String? _residence;
  String? get residence => _$this._residence;
  set residence(String? residence) => _$this._residence = residence;

  String? _bedCode;
  String? get bedCode => _$this._bedCode;
  set bedCode(String? bedCode) => _$this._bedCode = bedCode;

  String? _roomType;
  String? get roomType => _$this._roomType;
  set roomType(String? roomType) => _$this._roomType = roomType;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _cellNumber;
  String? get cellNumber => _$this._cellNumber;
  set cellNumber(String? cellNumber) => _$this._cellNumber = cellNumber;

  String? _studentNumber;
  String? get studentNumber => _$this._studentNumber;
  set studentNumber(String? studentNumber) =>
      _$this._studentNumber = studentNumber;

  String? _bookingRef;
  String? get bookingRef => _$this._bookingRef;
  set bookingRef(String? bookingRef) => _$this._bookingRef = bookingRef;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _room = $v.room;
      _building = $v.building;
      _role = $v.role;
      _contactList = $v.contactList?.toBuilder();
      _residence = $v.residence;
      _bedCode = $v.bedCode;
      _roomType = $v.roomType;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _cellNumber = $v.cellNumber;
      _studentNumber = $v.studentNumber;
      _bookingRef = $v.bookingRef;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              room: room,
              building: building,
              role: role,
              contactList: _contactList?.build(),
              residence: residence,
              bedCode: bedCode,
              roomType: roomType,
              firstName: firstName,
              lastName: lastName,
              cellNumber: cellNumber,
              studentNumber: studentNumber,
              bookingRef: bookingRef,
              displayName: displayName,
              photoUrl: photoUrl,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contactList';
        _contactList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
