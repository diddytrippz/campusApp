import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractorsRecord extends FirestoreRecord {
  ContractorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "contractor" field.
  List<ContractorsStruct>? _contractor;
  List<ContractorsStruct> get contractor => _contractor ?? const [];
  bool hasContractor() => _contractor != null;

  void _initializeFields() {
    _contractor = getStructList(
      snapshotData['contractor'],
      ContractorsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contractors');

  static Stream<ContractorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractorsRecord.fromSnapshot(s));

  static Future<ContractorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractorsRecord.fromSnapshot(s));

  static ContractorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractorsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ContractorsRecordDocumentEquality implements Equality<ContractorsRecord> {
  const ContractorsRecordDocumentEquality();

  @override
  bool equals(ContractorsRecord? e1, ContractorsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.contractor, e2?.contractor);
  }

  @override
  int hash(ContractorsRecord? e) => const ListEquality().hash([e?.contractor]);

  @override
  bool isValidKey(Object? o) => o is ContractorsRecord;
}
