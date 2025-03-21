import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitorsRecord extends FirestoreRecord {
  VisitorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "arrived" field.
  bool? _arrived;
  bool get arrived => _arrived ?? false;
  bool hasArrived() => _arrived != null;

  // "departed" field.
  bool? _departed;
  bool get departed => _departed ?? false;
  bool hasDeparted() => _departed != null;

  // "accessCode" field.
  String? _accessCode;
  String get accessCode => _accessCode ?? '';
  bool hasAccessCode() => _accessCode != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  bool hasSignature() => _signature != null;

  // "idNumber" field.
  String? _idNumber;
  String get idNumber => _idNumber ?? '';
  bool hasIdNumber() => _idNumber != null;

  // "tenantName" field.
  String? _tenantName;
  String get tenantName => _tenantName ?? '';
  bool hasTenantName() => _tenantName != null;

  // "tenantSurname" field.
  String? _tenantSurname;
  String get tenantSurname => _tenantSurname ?? '';
  bool hasTenantSurname() => _tenantSurname != null;

  // "bedCode" field.
  String? _bedCode;
  String get bedCode => _bedCode ?? '';
  bool hasBedCode() => _bedCode != null;

  // "residence" field.
  String? _residence;
  String get residence => _residence ?? '';
  bool hasResidence() => _residence != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _surname = snapshotData['surname'] as String?;
    _contact = snapshotData['contact'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _arrived = snapshotData['arrived'] as bool?;
    _departed = snapshotData['departed'] as bool?;
    _accessCode = snapshotData['accessCode'] as String?;
    _signature = snapshotData['signature'] as String?;
    _idNumber = snapshotData['idNumber'] as String?;
    _tenantName = snapshotData['tenantName'] as String?;
    _tenantSurname = snapshotData['tenantSurname'] as String?;
    _bedCode = snapshotData['bedCode'] as String?;
    _residence = snapshotData['residence'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visitors');

  static Stream<VisitorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitorsRecord.fromSnapshot(s));

  static Future<VisitorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitorsRecord.fromSnapshot(s));

  static VisitorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitorsRecordData({
  String? name,
  String? surname,
  String? contact,
  DateTime? date,
  bool? arrived,
  bool? departed,
  String? accessCode,
  String? signature,
  String? idNumber,
  String? tenantName,
  String? tenantSurname,
  String? bedCode,
  String? residence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'surname': surname,
      'contact': contact,
      'date': date,
      'arrived': arrived,
      'departed': departed,
      'accessCode': accessCode,
      'signature': signature,
      'idNumber': idNumber,
      'tenantName': tenantName,
      'tenantSurname': tenantSurname,
      'bedCode': bedCode,
      'residence': residence,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitorsRecordDocumentEquality implements Equality<VisitorsRecord> {
  const VisitorsRecordDocumentEquality();

  @override
  bool equals(VisitorsRecord? e1, VisitorsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.surname == e2?.surname &&
        e1?.contact == e2?.contact &&
        e1?.date == e2?.date &&
        e1?.arrived == e2?.arrived &&
        e1?.departed == e2?.departed &&
        e1?.accessCode == e2?.accessCode &&
        e1?.signature == e2?.signature &&
        e1?.idNumber == e2?.idNumber &&
        e1?.tenantName == e2?.tenantName &&
        e1?.tenantSurname == e2?.tenantSurname &&
        e1?.bedCode == e2?.bedCode &&
        e1?.residence == e2?.residence;
  }

  @override
  int hash(VisitorsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.surname,
        e?.contact,
        e?.date,
        e?.arrived,
        e?.departed,
        e?.accessCode,
        e?.signature,
        e?.idNumber,
        e?.tenantName,
        e?.tenantSurname,
        e?.bedCode,
        e?.residence
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitorsRecord;
}
