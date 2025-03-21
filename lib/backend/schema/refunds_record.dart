import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefundsRecord extends FirestoreRecord {
  RefundsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student_number" field.
  String? _studentNumber;
  String get studentNumber => _studentNumber ?? '';
  bool hasStudentNumber() => _studentNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bank_statement_pdf" field.
  String? _bankStatementPdf;
  String get bankStatementPdf => _bankStatementPdf ?? '';
  bool hasBankStatementPdf() => _bankStatementPdf != null;

  // "bank_statement" field.
  String? _bankStatement;
  String get bankStatement => _bankStatement ?? '';
  bool hasBankStatement() => _bankStatement != null;

  // "account" field.
  AccountStruct? _account;
  AccountStruct get account => _account ?? AccountStruct();
  bool hasAccount() => _account != null;

  void _initializeFields() {
    _studentNumber = snapshotData['student_number'] as String?;
    _email = snapshotData['email'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bankStatementPdf = snapshotData['bank_statement_pdf'] as String?;
    _bankStatement = snapshotData['bank_statement'] as String?;
    _account = snapshotData['account'] is AccountStruct
        ? snapshotData['account']
        : AccountStruct.maybeFromMap(snapshotData['account']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('refunds');

  static Stream<RefundsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefundsRecord.fromSnapshot(s));

  static Future<RefundsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefundsRecord.fromSnapshot(s));

  static RefundsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefundsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefundsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefundsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefundsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefundsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefundsRecordData({
  String? studentNumber,
  String? email,
  String? firstName,
  String? lastName,
  DateTime? createdTime,
  DateTime? updatedTime,
  String? status,
  String? bankStatementPdf,
  String? bankStatement,
  AccountStruct? account,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student_number': studentNumber,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'status': status,
      'bank_statement_pdf': bankStatementPdf,
      'bank_statement': bankStatement,
      'account': AccountStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "account" field.
  addAccountStructData(firestoreData, account, 'account');

  return firestoreData;
}

class RefundsRecordDocumentEquality implements Equality<RefundsRecord> {
  const RefundsRecordDocumentEquality();

  @override
  bool equals(RefundsRecord? e1, RefundsRecord? e2) {
    return e1?.studentNumber == e2?.studentNumber &&
        e1?.email == e2?.email &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.status == e2?.status &&
        e1?.bankStatementPdf == e2?.bankStatementPdf &&
        e1?.bankStatement == e2?.bankStatement &&
        e1?.account == e2?.account;
  }

  @override
  int hash(RefundsRecord? e) => const ListEquality().hash([
        e?.studentNumber,
        e?.email,
        e?.firstName,
        e?.lastName,
        e?.createdTime,
        e?.updatedTime,
        e?.status,
        e?.bankStatementPdf,
        e?.bankStatement,
        e?.account
      ]);

  @override
  bool isValidKey(Object? o) => o is RefundsRecord;
}
