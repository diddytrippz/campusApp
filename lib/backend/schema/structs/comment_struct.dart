// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    DocumentReference? user,
    DateTime? date,
    String? comment,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _date = date,
        _comment = comment,
        _type = type,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        user: data['user'] as DocumentReference?,
        date: data['date'] as DateTime?,
        comment: data['comment'] as String?,
        type: data['type'] as String?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'date': _date,
        'comment': _comment,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  static CommentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CommentStruct(
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        comment: convertAlgoliaParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        user == other.user &&
        date == other.date &&
        comment == other.comment &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([user, date, comment, type]);
}

CommentStruct createCommentStruct({
  DocumentReference? user,
  DateTime? date,
  String? comment,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      user: user,
      date: date,
      comment: comment,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? commentStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? commentStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentStruct == null) {
    return;
  }
  if (commentStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentStructData =
      getCommentFirestoreData(commentStruct, forFieldValue);
  final nestedData =
      commentStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commentStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? commentStruct, [
  bool forFieldValue = false,
]) {
  if (commentStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentStruct.toMap());

  // Add any Firestore field values
  commentStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? commentStructs,
) =>
    commentStructs?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
