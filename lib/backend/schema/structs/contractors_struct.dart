// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractorsStruct extends FFFirebaseStruct {
  ContractorsStruct({
    DocumentReference? contractors,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contractors = contractors,
        super(firestoreUtilData);

  // "contractors" field.
  DocumentReference? _contractors;
  DocumentReference? get contractors => _contractors;
  set contractors(DocumentReference? val) => _contractors = val;

  bool hasContractors() => _contractors != null;

  static ContractorsStruct fromMap(Map<String, dynamic> data) =>
      ContractorsStruct(
        contractors: data['contractors'] as DocumentReference?,
      );

  static ContractorsStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contractors': _contractors,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contractors': serializeParam(
          _contractors,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ContractorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContractorsStruct(
        contractors: deserializeParam(
          data['contractors'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static ContractorsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContractorsStruct(
        contractors: convertAlgoliaParam(
          data['contractors'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContractorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractorsStruct && contractors == other.contractors;
  }

  @override
  int get hashCode => const ListEquality().hash([contractors]);
}

ContractorsStruct createContractorsStruct({
  DocumentReference? contractors,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractorsStruct(
      contractors: contractors,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContractorsStruct? updateContractorsStruct(
  ContractorsStruct? contractorsStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contractorsStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContractorsStructData(
  Map<String, dynamic> firestoreData,
  ContractorsStruct? contractorsStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contractorsStruct == null) {
    return;
  }
  if (contractorsStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contractorsStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contractorsStructData =
      getContractorsFirestoreData(contractorsStruct, forFieldValue);
  final nestedData =
      contractorsStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contractorsStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContractorsFirestoreData(
  ContractorsStruct? contractorsStruct, [
  bool forFieldValue = false,
]) {
  if (contractorsStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contractorsStruct.toMap());

  // Add any Firestore field values
  contractorsStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContractorsListFirestoreData(
  List<ContractorsStruct>? contractorsStructs,
) =>
    contractorsStructs
        ?.map((e) => getContractorsFirestoreData(e, true))
        .toList() ??
    [];
