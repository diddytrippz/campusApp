import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_messages_record.g.dart';

abstract class ChatMessagesRecord
    implements Built<ChatMessagesRecord, ChatMessagesRecordBuilder> {
  static Serializer<ChatMessagesRecord> get serializer =>
      _$chatMessagesRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get message;

  @nullable
  @BuiltValueField(wireName: 'time_created')
  DateTime get timeCreated;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get subject;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChatMessagesRecordBuilder builder) => builder
    ..email = ''
    ..message = ''
    ..displayName = ''
    ..subject = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatMessages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChatMessagesRecord._();
  factory ChatMessagesRecord(
          [void Function(ChatMessagesRecordBuilder) updates]) =
      _$ChatMessagesRecord;

  static ChatMessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChatMessagesRecordData({
  String email,
  String message,
  DateTime timeCreated,
  String displayName,
  String subject,
}) =>
    serializers.toFirestore(
        ChatMessagesRecord.serializer,
        ChatMessagesRecord((c) => c
          ..email = email
          ..message = message
          ..timeCreated = timeCreated
          ..displayName = displayName
          ..subject = subject));
