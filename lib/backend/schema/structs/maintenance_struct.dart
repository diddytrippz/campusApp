// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintenanceStruct extends FFFirebaseStruct {
  MaintenanceStruct({
    String? issue,
    String? description,
    String? category,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _issue = issue,
        _description = description,
        _category = category,
        super(firestoreUtilData);

  // "issue" field.
  String? _issue;
  String get issue => _issue ?? '';
  set issue(String? val) => _issue = val;

  bool hasIssue() => _issue != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  static MaintenanceStruct fromMap(Map<String, dynamic> data) =>
      MaintenanceStruct(
        issue: data['issue'] as String?,
        description: data['description'] as String?,
        category: data['category'] as String?,
      );

  static MaintenanceStruct? maybeFromMap(dynamic data) => data is Map
      ? MaintenanceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'issue': _issue,
        'description': _description,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'issue': serializeParam(
          _issue,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static MaintenanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaintenanceStruct(
        issue: deserializeParam(
          data['issue'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
      );

  static MaintenanceStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MaintenanceStruct(
        issue: convertAlgoliaParam(
          data['issue'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        category: convertAlgoliaParam(
          data['category'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MaintenanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaintenanceStruct &&
        issue == other.issue &&
        description == other.description &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([issue, description, category]);
}

MaintenanceStruct createMaintenanceStruct({
  String? issue,
  String? description,
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MaintenanceStruct(
      issue: issue,
      description: description,
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MaintenanceStruct? updateMaintenanceStruct(
  MaintenanceStruct? maintenance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    maintenance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMaintenanceStructData(
  Map<String, dynamic> firestoreData,
  MaintenanceStruct? maintenance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (maintenance == null) {
    return;
  }
  if (maintenance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && maintenance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final maintenanceData =
      getMaintenanceFirestoreData(maintenance, forFieldValue);
  final nestedData =
      maintenanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = maintenance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMaintenanceFirestoreData(
  MaintenanceStruct? maintenance, [
  bool forFieldValue = false,
]) {
  if (maintenance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(maintenance.toMap());

  // Add any Firestore field values
  maintenance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMaintenanceListFirestoreData(
  List<MaintenanceStruct>? maintenances,
) =>
    maintenances?.map((e) => getMaintenanceFirestoreData(e, true)).toList() ??
    [];
