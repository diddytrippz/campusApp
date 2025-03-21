// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckedInStruct extends FFFirebaseStruct {
  CheckedInStruct({
    List<DocumentReference>? tenantList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenantList = tenantList,
        super(firestoreUtilData);

  // "tenantList" field.
  List<DocumentReference>? _tenantList;
  List<DocumentReference> get tenantList => _tenantList ?? const [];
  set tenantList(List<DocumentReference>? val) => _tenantList = val;

  void updateTenantList(Function(List<DocumentReference>) updateFn) {
    updateFn(_tenantList ??= []);
  }

  bool hasTenantList() => _tenantList != null;

  static CheckedInStruct fromMap(Map<String, dynamic> data) => CheckedInStruct(
        tenantList: getDataList(data['tenantList']),
      );

  static CheckedInStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckedInStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenantList': _tenantList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenantList': serializeParam(
          _tenantList,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static CheckedInStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckedInStruct(
        tenantList: deserializeParam<DocumentReference>(
          data['tenantList'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  static CheckedInStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CheckedInStruct(
        tenantList: convertAlgoliaParam<DocumentReference>(
          data['tenantList'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CheckedInStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CheckedInStruct &&
        listEquality.equals(tenantList, other.tenantList);
  }

  @override
  int get hashCode => const ListEquality().hash([tenantList]);
}

CheckedInStruct createCheckedInStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckedInStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckedInStruct? updateCheckedInStruct(
  CheckedInStruct? checkedIn, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkedIn
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckedInStructData(
  Map<String, dynamic> firestoreData,
  CheckedInStruct? checkedIn,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkedIn == null) {
    return;
  }
  if (checkedIn.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkedIn.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkedInData = getCheckedInFirestoreData(checkedIn, forFieldValue);
  final nestedData = checkedInData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkedIn.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckedInFirestoreData(
  CheckedInStruct? checkedIn, [
  bool forFieldValue = false,
]) {
  if (checkedIn == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkedIn.toMap());

  // Add any Firestore field values
  checkedIn.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckedInListFirestoreData(
  List<CheckedInStruct>? checkedIns,
) =>
    checkedIns?.map((e) => getCheckedInFirestoreData(e, true)).toList() ?? [];
