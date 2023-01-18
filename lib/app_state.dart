import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    _numberOfDocs = prefs.getInt('ff_numberOfDocs') ?? _numberOfDocs;
    _caLogo = prefs.getString('ff_caLogo') ?? _caLogo;
    _myBio = prefs.getString('ff_myBio') ?? _myBio;
    _defaultLanguage =
        prefs.getString('ff_defaultLanguage') ?? _defaultLanguage;
    _skeletonhome = prefs.getBool('ff_skeletonhome') ?? _skeletonhome;
    _skeleteMessages = prefs.getBool('ff_skeleteMessages') ?? _skeleteMessages;
    _skeletonView = prefs.getBool('ff_skeletonView') ?? _skeletonView;
    _skeletonSettings =
        prefs.getBool('ff_skeletonSettings') ?? _skeletonSettings;
    _skeletonInfo = prefs.getBool('ff_skeletonInfo') ?? _skeletonInfo;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isPressed = true;
  bool get isPressed => _isPressed;
  set isPressed(bool _value) {
    _isPressed = _value;
  }

  List<bool> _listPressed = [];
  List<bool> get listPressed => _listPressed;
  set listPressed(List<bool> _value) {
    _listPressed = _value;
  }

  void addToListPressed(bool _value) {
    _listPressed.add(_value);
  }

  void removeFromListPressed(bool _value) {
    _listPressed.remove(_value);
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  int _numberOfDocs = 0;
  int get numberOfDocs => _numberOfDocs;
  set numberOfDocs(int _value) {
    _numberOfDocs = _value;
    prefs.setInt('ff_numberOfDocs', _value);
  }

  String _caLogo = '';
  String get caLogo => _caLogo;
  set caLogo(String _value) {
    _caLogo = _value;
    prefs.setString('ff_caLogo', _value);
  }

  String _myBio = 'Write about yourself...';
  String get myBio => _myBio;
  set myBio(String _value) {
    _myBio = _value;
    prefs.setString('ff_myBio', _value);
  }

  String _defaultLanguage = '';
  String get defaultLanguage => _defaultLanguage;
  set defaultLanguage(String _value) {
    _defaultLanguage = _value;
    prefs.setString('ff_defaultLanguage', _value);
  }

  bool _btmNavVis = false;
  bool get btmNavVis => _btmNavVis;
  set btmNavVis(bool _value) {
    _btmNavVis = _value;
  }

  bool _skeletonhome = true;
  bool get skeletonhome => _skeletonhome;
  set skeletonhome(bool _value) {
    _skeletonhome = _value;
    prefs.setBool('ff_skeletonhome', _value);
  }

  bool _skeleteMessages = true;
  bool get skeleteMessages => _skeleteMessages;
  set skeleteMessages(bool _value) {
    _skeleteMessages = _value;
    prefs.setBool('ff_skeleteMessages', _value);
  }

  bool _skeletonView = true;
  bool get skeletonView => _skeletonView;
  set skeletonView(bool _value) {
    _skeletonView = _value;
    prefs.setBool('ff_skeletonView', _value);
  }

  bool _skeletonSettings = true;
  bool get skeletonSettings => _skeletonSettings;
  set skeletonSettings(bool _value) {
    _skeletonSettings = _value;
    prefs.setBool('ff_skeletonSettings', _value);
  }

  bool _skeletonInfo = true;
  bool get skeletonInfo => _skeletonInfo;
  set skeletonInfo(bool _value) {
    _skeletonInfo = _value;
    prefs.setBool('ff_skeletonInfo', _value);
  }

  String _link = '';
  String get link => _link;
  set link(String _value) {
    _link = _value;
  }

  bool _stepper0 = true;
  bool get stepper0 => _stepper0;
  set stepper0(bool _value) {
    _stepper0 = _value;
  }

  bool _stepper1 = false;
  bool get stepper1 => _stepper1;
  set stepper1(bool _value) {
    _stepper1 = _value;
  }

  bool _stepper2 = false;
  bool get stepper2 => _stepper2;
  set stepper2(bool _value) {
    _stepper2 = _value;
  }

  bool _stepper3 = false;
  bool get stepper3 => _stepper3;
  set stepper3(bool _value) {
    _stepper3 = _value;
  }

  bool _inspHideGallery = false;
  bool get inspHideGallery => _inspHideGallery;
  set inspHideGallery(bool _value) {
    _inspHideGallery = _value;
  }

  bool _inspHideComments = false;
  bool get inspHideComments => _inspHideComments;
  set inspHideComments(bool _value) {
    _inspHideComments = _value;
  }

  String _accessCode = '';
  String get accessCode => _accessCode;
  set accessCode(String _value) {
    _accessCode = _value;
  }

  bool _visitorMenu = true;
  bool get visitorMenu => _visitorMenu;
  set visitorMenu(bool _value) {
    _visitorMenu = _value;
  }

  String _eskomPlace = '';
  String get eskomPlace => _eskomPlace;
  set eskomPlace(String _value) {
    _eskomPlace = _value;
  }

  String _region = 'Braamfontein';
  String get region => _region;
  set region(String _value) {
    _region = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
