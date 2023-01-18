import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'contacts_struct.g.dart';

abstract class ContactsStruct
    implements Built<ContactsStruct, ContactsStructBuilder> {
  static Serializer<ContactsStruct> get serializer =>
      _$contactsStructSerializer;

  String? get name;

  String? get surname;

  String? get contact;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ContactsStructBuilder builder) => builder
    ..name = ''
    ..surname = ''
    ..contact = ''
    ..firestoreUtilData = FirestoreUtilData();

  ContactsStruct._();
  factory ContactsStruct([void Function(ContactsStructBuilder) updates]) =
      _$ContactsStruct;
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
      (c) => c
        ..name = name
        ..surname = surname
        ..contact = contact
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ContactsStruct? updateContactsStruct(
  ContactsStruct? contacts, {
  bool clearUnsetFields = true,
}) =>
    contacts != null
        ? (contacts.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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
  if (!forFieldValue && contacts.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactsData = getContactsFirestoreData(contacts, forFieldValue);
  final nestedData = contactsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = contacts.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getContactsFirestoreData(
  ContactsStruct? contacts, [
  bool forFieldValue = false,
]) {
  if (contacts == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ContactsStruct.serializer, contacts);

  // Add any Firestore field values
  contacts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactsListFirestoreData(
  List<ContactsStruct>? contactss,
) =>
    contactss?.map((c) => getContactsFirestoreData(c, true)).toList() ?? [];
