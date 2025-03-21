// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactsStruct extends FFFirebaseStruct {
  ContactsStruct({
    String? name,
    String? surname,
    String? contact,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _surname = surname,
        _contact = contact,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;

  bool hasSurname() => _surname != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  set contact(String? val) => _contact = val;

  bool hasContact() => _contact != null;

  static ContactsStruct fromMap(Map<String, dynamic> data) => ContactsStruct(
        name: data['name'] as String?,
        surname: data['surname'] as String?,
        contact: data['contact'] as String?,
      );

  static ContactsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContactsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'surname': _surname,
        'contact': _contact,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        contact: deserializeParam(
          data['contact'],
          ParamType.String,
          false,
        ),
      );

  static ContactsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContactsStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        surname: convertAlgoliaParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        contact: convertAlgoliaParam(
          data['contact'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContactsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactsStruct &&
        name == other.name &&
        surname == other.surname &&
        contact == other.contact;
  }

  @override
  int get hashCode => const ListEquality().hash([name, surname, contact]);
}

ContactsStruct createContactsStruct({
  String? name,
  String? surname,
  String? contact,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactsStruct(
      name: name,
      surname: surname,
      contact: contact,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactsStruct? updateContactsStruct(
  ContactsStruct? contacts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contacts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactsStructData(
  Map<String, dynamic> firestoreData,
  ContactsStruct? contacts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contacts == null) {
    return;
  }
  if (contacts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contacts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactsData = getContactsFirestoreData(contacts, forFieldValue);
  final nestedData = contactsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contacts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactsFirestoreData(
  ContactsStruct? contacts, [
  bool forFieldValue = false,
]) {
  if (contacts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contacts.toMap());

  // Add any Firestore field values
  contacts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactsListFirestoreData(
  List<ContactsStruct>? contactss,
) =>
    contactss?.map((e) => getContactsFirestoreData(e, true)).toList() ?? [];
