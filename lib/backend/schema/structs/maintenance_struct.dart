import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_struct.g.dart';

abstract class MaintenanceStruct
    implements Built<MaintenanceStruct, MaintenanceStructBuilder> {
  static Serializer<MaintenanceStruct> get serializer =>
      _$maintenanceStructSerializer;

  String? get issue;

  String? get description;

  String? get category;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MaintenanceStructBuilder builder) => builder
    ..issue = ''
    ..description = ''
    ..category = ''
    ..firestoreUtilData = FirestoreUtilData();

  MaintenanceStruct._();
  factory MaintenanceStruct([void Function(MaintenanceStructBuilder) updates]) =
      _$MaintenanceStruct;
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
      (m) => m
        ..issue = issue
        ..description = description
        ..category = category
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MaintenanceStruct? updateMaintenanceStruct(
  MaintenanceStruct? maintenance, {
  bool clearUnsetFields = true,
}) =>
    maintenance != null
        ? (maintenance.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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
  if (!forFieldValue && maintenance.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final maintenanceData =
      getMaintenanceFirestoreData(maintenance, forFieldValue);
  final nestedData =
      maintenanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = maintenance.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMaintenanceFirestoreData(
  MaintenanceStruct? maintenance, [
  bool forFieldValue = false,
]) {
  if (maintenance == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MaintenanceStruct.serializer, maintenance);

  // Add any Firestore field values
  maintenance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMaintenanceListFirestoreData(
  List<MaintenanceStruct>? maintenances,
) =>
    maintenances?.map((m) => getMaintenanceFirestoreData(m, true)).toList() ??
    [];
