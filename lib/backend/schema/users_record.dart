import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "RESIDENCE" field.
  String? _residence;
  String get residence => _residence ?? '';
  bool hasResidence() => _residence != null;

  // "BED_CODE" field.
  String? _bedCode;
  String get bedCode => _bedCode ?? '';
  bool hasBedCode() => _bedCode != null;

  // "ROOM_TYPE" field.
  String? _roomType;
  String get roomType => _roomType ?? '';
  bool hasRoomType() => _roomType != null;

  // "FIRST_NAME" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LAST_NAME" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "CELL_NUMBER" field.
  String? _cellNumber;
  String get cellNumber => _cellNumber ?? '';
  bool hasCellNumber() => _cellNumber != null;

  // "STUDENT_NUMBER" field.
  String? _studentNumber;
  String get studentNumber => _studentNumber ?? '';
  bool hasStudentNumber() => _studentNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "inspectionDone" field.
  bool? _inspectionDone;
  bool get inspectionDone => _inspectionDone ?? false;
  bool hasInspectionDone() => _inspectionDone != null;

  // "lease" field.
  LeaseStruct? _lease;
  LeaseStruct get lease => _lease ?? LeaseStruct();
  bool hasLease() => _lease != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _role = snapshotData['role'] as String?;
    _residence = snapshotData['RESIDENCE'] as String?;
    _bedCode = snapshotData['BED_CODE'] as String?;
    _roomType = snapshotData['ROOM_TYPE'] as String?;
    _firstName = snapshotData['FIRST_NAME'] as String?;
    _lastName = snapshotData['LAST_NAME'] as String?;
    _cellNumber = snapshotData['CELL_NUMBER'] as String?;
    _studentNumber = snapshotData['STUDENT_NUMBER'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _inspectionDone = snapshotData['inspectionDone'] as bool?;
    _lease = snapshotData['lease'] is LeaseStruct
        ? snapshotData['lease']
        : LeaseStruct.maybeFromMap(snapshotData['lease']);
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'role': snapshot.data['role'],
          'RESIDENCE': snapshot.data['RESIDENCE'],
          'BED_CODE': snapshot.data['BED_CODE'],
          'ROOM_TYPE': snapshot.data['ROOM_TYPE'],
          'FIRST_NAME': snapshot.data['FIRST_NAME'],
          'LAST_NAME': snapshot.data['LAST_NAME'],
          'CELL_NUMBER': snapshot.data['CELL_NUMBER'],
          'STUDENT_NUMBER': snapshot.data['STUDENT_NUMBER'],
          'photo_url': snapshot.data['photo_url'],
          'inspectionDone': snapshot.data['inspectionDone'],
          'lease':
              LeaseStruct.fromAlgoliaData(snapshot.data['lease'] ?? {}).toMap(),
          'uid': snapshot.data['uid'],
          'phone_number': snapshot.data['phone_number'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'display_name': snapshot.data['display_name'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? role,
  String? residence,
  String? bedCode,
  String? roomType,
  String? firstName,
  String? lastName,
  String? cellNumber,
  String? studentNumber,
  String? photoUrl,
  bool? inspectionDone,
  LeaseStruct? lease,
  String? uid,
  String? phoneNumber,
  DateTime? createdTime,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'role': role,
      'RESIDENCE': residence,
      'BED_CODE': bedCode,
      'ROOM_TYPE': roomType,
      'FIRST_NAME': firstName,
      'LAST_NAME': lastName,
      'CELL_NUMBER': cellNumber,
      'STUDENT_NUMBER': studentNumber,
      'photo_url': photoUrl,
      'inspectionDone': inspectionDone,
      'lease': LeaseStruct().toMap(),
      'uid': uid,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'display_name': displayName,
    }.withoutNulls,
  );

  // Handle nested data for "lease" field.
  addLeaseStructData(firestoreData, lease, 'lease');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.role == e2?.role &&
        e1?.residence == e2?.residence &&
        e1?.bedCode == e2?.bedCode &&
        e1?.roomType == e2?.roomType &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.cellNumber == e2?.cellNumber &&
        e1?.studentNumber == e2?.studentNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.inspectionDone == e2?.inspectionDone &&
        e1?.lease == e2?.lease &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.role,
        e?.residence,
        e?.bedCode,
        e?.roomType,
        e?.firstName,
        e?.lastName,
        e?.cellNumber,
        e?.studentNumber,
        e?.photoUrl,
        e?.inspectionDone,
        e?.lease,
        e?.uid,
        e?.phoneNumber,
        e?.createdTime,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
