// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaseStruct extends FFFirebaseStruct {
  LeaseStruct({
    String? fileName,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileName = fileName,
        _url = url,
        super(firestoreUtilData);

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;

  bool hasFileName() => _fileName != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static LeaseStruct fromMap(Map<String, dynamic> data) => LeaseStruct(
        fileName: data['file_name'] as String?,
        url: data['url'] as String?,
      );

  static LeaseStruct? maybeFromMap(dynamic data) =>
      data is Map ? LeaseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'file_name': _fileName,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_name': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeaseStruct(
        fileName: deserializeParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  static LeaseStruct fromAlgoliaData(Map<String, dynamic> data) => LeaseStruct(
        fileName: convertAlgoliaParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LeaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeaseStruct &&
        fileName == other.fileName &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([fileName, url]);
}

LeaseStruct createLeaseStruct({
  String? fileName,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeaseStruct(
      fileName: fileName,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeaseStruct? updateLeaseStruct(
  LeaseStruct? lease, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lease
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeaseStructData(
  Map<String, dynamic> firestoreData,
  LeaseStruct? lease,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lease == null) {
    return;
  }
  if (lease.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lease.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leaseData = getLeaseFirestoreData(lease, forFieldValue);
  final nestedData = leaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lease.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeaseFirestoreData(
  LeaseStruct? lease, [
  bool forFieldValue = false,
]) {
  if (lease == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lease.toMap());

  // Add any Firestore field values
  lease.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeaseListFirestoreData(
  List<LeaseStruct>? leases,
) =>
    leases?.map((e) => getLeaseFirestoreData(e, true)).toList() ?? [];
