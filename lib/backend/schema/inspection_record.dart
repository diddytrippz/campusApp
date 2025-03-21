import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InspectionRecord extends FirestoreRecord {
  InspectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "bedroomInspection" field.
  BedroomStruct? _bedroomInspection;
  BedroomStruct get bedroomInspection => _bedroomInspection ?? BedroomStruct();
  bool hasBedroomInspection() => _bedroomInspection != null;

  // "bathroomInspection" field.
  BathroomStruct? _bathroomInspection;
  BathroomStruct get bathroomInspection =>
      _bathroomInspection ?? BathroomStruct();
  bool hasBathroomInspection() => _bathroomInspection != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _room = snapshotData['room'] as String?;
    _type = snapshotData['type'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _bedroomInspection = snapshotData['bedroomInspection'] is BedroomStruct
        ? snapshotData['bedroomInspection']
        : BedroomStruct.maybeFromMap(snapshotData['bedroomInspection']);
    _bathroomInspection = snapshotData['bathroomInspection'] is BathroomStruct
        ? snapshotData['bathroomInspection']
        : BathroomStruct.maybeFromMap(snapshotData['bathroomInspection']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inspection');

  static Stream<InspectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InspectionRecord.fromSnapshot(s));

  static Future<InspectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InspectionRecord.fromSnapshot(s));

  static InspectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InspectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InspectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InspectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InspectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InspectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInspectionRecordData({
  String? name,
  String? room,
  String? type,
  DateTime? date,
  BedroomStruct? bedroomInspection,
  BathroomStruct? bathroomInspection,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'room': room,
      'type': type,
      'date': date,
      'bedroomInspection': BedroomStruct().toMap(),
      'bathroomInspection': BathroomStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "bedroomInspection" field.
  addBedroomStructData(firestoreData, bedroomInspection, 'bedroomInspection');

  // Handle nested data for "bathroomInspection" field.
  addBathroomStructData(
      firestoreData, bathroomInspection, 'bathroomInspection');

  return firestoreData;
}

class InspectionRecordDocumentEquality implements Equality<InspectionRecord> {
  const InspectionRecordDocumentEquality();

  @override
  bool equals(InspectionRecord? e1, InspectionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.room == e2?.room &&
        e1?.type == e2?.type &&
        e1?.date == e2?.date &&
        e1?.bedroomInspection == e2?.bedroomInspection &&
        e1?.bathroomInspection == e2?.bathroomInspection;
  }

  @override
  int hash(InspectionRecord? e) => const ListEquality().hash([
        e?.name,
        e?.room,
        e?.type,
        e?.date,
        e?.bedroomInspection,
        e?.bathroomInspection
      ]);

  @override
  bool isValidKey(Object? o) => o is InspectionRecord;
}
