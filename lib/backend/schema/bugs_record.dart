import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bugs_record.g.dart';

abstract class BugsRecord implements Built<BugsRecord, BugsRecordBuilder> {
  static Serializer<BugsRecord> get serializer => _$bugsRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get bug;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BugsRecordBuilder builder) => builder
    ..email = ''
    ..bug = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bugs');

  static Stream<BugsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BugsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BugsRecord._();
  factory BugsRecord([void Function(BugsRecordBuilder) updates]) = _$BugsRecord;

  static BugsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBugsRecordData({
  String email,
  String bug,
}) =>
    serializers.toFirestore(
        BugsRecord.serializer,
        BugsRecord((b) => b
          ..email = email
          ..bug = bug));
