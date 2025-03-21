import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomCheckRecord extends FirestoreRecord {
  RoomCheckRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bedroom" field.
  BedroomStruct? _bedroom;
  BedroomStruct get bedroom => _bedroom ?? BedroomStruct();
  bool hasBedroom() => _bedroom != null;

  // "bathroom" field.
  BathroomStruct? _bathroom;
  BathroomStruct get bathroom => _bathroom ?? BathroomStruct();
  bool hasBathroom() => _bathroom != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "kitchen" field.
  KitchenStruct? _kitchen;
  KitchenStruct get kitchen => _kitchen ?? KitchenStruct();
  bool hasKitchen() => _kitchen != null;

  // "general" field.
  GeneralStruct? _general;
  GeneralStruct get general => _general ?? GeneralStruct();
  bool hasGeneral() => _general != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  bool hasSignature() => _signature != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bedroom = snapshotData['bedroom'] is BedroomStruct
        ? snapshotData['bedroom']
        : BedroomStruct.maybeFromMap(snapshotData['bedroom']);
    _bathroom = snapshotData['bathroom'] is BathroomStruct
        ? snapshotData['bathroom']
        : BathroomStruct.maybeFromMap(snapshotData['bathroom']);
    _type = snapshotData['type'] as String?;
    _kitchen = snapshotData['kitchen'] is KitchenStruct
        ? snapshotData['kitchen']
        : KitchenStruct.maybeFromMap(snapshotData['kitchen']);
    _general = snapshotData['general'] is GeneralStruct
        ? snapshotData['general']
        : GeneralStruct.maybeFromMap(snapshotData['general']);
    _signature = snapshotData['signature'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('roomCheck')
          : FirebaseFirestore.instance.collectionGroup('roomCheck');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('roomCheck').doc(id);

  static Stream<RoomCheckRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomCheckRecord.fromSnapshot(s));

  static Future<RoomCheckRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomCheckRecord.fromSnapshot(s));

  static RoomCheckRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoomCheckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomCheckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomCheckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomCheckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomCheckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomCheckRecordData({
  BedroomStruct? bedroom,
  BathroomStruct? bathroom,
  String? type,
  KitchenStruct? kitchen,
  GeneralStruct? general,
  String? signature,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bedroom': BedroomStruct().toMap(),
      'bathroom': BathroomStruct().toMap(),
      'type': type,
      'kitchen': KitchenStruct().toMap(),
      'general': GeneralStruct().toMap(),
      'signature': signature,
    }.withoutNulls,
  );

  // Handle nested data for "bedroom" field.
  addBedroomStructData(firestoreData, bedroom, 'bedroom');

  // Handle nested data for "bathroom" field.
  addBathroomStructData(firestoreData, bathroom, 'bathroom');

  // Handle nested data for "kitchen" field.
  addKitchenStructData(firestoreData, kitchen, 'kitchen');

  // Handle nested data for "general" field.
  addGeneralStructData(firestoreData, general, 'general');

  return firestoreData;
}

class RoomCheckRecordDocumentEquality implements Equality<RoomCheckRecord> {
  const RoomCheckRecordDocumentEquality();

  @override
  bool equals(RoomCheckRecord? e1, RoomCheckRecord? e2) {
    return e1?.bedroom == e2?.bedroom &&
        e1?.bathroom == e2?.bathroom &&
        e1?.type == e2?.type &&
        e1?.kitchen == e2?.kitchen &&
        e1?.general == e2?.general &&
        e1?.signature == e2?.signature;
  }

  @override
  int hash(RoomCheckRecord? e) => const ListEquality().hash(
      [e?.bedroom, e?.bathroom, e?.type, e?.kitchen, e?.general, e?.signature]);

  @override
  bool isValidKey(Object? o) => o is RoomCheckRecord;
}
