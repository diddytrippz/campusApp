import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "sentBy" field.
  String? _sentBy;
  String get sentBy => _sentBy ?? '';
  bool hasSentBy() => _sentBy != null;

  // "dateCreate" field.
  DateTime? _dateCreate;
  DateTime? get dateCreate => _dateCreate;
  bool hasDateCreate() => _dateCreate != null;

  // "Urgency" field.
  String? _urgency;
  String get urgency => _urgency ?? '';
  bool hasUrgency() => _urgency != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "targets" field.
  List<String>? _targets;
  List<String> get targets => _targets ?? const [];
  bool hasTargets() => _targets != null;

  // "rsvp" field.
  List<DocumentReference>? _rsvp;
  List<DocumentReference> get rsvp => _rsvp ?? const [];
  bool hasRsvp() => _rsvp != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "confirm" field.
  bool? _confirm;
  bool get confirm => _confirm ?? false;
  bool hasConfirm() => _confirm != null;

  // "attachment" field.
  List<String>? _attachment;
  List<String> get attachment => _attachment ?? const [];
  bool hasAttachment() => _attachment != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _sentBy = snapshotData['sentBy'] as String?;
    _dateCreate = snapshotData['dateCreate'] as DateTime?;
    _urgency = snapshotData['Urgency'] as String?;
    _link = snapshotData['link'] as String?;
    _content = snapshotData['content'] as String?;
    _targets = getDataList(snapshotData['targets']);
    _rsvp = getDataList(snapshotData['rsvp']);
    _following = getDataList(snapshotData['following']);
    _confirm = snapshotData['confirm'] as bool?;
    _attachment = getDataList(snapshotData['attachment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? title,
  String? sentBy,
  DateTime? dateCreate,
  String? urgency,
  String? link,
  String? content,
  bool? confirm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'sentBy': sentBy,
      'dateCreate': dateCreate,
      'Urgency': urgency,
      'link': link,
      'content': content,
      'confirm': confirm,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.sentBy == e2?.sentBy &&
        e1?.dateCreate == e2?.dateCreate &&
        e1?.urgency == e2?.urgency &&
        e1?.link == e2?.link &&
        e1?.content == e2?.content &&
        listEquality.equals(e1?.targets, e2?.targets) &&
        listEquality.equals(e1?.rsvp, e2?.rsvp) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.confirm == e2?.confirm &&
        listEquality.equals(e1?.attachment, e2?.attachment);
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.sentBy,
        e?.dateCreate,
        e?.urgency,
        e?.link,
        e?.content,
        e?.targets,
        e?.rsvp,
        e?.following,
        e?.confirm,
        e?.attachment
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
