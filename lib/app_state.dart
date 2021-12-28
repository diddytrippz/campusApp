import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _ProfilePic = prefs.getString('ff_ProfilePic') ?? _ProfilePic;
  }

  SharedPreferences prefs;

  String _ProfilePic;
  String get ProfilePic => _ProfilePic;
  set ProfilePic(String _value) {
    _ProfilePic = _value;
    prefs.setString('ff_ProfilePic', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
