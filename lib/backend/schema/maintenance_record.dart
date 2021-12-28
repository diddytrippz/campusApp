import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Description')
  String get description;

  @nullable
  @BuiltValueField(wireName: 'Issue')
  String get issue;

  @nullable
  @BuiltValueField(wireName: 'Status')
  bool get status;

  @nullable
  DateTime get dateCreated;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MaintenanceRecordBuilder builder) => builder
    ..description = ''
    ..issue = ''
    ..status = false
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MaintenanceRecord._();
  factory MaintenanceRecord([void Function(MaintenanceRecordBuilder) updates]) =
      _$MaintenanceRecord;

  static MaintenanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMaintenanceRecordData({
  String description,
  String issue,
  bool status,
  DateTime dateCreated,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        MaintenanceRecord.serializer,
        MaintenanceRecord((m) => m
          ..description = description
          ..issue = issue
          ..status = status
          ..dateCreated = dateCreated
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
