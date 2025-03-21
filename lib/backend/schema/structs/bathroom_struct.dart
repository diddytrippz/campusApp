// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BathroomStruct extends FFFirebaseStruct {
  BathroomStruct({
    String? shower,
    String? water,
    String? leaks,
    String? soapDish,
    String? towelRail,
    String? taps,
    String? tiling,
    String? bathroomGeneralComments,
    String? bathroomImages,
    String? mildew,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _shower = shower,
        _water = water,
        _leaks = leaks,
        _soapDish = soapDish,
        _towelRail = towelRail,
        _taps = taps,
        _tiling = tiling,
        _bathroomGeneralComments = bathroomGeneralComments,
        _bathroomImages = bathroomImages,
        _mildew = mildew,
        super(firestoreUtilData);

  // "shower" field.
  String? _shower;
  String get shower => _shower ?? '';
  set shower(String? val) => _shower = val;

  bool hasShower() => _shower != null;

  // "water" field.
  String? _water;
  String get water => _water ?? '';
  set water(String? val) => _water = val;

  bool hasWater() => _water != null;

  // "leaks" field.
  String? _leaks;
  String get leaks => _leaks ?? '';
  set leaks(String? val) => _leaks = val;

  bool hasLeaks() => _leaks != null;

  // "soapDish" field.
  String? _soapDish;
  String get soapDish => _soapDish ?? '';
  set soapDish(String? val) => _soapDish = val;

  bool hasSoapDish() => _soapDish != null;

  // "towelRail" field.
  String? _towelRail;
  String get towelRail => _towelRail ?? '';
  set towelRail(String? val) => _towelRail = val;

  bool hasTowelRail() => _towelRail != null;

  // "taps" field.
  String? _taps;
  String get taps => _taps ?? '';
  set taps(String? val) => _taps = val;

  bool hasTaps() => _taps != null;

  // "tiling" field.
  String? _tiling;
  String get tiling => _tiling ?? '';
  set tiling(String? val) => _tiling = val;

  bool hasTiling() => _tiling != null;

  // "bathroomGeneralComments" field.
  String? _bathroomGeneralComments;
  String get bathroomGeneralComments => _bathroomGeneralComments ?? '';
  set bathroomGeneralComments(String? val) => _bathroomGeneralComments = val;

  bool hasBathroomGeneralComments() => _bathroomGeneralComments != null;

  // "bathroomImages" field.
  String? _bathroomImages;
  String get bathroomImages => _bathroomImages ?? '';
  set bathroomImages(String? val) => _bathroomImages = val;

  bool hasBathroomImages() => _bathroomImages != null;

  // "mildew" field.
  String? _mildew;
  String get mildew => _mildew ?? '';
  set mildew(String? val) => _mildew = val;

  bool hasMildew() => _mildew != null;

  static BathroomStruct fromMap(Map<String, dynamic> data) => BathroomStruct(
        shower: data['shower'] as String?,
        water: data['water'] as String?,
        leaks: data['leaks'] as String?,
        soapDish: data['soapDish'] as String?,
        towelRail: data['towelRail'] as String?,
        taps: data['taps'] as String?,
        tiling: data['tiling'] as String?,
        bathroomGeneralComments: data['bathroomGeneralComments'] as String?,
        bathroomImages: data['bathroomImages'] as String?,
        mildew: data['mildew'] as String?,
      );

  static BathroomStruct? maybeFromMap(dynamic data) =>
      data is Map ? BathroomStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'shower': _shower,
        'water': _water,
        'leaks': _leaks,
        'soapDish': _soapDish,
        'towelRail': _towelRail,
        'taps': _taps,
        'tiling': _tiling,
        'bathroomGeneralComments': _bathroomGeneralComments,
        'bathroomImages': _bathroomImages,
        'mildew': _mildew,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'shower': serializeParam(
          _shower,
          ParamType.String,
        ),
        'water': serializeParam(
          _water,
          ParamType.String,
        ),
        'leaks': serializeParam(
          _leaks,
          ParamType.String,
        ),
        'soapDish': serializeParam(
          _soapDish,
          ParamType.String,
        ),
        'towelRail': serializeParam(
          _towelRail,
          ParamType.String,
        ),
        'taps': serializeParam(
          _taps,
          ParamType.String,
        ),
        'tiling': serializeParam(
          _tiling,
          ParamType.String,
        ),
        'bathroomGeneralComments': serializeParam(
          _bathroomGeneralComments,
          ParamType.String,
        ),
        'bathroomImages': serializeParam(
          _bathroomImages,
          ParamType.String,
        ),
        'mildew': serializeParam(
          _mildew,
          ParamType.String,
        ),
      }.withoutNulls;

  static BathroomStruct fromSerializableMap(Map<String, dynamic> data) =>
      BathroomStruct(
        shower: deserializeParam(
          data['shower'],
          ParamType.String,
          false,
        ),
        water: deserializeParam(
          data['water'],
          ParamType.String,
          false,
        ),
        leaks: deserializeParam(
          data['leaks'],
          ParamType.String,
          false,
        ),
        soapDish: deserializeParam(
          data['soapDish'],
          ParamType.String,
          false,
        ),
        towelRail: deserializeParam(
          data['towelRail'],
          ParamType.String,
          false,
        ),
        taps: deserializeParam(
          data['taps'],
          ParamType.String,
          false,
        ),
        tiling: deserializeParam(
          data['tiling'],
          ParamType.String,
          false,
        ),
        bathroomGeneralComments: deserializeParam(
          data['bathroomGeneralComments'],
          ParamType.String,
          false,
        ),
        bathroomImages: deserializeParam(
          data['bathroomImages'],
          ParamType.String,
          false,
        ),
        mildew: deserializeParam(
          data['mildew'],
          ParamType.String,
          false,
        ),
      );

  static BathroomStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BathroomStruct(
        shower: convertAlgoliaParam(
          data['shower'],
          ParamType.String,
          false,
        ),
        water: convertAlgoliaParam(
          data['water'],
          ParamType.String,
          false,
        ),
        leaks: convertAlgoliaParam(
          data['leaks'],
          ParamType.String,
          false,
        ),
        soapDish: convertAlgoliaParam(
          data['soapDish'],
          ParamType.String,
          false,
        ),
        towelRail: convertAlgoliaParam(
          data['towelRail'],
          ParamType.String,
          false,
        ),
        taps: convertAlgoliaParam(
          data['taps'],
          ParamType.String,
          false,
        ),
        tiling: convertAlgoliaParam(
          data['tiling'],
          ParamType.String,
          false,
        ),
        bathroomGeneralComments: convertAlgoliaParam(
          data['bathroomGeneralComments'],
          ParamType.String,
          false,
        ),
        bathroomImages: convertAlgoliaParam(
          data['bathroomImages'],
          ParamType.String,
          false,
        ),
        mildew: convertAlgoliaParam(
          data['mildew'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BathroomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BathroomStruct &&
        shower == other.shower &&
        water == other.water &&
        leaks == other.leaks &&
        soapDish == other.soapDish &&
        towelRail == other.towelRail &&
        taps == other.taps &&
        tiling == other.tiling &&
        bathroomGeneralComments == other.bathroomGeneralComments &&
        bathroomImages == other.bathroomImages &&
        mildew == other.mildew;
  }

  @override
  int get hashCode => const ListEquality().hash([
        shower,
        water,
        leaks,
        soapDish,
        towelRail,
        taps,
        tiling,
        bathroomGeneralComments,
        bathroomImages,
        mildew
      ]);
}

BathroomStruct createBathroomStruct({
  String? shower,
  String? water,
  String? leaks,
  String? soapDish,
  String? towelRail,
  String? taps,
  String? tiling,
  String? bathroomGeneralComments,
  String? bathroomImages,
  String? mildew,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BathroomStruct(
      shower: shower,
      water: water,
      leaks: leaks,
      soapDish: soapDish,
      towelRail: towelRail,
      taps: taps,
      tiling: tiling,
      bathroomGeneralComments: bathroomGeneralComments,
      bathroomImages: bathroomImages,
      mildew: mildew,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BathroomStruct? updateBathroomStruct(
  BathroomStruct? bathroom, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bathroom
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBathroomStructData(
  Map<String, dynamic> firestoreData,
  BathroomStruct? bathroom,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bathroom == null) {
    return;
  }
  if (bathroom.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bathroom.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bathroomData = getBathroomFirestoreData(bathroom, forFieldValue);
  final nestedData = bathroomData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bathroom.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBathroomFirestoreData(
  BathroomStruct? bathroom, [
  bool forFieldValue = false,
]) {
  if (bathroom == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bathroom.toMap());

  // Add any Firestore field values
  bathroom.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBathroomListFirestoreData(
  List<BathroomStruct>? bathrooms,
) =>
    bathrooms?.map((e) => getBathroomFirestoreData(e, true)).toList() ?? [];
