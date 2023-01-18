import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'visitors_record.g.dart';

abstract class VisitorsRecord
    implements Built<VisitorsRecord, VisitorsRecordBuilder> {
  static Serializer<VisitorsRecord> get serializer =>
      _$visitorsRecordSerializer;

  String? get name;

  String? get surname;

  String? get contact;

  DateTime? get date;

  bool? get arrived;

  bool? get departed;

  DocumentReference? get tenant;

  CheckedInStruct get tenantCount;

  String? get accessCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VisitorsRecordBuilder builder) => builder
    ..name = ''
    ..surname = ''
    ..contact = ''
    ..arrived = false
    ..departed = false
    ..tenantCount = CheckedInStructBuilder()
    ..accessCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visitors');

  static Stream<VisitorsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VisitorsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VisitorsRecord._();
  factory VisitorsRecord([void Function(VisitorsRecordBuilder) updates]) =
      _$VisitorsRecord;

  static VisitorsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVisitorsRecordData({
  String? name,
  String? surname,
  String? contact,
  DateTime? date,
  bool? arrived,
  bool? departed,
  DocumentReference? tenant,
  CheckedInStruct? tenantCount,
  String? accessCode,
}) {
  final firestoreData = serializers.toFirestore(
    VisitorsRecord.serializer,
    VisitorsRecord(
      (v) => v
        ..name = name
        ..surname = surname
        ..contact = contact
        ..date = date
        ..arrived = arrived
        ..departed = departed
        ..tenant = tenant
        ..tenantCount = CheckedInStructBuilder()
        ..accessCode = accessCode,
    ),
  );

  // Handle nested data for "tenantCount" field.
  addCheckedInStructData(firestoreData, tenantCount, 'tenantCount');

  return firestoreData;
}
