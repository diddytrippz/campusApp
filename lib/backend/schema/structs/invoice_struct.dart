// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceStruct extends FFFirebaseStruct {
  InvoiceStruct({
    String? name,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _url = url,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static InvoiceStruct fromMap(Map<String, dynamic> data) => InvoiceStruct(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  static InvoiceStruct? maybeFromMap(dynamic data) =>
      data is Map ? InvoiceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static InvoiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvoiceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  static InvoiceStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InvoiceStruct(
        name: convertAlgoliaParam(
          data['name'],
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
  String toString() => 'InvoiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvoiceStruct && name == other.name && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([name, url]);
}

InvoiceStruct createInvoiceStruct({
  String? name,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvoiceStruct(
      name: name,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvoiceStruct? updateInvoiceStruct(
  InvoiceStruct? invoice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invoice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvoiceStructData(
  Map<String, dynamic> firestoreData,
  InvoiceStruct? invoice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invoice == null) {
    return;
  }
  if (invoice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invoice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invoiceData = getInvoiceFirestoreData(invoice, forFieldValue);
  final nestedData = invoiceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invoice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvoiceFirestoreData(
  InvoiceStruct? invoice, [
  bool forFieldValue = false,
]) {
  if (invoice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invoice.toMap());

  // Add any Firestore field values
  invoice.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvoiceListFirestoreData(
  List<InvoiceStruct>? invoices,
) =>
    invoices?.map((e) => getInvoiceFirestoreData(e, true)).toList() ?? [];
