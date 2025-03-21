// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeneralStruct extends FFFirebaseStruct {
  GeneralStruct({
    String? keys,
    String? table,
    String? chair,
    String? generalAreaComments,
    String? generalAreaImages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _keys = keys,
        _table = table,
        _chair = chair,
        _generalAreaComments = generalAreaComments,
        _generalAreaImages = generalAreaImages,
        super(firestoreUtilData);

  // "keys" field.
  String? _keys;
  String get keys => _keys ?? '';
  set keys(String? val) => _keys = val;

  bool hasKeys() => _keys != null;

  // "table" field.
  String? _table;
  String get table => _table ?? '';
  set table(String? val) => _table = val;

  bool hasTable() => _table != null;

  // "chair" field.
  String? _chair;
  String get chair => _chair ?? '';
  set chair(String? val) => _chair = val;

  bool hasChair() => _chair != null;

  // "generalAreaComments" field.
  String? _generalAreaComments;
  String get generalAreaComments => _generalAreaComments ?? '';
  set generalAreaComments(String? val) => _generalAreaComments = val;

  bool hasGeneralAreaComments() => _generalAreaComments != null;

  // "generalAreaImages" field.
  String? _generalAreaImages;
  String get generalAreaImages => _generalAreaImages ?? '';
  set generalAreaImages(String? val) => _generalAreaImages = val;

  bool hasGeneralAreaImages() => _generalAreaImages != null;

  static GeneralStruct fromMap(Map<String, dynamic> data) => GeneralStruct(
        keys: data['keys'] as String?,
        table: data['table'] as String?,
        chair: data['chair'] as String?,
        generalAreaComments: data['generalAreaComments'] as String?,
        generalAreaImages: data['generalAreaImages'] as String?,
      );

  static GeneralStruct? maybeFromMap(dynamic data) =>
      data is Map ? GeneralStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'keys': _keys,
        'table': _table,
        'chair': _chair,
        'generalAreaComments': _generalAreaComments,
        'generalAreaImages': _generalAreaImages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'keys': serializeParam(
          _keys,
          ParamType.String,
        ),
        'table': serializeParam(
          _table,
          ParamType.String,
        ),
        'chair': serializeParam(
          _chair,
          ParamType.String,
        ),
        'generalAreaComments': serializeParam(
          _generalAreaComments,
          ParamType.String,
        ),
        'generalAreaImages': serializeParam(
          _generalAreaImages,
          ParamType.String,
        ),
      }.withoutNulls;

  static GeneralStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeneralStruct(
        keys: deserializeParam(
          data['keys'],
          ParamType.String,
          false,
        ),
        table: deserializeParam(
          data['table'],
          ParamType.String,
          false,
        ),
        chair: deserializeParam(
          data['chair'],
          ParamType.String,
          false,
        ),
        generalAreaComments: deserializeParam(
          data['generalAreaComments'],
          ParamType.String,
          false,
        ),
        generalAreaImages: deserializeParam(
          data['generalAreaImages'],
          ParamType.String,
          false,
        ),
      );

  static GeneralStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GeneralStruct(
        keys: convertAlgoliaParam(
          data['keys'],
          ParamType.String,
          false,
        ),
        table: convertAlgoliaParam(
          data['table'],
          ParamType.String,
          false,
        ),
        chair: convertAlgoliaParam(
          data['chair'],
          ParamType.String,
          false,
        ),
        generalAreaComments: convertAlgoliaParam(
          data['generalAreaComments'],
          ParamType.String,
          false,
        ),
        generalAreaImages: convertAlgoliaParam(
          data['generalAreaImages'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GeneralStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeneralStruct &&
        keys == other.keys &&
        table == other.table &&
        chair == other.chair &&
        generalAreaComments == other.generalAreaComments &&
        generalAreaImages == other.generalAreaImages;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([keys, table, chair, generalAreaComments, generalAreaImages]);
}

GeneralStruct createGeneralStruct({
  String? keys,
  String? table,
  String? chair,
  String? generalAreaComments,
  String? generalAreaImages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeneralStruct(
      keys: keys,
      table: table,
      chair: chair,
      generalAreaComments: generalAreaComments,
      generalAreaImages: generalAreaImages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeneralStruct? updateGeneralStruct(
  GeneralStruct? general, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    general
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeneralStructData(
  Map<String, dynamic> firestoreData,
  GeneralStruct? general,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (general == null) {
    return;
  }
  if (general.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && general.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final generalData = getGeneralFirestoreData(general, forFieldValue);
  final nestedData = generalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = general.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeneralFirestoreData(
  GeneralStruct? general, [
  bool forFieldValue = false,
]) {
  if (general == null) {
    return {};
  }
  final firestoreData = mapToFirestore(general.toMap());

  // Add any Firestore field values
  general.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeneralListFirestoreData(
  List<GeneralStruct>? generals,
) =>
    generals?.map((e) => getGeneralFirestoreData(e, true)).toList() ?? [];
