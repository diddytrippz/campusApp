// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BedroomStruct extends FFFirebaseStruct {
  BedroomStruct({
    String? windows,
    String? doors,
    String? locks,
    String? lightSwitches,
    String? plugs,
    String? carpet,
    String? bookshelves,
    String? cupboardShelves,
    String? drawers,
    String? bed,
    String? curtains,
    String? paint,
    String? studyTable,
    String? bedroomGeneralComments,
    String? bedroomImages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _windows = windows,
        _doors = doors,
        _locks = locks,
        _lightSwitches = lightSwitches,
        _plugs = plugs,
        _carpet = carpet,
        _bookshelves = bookshelves,
        _cupboardShelves = cupboardShelves,
        _drawers = drawers,
        _bed = bed,
        _curtains = curtains,
        _paint = paint,
        _studyTable = studyTable,
        _bedroomGeneralComments = bedroomGeneralComments,
        _bedroomImages = bedroomImages,
        super(firestoreUtilData);

  // "windows" field.
  String? _windows;
  String get windows => _windows ?? '';
  set windows(String? val) => _windows = val;

  bool hasWindows() => _windows != null;

  // "doors" field.
  String? _doors;
  String get doors => _doors ?? '';
  set doors(String? val) => _doors = val;

  bool hasDoors() => _doors != null;

  // "locks" field.
  String? _locks;
  String get locks => _locks ?? '';
  set locks(String? val) => _locks = val;

  bool hasLocks() => _locks != null;

  // "lightSwitches" field.
  String? _lightSwitches;
  String get lightSwitches => _lightSwitches ?? '';
  set lightSwitches(String? val) => _lightSwitches = val;

  bool hasLightSwitches() => _lightSwitches != null;

  // "plugs" field.
  String? _plugs;
  String get plugs => _plugs ?? '';
  set plugs(String? val) => _plugs = val;

  bool hasPlugs() => _plugs != null;

  // "carpet" field.
  String? _carpet;
  String get carpet => _carpet ?? '';
  set carpet(String? val) => _carpet = val;

  bool hasCarpet() => _carpet != null;

  // "bookshelves" field.
  String? _bookshelves;
  String get bookshelves => _bookshelves ?? '';
  set bookshelves(String? val) => _bookshelves = val;

  bool hasBookshelves() => _bookshelves != null;

  // "cupboardShelves" field.
  String? _cupboardShelves;
  String get cupboardShelves => _cupboardShelves ?? '';
  set cupboardShelves(String? val) => _cupboardShelves = val;

  bool hasCupboardShelves() => _cupboardShelves != null;

  // "drawers" field.
  String? _drawers;
  String get drawers => _drawers ?? '';
  set drawers(String? val) => _drawers = val;

  bool hasDrawers() => _drawers != null;

  // "bed" field.
  String? _bed;
  String get bed => _bed ?? '';
  set bed(String? val) => _bed = val;

  bool hasBed() => _bed != null;

  // "curtains" field.
  String? _curtains;
  String get curtains => _curtains ?? '';
  set curtains(String? val) => _curtains = val;

  bool hasCurtains() => _curtains != null;

  // "paint" field.
  String? _paint;
  String get paint => _paint ?? '';
  set paint(String? val) => _paint = val;

  bool hasPaint() => _paint != null;

  // "studyTable" field.
  String? _studyTable;
  String get studyTable => _studyTable ?? '';
  set studyTable(String? val) => _studyTable = val;

  bool hasStudyTable() => _studyTable != null;

  // "bedroomGeneralComments" field.
  String? _bedroomGeneralComments;
  String get bedroomGeneralComments => _bedroomGeneralComments ?? '';
  set bedroomGeneralComments(String? val) => _bedroomGeneralComments = val;

  bool hasBedroomGeneralComments() => _bedroomGeneralComments != null;

  // "bedroomImages" field.
  String? _bedroomImages;
  String get bedroomImages => _bedroomImages ?? '';
  set bedroomImages(String? val) => _bedroomImages = val;

  bool hasBedroomImages() => _bedroomImages != null;

  static BedroomStruct fromMap(Map<String, dynamic> data) => BedroomStruct(
        windows: data['windows'] as String?,
        doors: data['doors'] as String?,
        locks: data['locks'] as String?,
        lightSwitches: data['lightSwitches'] as String?,
        plugs: data['plugs'] as String?,
        carpet: data['carpet'] as String?,
        bookshelves: data['bookshelves'] as String?,
        cupboardShelves: data['cupboardShelves'] as String?,
        drawers: data['drawers'] as String?,
        bed: data['bed'] as String?,
        curtains: data['curtains'] as String?,
        paint: data['paint'] as String?,
        studyTable: data['studyTable'] as String?,
        bedroomGeneralComments: data['bedroomGeneralComments'] as String?,
        bedroomImages: data['bedroomImages'] as String?,
      );

  static BedroomStruct? maybeFromMap(dynamic data) =>
      data is Map ? BedroomStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'windows': _windows,
        'doors': _doors,
        'locks': _locks,
        'lightSwitches': _lightSwitches,
        'plugs': _plugs,
        'carpet': _carpet,
        'bookshelves': _bookshelves,
        'cupboardShelves': _cupboardShelves,
        'drawers': _drawers,
        'bed': _bed,
        'curtains': _curtains,
        'paint': _paint,
        'studyTable': _studyTable,
        'bedroomGeneralComments': _bedroomGeneralComments,
        'bedroomImages': _bedroomImages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'windows': serializeParam(
          _windows,
          ParamType.String,
        ),
        'doors': serializeParam(
          _doors,
          ParamType.String,
        ),
        'locks': serializeParam(
          _locks,
          ParamType.String,
        ),
        'lightSwitches': serializeParam(
          _lightSwitches,
          ParamType.String,
        ),
        'plugs': serializeParam(
          _plugs,
          ParamType.String,
        ),
        'carpet': serializeParam(
          _carpet,
          ParamType.String,
        ),
        'bookshelves': serializeParam(
          _bookshelves,
          ParamType.String,
        ),
        'cupboardShelves': serializeParam(
          _cupboardShelves,
          ParamType.String,
        ),
        'drawers': serializeParam(
          _drawers,
          ParamType.String,
        ),
        'bed': serializeParam(
          _bed,
          ParamType.String,
        ),
        'curtains': serializeParam(
          _curtains,
          ParamType.String,
        ),
        'paint': serializeParam(
          _paint,
          ParamType.String,
        ),
        'studyTable': serializeParam(
          _studyTable,
          ParamType.String,
        ),
        'bedroomGeneralComments': serializeParam(
          _bedroomGeneralComments,
          ParamType.String,
        ),
        'bedroomImages': serializeParam(
          _bedroomImages,
          ParamType.String,
        ),
      }.withoutNulls;

  static BedroomStruct fromSerializableMap(Map<String, dynamic> data) =>
      BedroomStruct(
        windows: deserializeParam(
          data['windows'],
          ParamType.String,
          false,
        ),
        doors: deserializeParam(
          data['doors'],
          ParamType.String,
          false,
        ),
        locks: deserializeParam(
          data['locks'],
          ParamType.String,
          false,
        ),
        lightSwitches: deserializeParam(
          data['lightSwitches'],
          ParamType.String,
          false,
        ),
        plugs: deserializeParam(
          data['plugs'],
          ParamType.String,
          false,
        ),
        carpet: deserializeParam(
          data['carpet'],
          ParamType.String,
          false,
        ),
        bookshelves: deserializeParam(
          data['bookshelves'],
          ParamType.String,
          false,
        ),
        cupboardShelves: deserializeParam(
          data['cupboardShelves'],
          ParamType.String,
          false,
        ),
        drawers: deserializeParam(
          data['drawers'],
          ParamType.String,
          false,
        ),
        bed: deserializeParam(
          data['bed'],
          ParamType.String,
          false,
        ),
        curtains: deserializeParam(
          data['curtains'],
          ParamType.String,
          false,
        ),
        paint: deserializeParam(
          data['paint'],
          ParamType.String,
          false,
        ),
        studyTable: deserializeParam(
          data['studyTable'],
          ParamType.String,
          false,
        ),
        bedroomGeneralComments: deserializeParam(
          data['bedroomGeneralComments'],
          ParamType.String,
          false,
        ),
        bedroomImages: deserializeParam(
          data['bedroomImages'],
          ParamType.String,
          false,
        ),
      );

  static BedroomStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BedroomStruct(
        windows: convertAlgoliaParam(
          data['windows'],
          ParamType.String,
          false,
        ),
        doors: convertAlgoliaParam(
          data['doors'],
          ParamType.String,
          false,
        ),
        locks: convertAlgoliaParam(
          data['locks'],
          ParamType.String,
          false,
        ),
        lightSwitches: convertAlgoliaParam(
          data['lightSwitches'],
          ParamType.String,
          false,
        ),
        plugs: convertAlgoliaParam(
          data['plugs'],
          ParamType.String,
          false,
        ),
        carpet: convertAlgoliaParam(
          data['carpet'],
          ParamType.String,
          false,
        ),
        bookshelves: convertAlgoliaParam(
          data['bookshelves'],
          ParamType.String,
          false,
        ),
        cupboardShelves: convertAlgoliaParam(
          data['cupboardShelves'],
          ParamType.String,
          false,
        ),
        drawers: convertAlgoliaParam(
          data['drawers'],
          ParamType.String,
          false,
        ),
        bed: convertAlgoliaParam(
          data['bed'],
          ParamType.String,
          false,
        ),
        curtains: convertAlgoliaParam(
          data['curtains'],
          ParamType.String,
          false,
        ),
        paint: convertAlgoliaParam(
          data['paint'],
          ParamType.String,
          false,
        ),
        studyTable: convertAlgoliaParam(
          data['studyTable'],
          ParamType.String,
          false,
        ),
        bedroomGeneralComments: convertAlgoliaParam(
          data['bedroomGeneralComments'],
          ParamType.String,
          false,
        ),
        bedroomImages: convertAlgoliaParam(
          data['bedroomImages'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BedroomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BedroomStruct &&
        windows == other.windows &&
        doors == other.doors &&
        locks == other.locks &&
        lightSwitches == other.lightSwitches &&
        plugs == other.plugs &&
        carpet == other.carpet &&
        bookshelves == other.bookshelves &&
        cupboardShelves == other.cupboardShelves &&
        drawers == other.drawers &&
        bed == other.bed &&
        curtains == other.curtains &&
        paint == other.paint &&
        studyTable == other.studyTable &&
        bedroomGeneralComments == other.bedroomGeneralComments &&
        bedroomImages == other.bedroomImages;
  }

  @override
  int get hashCode => const ListEquality().hash([
        windows,
        doors,
        locks,
        lightSwitches,
        plugs,
        carpet,
        bookshelves,
        cupboardShelves,
        drawers,
        bed,
        curtains,
        paint,
        studyTable,
        bedroomGeneralComments,
        bedroomImages
      ]);
}

BedroomStruct createBedroomStruct({
  String? windows,
  String? doors,
  String? locks,
  String? lightSwitches,
  String? plugs,
  String? carpet,
  String? bookshelves,
  String? cupboardShelves,
  String? drawers,
  String? bed,
  String? curtains,
  String? paint,
  String? studyTable,
  String? bedroomGeneralComments,
  String? bedroomImages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BedroomStruct(
      windows: windows,
      doors: doors,
      locks: locks,
      lightSwitches: lightSwitches,
      plugs: plugs,
      carpet: carpet,
      bookshelves: bookshelves,
      cupboardShelves: cupboardShelves,
      drawers: drawers,
      bed: bed,
      curtains: curtains,
      paint: paint,
      studyTable: studyTable,
      bedroomGeneralComments: bedroomGeneralComments,
      bedroomImages: bedroomImages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BedroomStruct? updateBedroomStruct(
  BedroomStruct? bedroom, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bedroom
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBedroomStructData(
  Map<String, dynamic> firestoreData,
  BedroomStruct? bedroom,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bedroom == null) {
    return;
  }
  if (bedroom.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bedroom.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bedroomData = getBedroomFirestoreData(bedroom, forFieldValue);
  final nestedData = bedroomData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bedroom.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBedroomFirestoreData(
  BedroomStruct? bedroom, [
  bool forFieldValue = false,
]) {
  if (bedroom == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bedroom.toMap());

  // Add any Firestore field values
  bedroom.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBedroomListFirestoreData(
  List<BedroomStruct>? bedrooms,
) =>
    bedrooms?.map((e) => getBedroomFirestoreData(e, true)).toList() ?? [];
