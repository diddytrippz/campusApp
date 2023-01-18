import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'checked_in_struct.g.dart';

abstract class CheckedInStruct
    implements Built<CheckedInStruct, CheckedInStructBuilder> {
  static Serializer<CheckedInStruct> get serializer =>
      _$checkedInStructSerializer;

  BuiltList<DocumentReference>? get tenantList;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CheckedInStructBuilder builder) => builder
    ..tenantList = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  CheckedInStruct._();
  factory CheckedInStruct([void Function(CheckedInStructBuilder) updates]) =
      _$CheckedInStruct;
}

CheckedInStruct createCheckedInStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckedInStruct(
      (c) => c
        ..tenantList = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CheckedInStruct? updateCheckedInStruct(
  CheckedInStruct? checkedIn, {
  bool clearUnsetFields = true,
}) =>
    checkedIn != null
        ? (checkedIn.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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
  if (!forFieldValue && checkedIn.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkedInData = getCheckedInFirestoreData(checkedIn, forFieldValue);
  final nestedData = checkedInData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = checkedIn.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCheckedInFirestoreData(
  CheckedInStruct? checkedIn, [
  bool forFieldValue = false,
]) {
  if (checkedIn == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(CheckedInStruct.serializer, checkedIn);

  // Add any Firestore field values
  checkedIn.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckedInListFirestoreData(
  List<CheckedInStruct>? checkedIns,
) =>
    checkedIns?.map((c) => getCheckedInFirestoreData(c, true)).toList() ?? [];
