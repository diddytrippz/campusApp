import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _numberOfDocs = prefs.getInt('ff_numberOfDocs') ?? _numberOfDocs;
    });
    _safeInit(() {
      _caLogo = prefs.getString('ff_caLogo') ?? _caLogo;
    });
    _safeInit(() {
      _myBio = prefs.getString('ff_myBio') ?? _myBio;
    });
    _safeInit(() {
      _defaultLanguage =
          prefs.getString('ff_defaultLanguage') ?? _defaultLanguage;
    });
    _safeInit(() {
      _skeletonhome = prefs.getBool('ff_skeletonhome') ?? _skeletonhome;
    });
    _safeInit(() {
      _skeleteMessages =
          prefs.getBool('ff_skeleteMessages') ?? _skeleteMessages;
    });
    _safeInit(() {
      _skeletonView = prefs.getBool('ff_skeletonView') ?? _skeletonView;
    });
    _safeInit(() {
      _skeletonSettings =
          prefs.getBool('ff_skeletonSettings') ?? _skeletonSettings;
    });
    _safeInit(() {
      _skeletonInfo = prefs.getBool('ff_skeletonInfo') ?? _skeletonInfo;
    });
    _safeInit(() {
      _ticketRef = prefs.getString('ff_ticketRef') ?? _ticketRef;
    });
    _safeInit(() {
      _appliances = prefs.getStringList('ff_appliances') ?? _appliances;
    });
    _safeInit(() {
      _communal = prefs.getStringList('ff_communal') ?? _communal;
    });
    _safeInit(() {
      _electrical = prefs.getStringList('ff_electrical') ?? _electrical;
    });
    _safeInit(() {
      _furniture = prefs.getStringList('ff_furniture') ?? _furniture;
    });
    _safeInit(() {
      _locksmith = prefs.getStringList('ff_locksmith') ?? _locksmith;
    });
    _safeInit(() {
      _plumbing = prefs.getStringList('ff_plumbing') ?? _plumbing;
    });
    _safeInit(() {
      _painting = prefs.getStringList('ff_painting') ?? _painting;
    });
    _safeInit(() {
      _others = prefs.getStringList('ff_others') ?? _others;
    });
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isPressed = true;
  bool get isPressed => _isPressed;
  set isPressed(bool value) {
    _isPressed = value;
  }

  List<bool> _listPressed = [];
  List<bool> get listPressed => _listPressed;
  set listPressed(List<bool> value) {
    _listPressed = value;
  }

  void addToListPressed(bool value) {
    listPressed.add(value);
  }

  void removeFromListPressed(bool value) {
    listPressed.remove(value);
  }

  void removeAtIndexFromListPressed(int index) {
    listPressed.removeAt(index);
  }

  void updateListPressedAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    listPressed[index] = updateFn(_listPressed[index]);
  }

  void insertAtIndexInListPressed(int index, bool value) {
    listPressed.insert(index, value);
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  int _numberOfDocs = 0;
  int get numberOfDocs => _numberOfDocs;
  set numberOfDocs(int value) {
    _numberOfDocs = value;
    prefs.setInt('ff_numberOfDocs', value);
  }

  String _caLogo = '';
  String get caLogo => _caLogo;
  set caLogo(String value) {
    _caLogo = value;
    prefs.setString('ff_caLogo', value);
  }

  String _myBio = 'Write about yourself...';
  String get myBio => _myBio;
  set myBio(String value) {
    _myBio = value;
    prefs.setString('ff_myBio', value);
  }

  String _defaultLanguage = '';
  String get defaultLanguage => _defaultLanguage;
  set defaultLanguage(String value) {
    _defaultLanguage = value;
    prefs.setString('ff_defaultLanguage', value);
  }

  bool _btmNavVis = false;
  bool get btmNavVis => _btmNavVis;
  set btmNavVis(bool value) {
    _btmNavVis = value;
  }

  bool _skeletonhome = true;
  bool get skeletonhome => _skeletonhome;
  set skeletonhome(bool value) {
    _skeletonhome = value;
    prefs.setBool('ff_skeletonhome', value);
  }

  bool _skeleteMessages = true;
  bool get skeleteMessages => _skeleteMessages;
  set skeleteMessages(bool value) {
    _skeleteMessages = value;
    prefs.setBool('ff_skeleteMessages', value);
  }

  bool _skeletonView = true;
  bool get skeletonView => _skeletonView;
  set skeletonView(bool value) {
    _skeletonView = value;
    prefs.setBool('ff_skeletonView', value);
  }

  bool _skeletonSettings = true;
  bool get skeletonSettings => _skeletonSettings;
  set skeletonSettings(bool value) {
    _skeletonSettings = value;
    prefs.setBool('ff_skeletonSettings', value);
  }

  bool _skeletonInfo = true;
  bool get skeletonInfo => _skeletonInfo;
  set skeletonInfo(bool value) {
    _skeletonInfo = value;
    prefs.setBool('ff_skeletonInfo', value);
  }

  String _link = '';
  String get link => _link;
  set link(String value) {
    _link = value;
  }

  bool _stepper0 = true;
  bool get stepper0 => _stepper0;
  set stepper0(bool value) {
    _stepper0 = value;
  }

  bool _stepper1 = false;
  bool get stepper1 => _stepper1;
  set stepper1(bool value) {
    _stepper1 = value;
  }

  bool _stepper2 = false;
  bool get stepper2 => _stepper2;
  set stepper2(bool value) {
    _stepper2 = value;
  }

  bool _stepper3 = false;
  bool get stepper3 => _stepper3;
  set stepper3(bool value) {
    _stepper3 = value;
  }

  String _accessCode = '';
  String get accessCode => _accessCode;
  set accessCode(String value) {
    _accessCode = value;
  }

  bool _visitorMenu = true;
  bool get visitorMenu => _visitorMenu;
  set visitorMenu(bool value) {
    _visitorMenu = value;
  }

  String _ticketRef = '';
  String get ticketRef => _ticketRef;
  set ticketRef(String value) {
    _ticketRef = value;
    prefs.setString('ff_ticketRef', value);
  }

  String _recordedVoice = '';
  String get recordedVoice => _recordedVoice;
  set recordedVoice(String value) {
    _recordedVoice = value;
  }

  String _sound = '';
  String get sound => _sound;
  set sound(String value) {
    _sound = value;
  }

  List<String> _letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<String> get letters => _letters;
  set letters(List<String> value) {
    _letters = value;
  }

  void addToLetters(String value) {
    letters.add(value);
  }

  void removeFromLetters(String value) {
    letters.remove(value);
  }

  void removeAtIndexFromLetters(int index) {
    letters.removeAt(index);
  }

  void updateLettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    letters[index] = updateFn(_letters[index]);
  }

  void insertAtIndexInLetters(int index, String value) {
    letters.insert(index, value);
  }

  List<String> _appliances = [
    'Stove not working',
    'Oven not working',
    'Microwave not working',
    'Fridge not working'
  ];
  List<String> get appliances => _appliances;
  set appliances(List<String> value) {
    _appliances = value;
    prefs.setStringList('ff_appliances', value);
  }

  void addToAppliances(String value) {
    appliances.add(value);
    prefs.setStringList('ff_appliances', _appliances);
  }

  void removeFromAppliances(String value) {
    appliances.remove(value);
    prefs.setStringList('ff_appliances', _appliances);
  }

  void removeAtIndexFromAppliances(int index) {
    appliances.removeAt(index);
    prefs.setStringList('ff_appliances', _appliances);
  }

  void updateAppliancesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    appliances[index] = updateFn(_appliances[index]);
    prefs.setStringList('ff_appliances', _appliances);
  }

  void insertAtIndexInAppliances(int index, String value) {
    appliances.insert(index, value);
    prefs.setStringList('ff_appliances', _appliances);
  }

  List<String> _communal = ['Generator not working', 'Elevators not working'];
  List<String> get communal => _communal;
  set communal(List<String> value) {
    _communal = value;
    prefs.setStringList('ff_communal', value);
  }

  void addToCommunal(String value) {
    communal.add(value);
    prefs.setStringList('ff_communal', _communal);
  }

  void removeFromCommunal(String value) {
    communal.remove(value);
    prefs.setStringList('ff_communal', _communal);
  }

  void removeAtIndexFromCommunal(int index) {
    communal.removeAt(index);
    prefs.setStringList('ff_communal', _communal);
  }

  void updateCommunalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    communal[index] = updateFn(_communal[index]);
    prefs.setStringList('ff_communal', _communal);
  }

  void insertAtIndexInCommunal(int index, String value) {
    communal.insert(index, value);
    prefs.setStringList('ff_communal', _communal);
  }

  List<String> _electrical = [
    'No power',
    'Emergency lights not working',
    'Loose cables',
    'Faulty prepaid meter',
    'Lights in my room are not working',
    'Lights in my unit are not working'
  ];
  List<String> get electrical => _electrical;
  set electrical(List<String> value) {
    _electrical = value;
    prefs.setStringList('ff_electrical', value);
  }

  void addToElectrical(String value) {
    electrical.add(value);
    prefs.setStringList('ff_electrical', _electrical);
  }

  void removeFromElectrical(String value) {
    electrical.remove(value);
    prefs.setStringList('ff_electrical', _electrical);
  }

  void removeAtIndexFromElectrical(int index) {
    electrical.removeAt(index);
    prefs.setStringList('ff_electrical', _electrical);
  }

  void updateElectricalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    electrical[index] = updateFn(_electrical[index]);
    prefs.setStringList('ff_electrical', _electrical);
  }

  void insertAtIndexInElectrical(int index, String value) {
    electrical.insert(index, value);
    prefs.setStringList('ff_electrical', _electrical);
  }

  List<String> _furniture = [
    'Damaged study desk',
    'Damaged chair',
    'Window cannot open',
    'Curtain rail needs to be replaced',
    'Damaged bed base',
    'Damaged mattress',
    'Window cannot close'
  ];
  List<String> get furniture => _furniture;
  set furniture(List<String> value) {
    _furniture = value;
    prefs.setStringList('ff_furniture', value);
  }

  void addToFurniture(String value) {
    furniture.add(value);
    prefs.setStringList('ff_furniture', _furniture);
  }

  void removeFromFurniture(String value) {
    furniture.remove(value);
    prefs.setStringList('ff_furniture', _furniture);
  }

  void removeAtIndexFromFurniture(int index) {
    furniture.removeAt(index);
    prefs.setStringList('ff_furniture', _furniture);
  }

  void updateFurnitureAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    furniture[index] = updateFn(_furniture[index]);
    prefs.setStringList('ff_furniture', _furniture);
  }

  void insertAtIndexInFurniture(int index, String value) {
    furniture.insert(index, value);
    prefs.setStringList('ff_furniture', _furniture);
  }

  List<String> _locksmith = [
    'Broken door handle (unit)',
    'Broken door handle (room)',
    'Room key not opening',
    'Unit key not opening',
    'Lost key',
    'Lost access card',
    'Access card not working'
  ];
  List<String> get locksmith => _locksmith;
  set locksmith(List<String> value) {
    _locksmith = value;
    prefs.setStringList('ff_locksmith', value);
  }

  void addToLocksmith(String value) {
    locksmith.add(value);
    prefs.setStringList('ff_locksmith', _locksmith);
  }

  void removeFromLocksmith(String value) {
    locksmith.remove(value);
    prefs.setStringList('ff_locksmith', _locksmith);
  }

  void removeAtIndexFromLocksmith(int index) {
    locksmith.removeAt(index);
    prefs.setStringList('ff_locksmith', _locksmith);
  }

  void updateLocksmithAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    locksmith[index] = updateFn(_locksmith[index]);
    prefs.setStringList('ff_locksmith', _locksmith);
  }

  void insertAtIndexInLocksmith(int index, String value) {
    locksmith.insert(index, value);
    prefs.setStringList('ff_locksmith', _locksmith);
  }

  List<String> _plumbing = [
    'Damaged toilet sit',
    'Damaged basin/sink',
    'Blocked urinal',
    'Blocked shower drain',
    'Low water pressure',
    'No cold water',
    'No hot water',
    'Shower head needsd to be replaced',
    'Leaking gyser',
    'Burst pipes'
  ];
  List<String> get plumbing => _plumbing;
  set plumbing(List<String> value) {
    _plumbing = value;
    prefs.setStringList('ff_plumbing', value);
  }

  void addToPlumbing(String value) {
    plumbing.add(value);
    prefs.setStringList('ff_plumbing', _plumbing);
  }

  void removeFromPlumbing(String value) {
    plumbing.remove(value);
    prefs.setStringList('ff_plumbing', _plumbing);
  }

  void removeAtIndexFromPlumbing(int index) {
    plumbing.removeAt(index);
    prefs.setStringList('ff_plumbing', _plumbing);
  }

  void updatePlumbingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    plumbing[index] = updateFn(_plumbing[index]);
    prefs.setStringList('ff_plumbing', _plumbing);
  }

  void insertAtIndexInPlumbing(int index, String value) {
    plumbing.insert(index, value);
    prefs.setStringList('ff_plumbing', _plumbing);
  }

  List<String> _painting = [];
  List<String> get painting => _painting;
  set painting(List<String> value) {
    _painting = value;
    prefs.setStringList('ff_painting', value);
  }

  void addToPainting(String value) {
    painting.add(value);
    prefs.setStringList('ff_painting', _painting);
  }

  void removeFromPainting(String value) {
    painting.remove(value);
    prefs.setStringList('ff_painting', _painting);
  }

  void removeAtIndexFromPainting(int index) {
    painting.removeAt(index);
    prefs.setStringList('ff_painting', _painting);
  }

  void updatePaintingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    painting[index] = updateFn(_painting[index]);
    prefs.setStringList('ff_painting', _painting);
  }

  void insertAtIndexInPainting(int index, String value) {
    painting.insert(index, value);
    prefs.setStringList('ff_painting', _painting);
  }

  List<String> _others = [''];
  List<String> get others => _others;
  set others(List<String> value) {
    _others = value;
    prefs.setStringList('ff_others', value);
  }

  void addToOthers(String value) {
    others.add(value);
    prefs.setStringList('ff_others', _others);
  }

  void removeFromOthers(String value) {
    others.remove(value);
    prefs.setStringList('ff_others', _others);
  }

  void removeAtIndexFromOthers(int index) {
    others.removeAt(index);
    prefs.setStringList('ff_others', _others);
  }

  void updateOthersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    others[index] = updateFn(_others[index]);
    prefs.setStringList('ff_others', _others);
  }

  void insertAtIndexInOthers(int index, String value) {
    others.insert(index, value);
    prefs.setStringList('ff_others', _others);
  }

  List<DocumentReference> _tempUserList = [];
  List<DocumentReference> get tempUserList => _tempUserList;
  set tempUserList(List<DocumentReference> value) {
    _tempUserList = value;
  }

  void addToTempUserList(DocumentReference value) {
    tempUserList.add(value);
  }

  void removeFromTempUserList(DocumentReference value) {
    tempUserList.remove(value);
  }

  void removeAtIndexFromTempUserList(int index) {
    tempUserList.removeAt(index);
  }

  void updateTempUserListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    tempUserList[index] = updateFn(_tempUserList[index]);
  }

  void insertAtIndexInTempUserList(int index, DocumentReference value) {
    tempUserList.insert(index, value);
  }

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
    prefs.setBool('ff_navOpen', value);
  }

  List<String> _categories = [
    'Plumbing',
    'Appliances',
    'Locksmith',
    'Furniture',
    'Electrical',
    'Others'
  ];
  List<String> get categories => _categories;
  set categories(List<String> value) {
    _categories = value;
  }

  void addToCategories(String value) {
    categories.add(value);
  }

  void removeFromCategories(String value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    categories.insert(index, value);
  }

  List<String> _team = [
    'Maintenance Team',
    'Sello',
    'Rapudi',
    'Frank',
    'Thabo',
    'Ross'
  ];
  List<String> get team => _team;
  set team(List<String> value) {
    _team = value;
  }

  void addToTeam(String value) {
    team.add(value);
  }

  void removeFromTeam(String value) {
    team.remove(value);
  }

  void removeAtIndexFromTeam(int index) {
    team.removeAt(index);
  }

  void updateTeamAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    team[index] = updateFn(_team[index]);
  }

  void insertAtIndexInTeam(int index, String value) {
    team.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
