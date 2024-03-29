import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'checklist_record.g.dart';

abstract class ChecklistRecord
    implements Built<ChecklistRecord, ChecklistRecordBuilder> {
  static Serializer<ChecklistRecord> get serializer =>
      _$checklistRecordSerializer;

  String? get gallery;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChecklistRecordBuilder builder) =>
      builder..gallery = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checklist');

  static Stream<ChecklistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChecklistRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChecklistRecord._();
  factory ChecklistRecord([void Function(ChecklistRecordBuilder) updates]) =
      _$ChecklistRecord;

  static ChecklistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChecklistRecordData({
  String? gallery,
}) {
  final firestoreData = serializers.toFirestore(
    ChecklistRecord.serializer,
    ChecklistRecord(
      (c) => c..gallery = gallery,
    ),
  );

  return firestoreData;
}
