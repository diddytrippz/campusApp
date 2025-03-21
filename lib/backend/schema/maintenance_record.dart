import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintenanceRecord extends FirestoreRecord {
  MaintenanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "issue" field.
  String? _issue;
  String get issue => _issue ?? '';
  bool hasIssue() => _issue != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "assigned" field.
  String? _assigned;
  String get assigned => _assigned ?? '';
  bool hasAssigned() => _assigned != null;

  // "updateTime" field.
  DateTime? _updateTime;
  DateTime? get updateTime => _updateTime;
  bool hasUpdateTime() => _updateTime != null;

  // "userRec" field.
  DocumentReference? _userRec;
  DocumentReference? get userRec => _userRec;
  bool hasUserRec() => _userRec != null;

  // "ticketRef" field.
  String? _ticketRef;
  String get ticketRef => _ticketRef ?? '';
  bool hasTicketRef() => _ticketRef != null;

  // "FIRST_NAME" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LAST_NAME" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "RESIDENCE" field.
  String? _residence;
  String get residence => _residence ?? '';
  bool hasResidence() => _residence != null;

  // "CELL_NUMBER" field.
  String? _cellNumber;
  String get cellNumber => _cellNumber ?? '';
  bool hasCellNumber() => _cellNumber != null;

  // "BED_CODE" field.
  String? _bedCode;
  String get bedCode => _bedCode ?? '';
  bool hasBedCode() => _bedCode != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _issue = snapshotData['issue'] as String?;
    _status = snapshotData['status'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _notes = snapshotData['notes'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _category = snapshotData['category'] as String?;
    _assigned = snapshotData['assigned'] as String?;
    _updateTime = snapshotData['updateTime'] as DateTime?;
    _userRec = snapshotData['userRec'] as DocumentReference?;
    _ticketRef = snapshotData['ticketRef'] as String?;
    _firstName = snapshotData['FIRST_NAME'] as String?;
    _lastName = snapshotData['LAST_NAME'] as String?;
    _residence = snapshotData['RESIDENCE'] as String?;
    _cellNumber = snapshotData['CELL_NUMBER'] as String?;
    _bedCode = snapshotData['BED_CODE'] as String?;
    _audio = snapshotData['audio'] as String?;
    _priority = snapshotData['priority'] as String?;
    _comments = getStructList(
      snapshotData['comments'],
      CommentStruct.fromMap,
    );
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaintenanceRecord.fromSnapshot(s));

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaintenanceRecord.fromSnapshot(s));

  static MaintenanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaintenanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaintenanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaintenanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaintenanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaintenanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaintenanceRecordData({
  String? issue,
  String? status,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? notes,
  int? rating,
  String? category,
  String? assigned,
  DateTime? updateTime,
  DocumentReference? userRec,
  String? ticketRef,
  String? firstName,
  String? lastName,
  String? residence,
  String? cellNumber,
  String? bedCode,
  String? audio,
  String? priority,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'issue': issue,
      'status': status,
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'notes': notes,
      'rating': rating,
      'category': category,
      'assigned': assigned,
      'updateTime': updateTime,
      'userRec': userRec,
      'ticketRef': ticketRef,
      'FIRST_NAME': firstName,
      'LAST_NAME': lastName,
      'RESIDENCE': residence,
      'CELL_NUMBER': cellNumber,
      'BED_CODE': bedCode,
      'audio': audio,
      'priority': priority,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaintenanceRecordDocumentEquality implements Equality<MaintenanceRecord> {
  const MaintenanceRecordDocumentEquality();

  @override
  bool equals(MaintenanceRecord? e1, MaintenanceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.issue == e2?.issue &&
        e1?.status == e2?.status &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.notes == e2?.notes &&
        e1?.rating == e2?.rating &&
        e1?.category == e2?.category &&
        e1?.assigned == e2?.assigned &&
        e1?.updateTime == e2?.updateTime &&
        e1?.userRec == e2?.userRec &&
        e1?.ticketRef == e2?.ticketRef &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.residence == e2?.residence &&
        e1?.cellNumber == e2?.cellNumber &&
        e1?.bedCode == e2?.bedCode &&
        e1?.audio == e2?.audio &&
        e1?.priority == e2?.priority &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(MaintenanceRecord? e) => const ListEquality().hash([
        e?.issue,
        e?.status,
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.displayName,
        e?.notes,
        e?.rating,
        e?.category,
        e?.assigned,
        e?.updateTime,
        e?.userRec,
        e?.ticketRef,
        e?.firstName,
        e?.lastName,
        e?.residence,
        e?.cellNumber,
        e?.bedCode,
        e?.audio,
        e?.priority,
        e?.comments,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is MaintenanceRecord;
}
