import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get room;

  String? get building;

  String? get role;

  BuiltList<ContactsStruct>? get contactList;

  @BuiltValueField(wireName: 'RESIDENCE')
  String? get residence;

  @BuiltValueField(wireName: 'BED_CODE')
  String? get bedCode;

  @BuiltValueField(wireName: 'ROOM_TYPE')
  String? get roomType;

  @BuiltValueField(wireName: 'FIRST_NAME')
  String? get firstName;

  @BuiltValueField(wireName: 'LAST_NAME')
  String? get lastName;

  @BuiltValueField(wireName: 'CELL_NUMBER')
  String? get cellNumber;

  @BuiltValueField(wireName: 'STUDENT_NUMBER')
  String? get studentNumber;

  @BuiltValueField(wireName: 'BOOKING_REF')
  String? get bookingRef;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..phoneNumber = ''
    ..room = ''
    ..building = ''
    ..role = ''
    ..contactList = ListBuilder()
    ..residence = ''
    ..bedCode = ''
    ..roomType = ''
    ..firstName = ''
    ..lastName = ''
    ..cellNumber = ''
    ..studentNumber = ''
    ..bookingRef = ''
    ..displayName = ''
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..room = snapshot.data['room']
          ..building = snapshot.data['building']
          ..role = snapshot.data['role']
          ..contactList = safeGet(() => ListBuilder(
              snapshot.data['contactList'].map((data) => createContactsStruct(
                    name: (data as Map<String, dynamic>)['name'],
                    surname: (data as Map<String, dynamic>)['surname'],
                    contact: (data as Map<String, dynamic>)['contact'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..residence = snapshot.data['RESIDENCE']
          ..bedCode = snapshot.data['BED_CODE']
          ..roomType = snapshot.data['ROOM_TYPE']
          ..firstName = snapshot.data['FIRST_NAME']
          ..lastName = snapshot.data['LAST_NAME']
          ..cellNumber = snapshot.data['CELL_NUMBER']
          ..studentNumber = snapshot.data['STUDENT_NUMBER']
          ..bookingRef = snapshot.data['BOOKING_REF']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? room,
  String? building,
  String? role,
  String? residence,
  String? bedCode,
  String? roomType,
  String? firstName,
  String? lastName,
  String? cellNumber,
  String? studentNumber,
  String? bookingRef,
  String? displayName,
  String? photoUrl,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..room = room
        ..building = building
        ..role = role
        ..contactList = null
        ..residence = residence
        ..bedCode = bedCode
        ..roomType = roomType
        ..firstName = firstName
        ..lastName = lastName
        ..cellNumber = cellNumber
        ..studentNumber = studentNumber
        ..bookingRef = bookingRef
        ..displayName = displayName
        ..photoUrl = photoUrl,
    ),
  );

  return firestoreData;
}
