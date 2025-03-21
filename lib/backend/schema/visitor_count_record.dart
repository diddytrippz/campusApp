import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitorCountRecord extends FirestoreRecord {
  VisitorCountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userTenants" field.
  List<DocumentReference>? _userTenants;
  List<DocumentReference> get userTenants => _userTenants ?? const [];
  bool hasUserTenants() => _userTenants != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userTenants = getDataList(snapshotData['userTenants']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitorCount')
          : FirebaseFirestore.instance.collectionGroup('visitorCount');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitorCount').doc(id);

  static Stream<VisitorCountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitorCountRecord.fromSnapshot(s));

  static Future<VisitorCountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitorCountRecord.fromSnapshot(s));

  static VisitorCountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitorCountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitorCountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitorCountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitorCountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitorCountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitorCountRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class VisitorCountRecordDocumentEquality
    implements Equality<VisitorCountRecord> {
  const VisitorCountRecordDocumentEquality();

  @override
  bool equals(VisitorCountRecord? e1, VisitorCountRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userTenants, e2?.userTenants);
  }

  @override
  int hash(VisitorCountRecord? e) =>
      const ListEquality().hash([e?.userTenants]);

  @override
  bool isValidKey(Object? o) => o is VisitorCountRecord;
}
