// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KitchenStruct extends FFFirebaseStruct {
  KitchenStruct({
    String? stove,
    String? fridge,
    String? kitchenGeneralComments,
    String? kitchenImages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stove = stove,
        _fridge = fridge,
        _kitchenGeneralComments = kitchenGeneralComments,
        _kitchenImages = kitchenImages,
        super(firestoreUtilData);

  // "stove" field.
  String? _stove;
  String get stove => _stove ?? '';
  set stove(String? val) => _stove = val;

  bool hasStove() => _stove != null;

  // "fridge" field.
  String? _fridge;
  String get fridge => _fridge ?? '';
  set fridge(String? val) => _fridge = val;

  bool hasFridge() => _fridge != null;

  // "kitchenGeneralComments" field.
  String? _kitchenGeneralComments;
  String get kitchenGeneralComments => _kitchenGeneralComments ?? '';
  set kitchenGeneralComments(String? val) => _kitchenGeneralComments = val;

  bool hasKitchenGeneralComments() => _kitchenGeneralComments != null;

  // "kitchenImages" field.
  String? _kitchenImages;
  String get kitchenImages => _kitchenImages ?? '';
  set kitchenImages(String? val) => _kitchenImages = val;

  bool hasKitchenImages() => _kitchenImages != null;

  static KitchenStruct fromMap(Map<String, dynamic> data) => KitchenStruct(
        stove: data['stove'] as String?,
        fridge: data['fridge'] as String?,
        kitchenGeneralComments: data['kitchenGeneralComments'] as String?,
        kitchenImages: data['kitchenImages'] as String?,
      );

  static KitchenStruct? maybeFromMap(dynamic data) =>
      data is Map ? KitchenStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'stove': _stove,
        'fridge': _fridge,
        'kitchenGeneralComments': _kitchenGeneralComments,
        'kitchenImages': _kitchenImages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stove': serializeParam(
          _stove,
          ParamType.String,
        ),
        'fridge': serializeParam(
          _fridge,
          ParamType.String,
        ),
        'kitchenGeneralComments': serializeParam(
          _kitchenGeneralComments,
          ParamType.String,
        ),
        'kitchenImages': serializeParam(
          _kitchenImages,
          ParamType.String,
        ),
      }.withoutNulls;

  static KitchenStruct fromSerializableMap(Map<String, dynamic> data) =>
      KitchenStruct(
        stove: deserializeParam(
          data['stove'],
          ParamType.String,
          false,
        ),
        fridge: deserializeParam(
          data['fridge'],
          ParamType.String,
          false,
        ),
        kitchenGeneralComments: deserializeParam(
          data['kitchenGeneralComments'],
          ParamType.String,
          false,
        ),
        kitchenImages: deserializeParam(
          data['kitchenImages'],
          ParamType.String,
          false,
        ),
      );

  static KitchenStruct fromAlgoliaData(Map<String, dynamic> data) =>
      KitchenStruct(
        stove: convertAlgoliaParam(
          data['stove'],
          ParamType.String,
          false,
        ),
        fridge: convertAlgoliaParam(
          data['fridge'],
          ParamType.String,
          false,
        ),
        kitchenGeneralComments: convertAlgoliaParam(
          data['kitchenGeneralComments'],
          ParamType.String,
          false,
        ),
        kitchenImages: convertAlgoliaParam(
          data['kitchenImages'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'KitchenStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KitchenStruct &&
        stove == other.stove &&
        fridge == other.fridge &&
        kitchenGeneralComments == other.kitchenGeneralComments &&
        kitchenImages == other.kitchenImages;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([stove, fridge, kitchenGeneralComments, kitchenImages]);
}

KitchenStruct createKitchenStruct({
  String? stove,
  String? fridge,
  String? kitchenGeneralComments,
  String? kitchenImages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KitchenStruct(
      stove: stove,
      fridge: fridge,
      kitchenGeneralComments: kitchenGeneralComments,
      kitchenImages: kitchenImages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

KitchenStruct? updateKitchenStruct(
  KitchenStruct? kitchen, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    kitchen
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addKitchenStructData(
  Map<String, dynamic> firestoreData,
  KitchenStruct? kitchen,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (kitchen == null) {
    return;
  }
  if (kitchen.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && kitchen.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final kitchenData = getKitchenFirestoreData(kitchen, forFieldValue);
  final nestedData = kitchenData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = kitchen.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getKitchenFirestoreData(
  KitchenStruct? kitchen, [
  bool forFieldValue = false,
]) {
  if (kitchen == null) {
    return {};
  }
  final firestoreData = mapToFirestore(kitchen.toMap());

  // Add any Firestore field values
  kitchen.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getKitchenListFirestoreData(
  List<KitchenStruct>? kitchens,
) =>
    kitchens?.map((e) => getKitchenFirestoreData(e, true)).toList() ?? [];
