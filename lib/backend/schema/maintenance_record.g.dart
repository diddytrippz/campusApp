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
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
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
    value = object.ticketRef;
    if (value != null) {
      result
        ..add('ticketRef')
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
    value = object.residence;
    if (value != null) {
      result
        ..add('RESIDENCE')
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
    value = object.bedCode;
    if (value != null) {
      result
        ..add('BED_CODE')
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
  MaintenanceRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MaintenanceRecordBuilder();

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
        case 'display_name':
          result.displayName = serializers.deserialize(value,
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
        case 'ticketRef':
          result.ticketRef = serializers.deserialize(value,
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
        case 'RESIDENCE':
          result.residence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CELL_NUMBER':
          result.cellNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'BED_CODE':
          result.bedCode = serializers.deserialize(value,
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
  final String? displayName;
  @override
  final String? notes;
  @override
  final int? rating;
  @override
  final String? category;
  @override
  final String? assigned;
  @override
  final DateTime? updateTime;
  @override
  final DocumentReference<Object?>? userRec;
  @override
  final String? ticketRef;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? residence;
  @override
  final String? cellNumber;
  @override
  final String? bedCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MaintenanceRecord(
          [void Function(MaintenanceRecordBuilder)? updates]) =>
      (new MaintenanceRecordBuilder()..update(updates))._build();

  _$MaintenanceRecord._(
      {this.issue,
      this.status,
      this.email,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.displayName,
      this.notes,
      this.rating,
      this.category,
      this.assigned,
      this.updateTime,
      this.userRec,
      this.ticketRef,
      this.firstName,
      this.lastName,
      this.residence,
      this.cellNumber,
      this.bedCode,
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
        displayName == other.displayName &&
        notes == other.notes &&
        rating == other.rating &&
        category == other.category &&
        assigned == other.assigned &&
        updateTime == other.updateTime &&
        userRec == other.userRec &&
        ticketRef == other.ticketRef &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        residence == other.residence &&
        cellNumber == other.cellNumber &&
        bedCode == other.bedCode &&
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
                                                                            $jc($jc(0, issue.hashCode),
                                                                                status.hashCode),
                                                                            email.hashCode),
                                                                        photoUrl.hashCode),
                                                                    uid.hashCode),
                                                                createdTime.hashCode),
                                                            displayName.hashCode),
                                                        notes.hashCode),
                                                    rating.hashCode),
                                                category.hashCode),
                                            assigned.hashCode),
                                        updateTime.hashCode),
                                    userRec.hashCode),
                                ticketRef.hashCode),
                            firstName.hashCode),
                        lastName.hashCode),
                    residence.hashCode),
                cellNumber.hashCode),
            bedCode.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaintenanceRecord')
          ..add('issue', issue)
          ..add('status', status)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('displayName', displayName)
          ..add('notes', notes)
          ..add('rating', rating)
          ..add('category', category)
          ..add('assigned', assigned)
          ..add('updateTime', updateTime)
          ..add('userRec', userRec)
          ..add('ticketRef', ticketRef)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('residence', residence)
          ..add('cellNumber', cellNumber)
          ..add('bedCode', bedCode)
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

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

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

  String? _ticketRef;
  String? get ticketRef => _$this._ticketRef;
  set ticketRef(String? ticketRef) => _$this._ticketRef = ticketRef;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _residence;
  String? get residence => _$this._residence;
  set residence(String? residence) => _$this._residence = residence;

  String? _cellNumber;
  String? get cellNumber => _$this._cellNumber;
  set cellNumber(String? cellNumber) => _$this._cellNumber = cellNumber;

  String? _bedCode;
  String? get bedCode => _$this._bedCode;
  set bedCode(String? bedCode) => _$this._bedCode = bedCode;

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
      _displayName = $v.displayName;
      _notes = $v.notes;
      _rating = $v.rating;
      _category = $v.category;
      _assigned = $v.assigned;
      _updateTime = $v.updateTime;
      _userRec = $v.userRec;
      _ticketRef = $v.ticketRef;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _residence = $v.residence;
      _cellNumber = $v.cellNumber;
      _bedCode = $v.bedCode;
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
  MaintenanceRecord build() => _build();

  _$MaintenanceRecord _build() {
    final _$result = _$v ??
        new _$MaintenanceRecord._(
            issue: issue,
            status: status,
            email: email,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            displayName: displayName,
            notes: notes,
            rating: rating,
            category: category,
            assigned: assigned,
            updateTime: updateTime,
            userRec: userRec,
            ticketRef: ticketRef,
            firstName: firstName,
            lastName: lastName,
            residence: residence,
            cellNumber: cellNumber,
            bedCode: bedCode,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
