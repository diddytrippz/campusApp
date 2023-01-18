import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  String? get issue;

  String? get status;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get notes;

  int? get rating;

  String? get category;

  String? get assigned;

  DateTime? get updateTime;

  DocumentReference? get userRec;

  String? get ticketRef;

  @BuiltValueField(wireName: 'FIRST_NAME')
  String? get firstName;

  @BuiltValueField(wireName: 'LAST_NAME')
  String? get lastName;

  @BuiltValueField(wireName: 'RESIDENCE')
  String? get residence;

  @BuiltValueField(wireName: 'CELL_NUMBER')
  String? get cellNumber;

  @BuiltValueField(wireName: 'BED_CODE')
  String? get bedCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MaintenanceRecordBuilder builder) => builder
    ..issue = ''
    ..status = ''
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..displayName = ''
    ..notes = ''
    ..rating = 0
    ..category = ''
    ..assigned = ''
    ..ticketRef = ''
    ..firstName = ''
    ..lastName = ''
    ..residence = ''
    ..cellNumber = ''
    ..bedCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MaintenanceRecord._();
  factory MaintenanceRecord([void Function(MaintenanceRecordBuilder) updates]) =
      _$MaintenanceRecord;

  static MaintenanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMaintenanceRecordData({
  String? issue,
  String? status,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? notes,
  int? rating,
  String? category,
  String? assigned,
  DateTime? updateTime,
  DocumentReference? userRec,
  String? ticketRef,
  String? firstName,
  String? lastName,
  String? residence,
  String? cellNumber,
  String? bedCode,
}) {
  final firestoreData = serializers.toFirestore(
    MaintenanceRecord.serializer,
    MaintenanceRecord(
      (m) => m
        ..issue = issue
        ..status = status
        ..email = email
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..displayName = displayName
        ..notes = notes
        ..rating = rating
        ..category = category
        ..assigned = assigned
        ..updateTime = updateTime
        ..userRec = userRec
        ..ticketRef = ticketRef
        ..firstName = firstName
        ..lastName = lastName
        ..residence = residence
        ..cellNumber = cellNumber
        ..bedCode = bedCode,
    ),
  );

  return firestoreData;
}
