import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
    _UnsplashAccessKey =
        prefs.getString('ff_UnsplashAccessKey') ?? _UnsplashAccessKey;
    _UnsplashAccessSecret =
        prefs.getString('ff_UnsplashAccessSecret') ?? _UnsplashAccessSecret;
    _reloaded = prefs.getInt('ff_reloaded') ?? _reloaded;
    _mood = prefs.getString('ff_mood') ?? _mood;
    _timer = prefs.getInt('ff_timer') ?? _timer;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic _value) {
    _response = _value;
  }

  String _UnsplashAccessKey = 'T9tt67ilJtIPe0aunPGjuiyGkJ6Z11lz2XCxpr8p2lQ';
  String get UnsplashAccessKey => _UnsplashAccessKey;
  set UnsplashAccessKey(String _value) {
    _UnsplashAccessKey = _value;
    prefs.setString('ff_UnsplashAccessKey', _value);
  }

  String _UnsplashAccessSecret = '4GOdogAg_cCJ4EmkMajZzGmwrKagYzKFydAxO9z4RBs';
  String get UnsplashAccessSecret => _UnsplashAccessSecret;
  set UnsplashAccessSecret(String _value) {
    _UnsplashAccessSecret = _value;
    prefs.setString('ff_UnsplashAccessSecret', _value);
  }

  int _reloaded = 0;
  int get reloaded => _reloaded;
  set reloaded(int _value) {
    _reloaded = _value;
    prefs.setInt('ff_reloaded', _value);
  }

  List<String> _Option1 = [];
  List<String> get Option1 => _Option1;
  set Option1(List<String> _value) {
    _Option1 = _value;
  }

  void addToOption1(String _value) {
    _Option1.add(_value);
  }

  void removeFromOption1(String _value) {
    _Option1.remove(_value);
  }

  void removeAtIndexFromOption1(int _index) {
    _Option1.removeAt(_index);
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool _value) {
    _isAdmin = _value;
  }

  dynamic _currentUser;
  dynamic get currentUser => _currentUser;
  set currentUser(dynamic _value) {
    _currentUser = _value;
  }

  String _mood = '';
  String get mood => _mood;
  set mood(String _value) {
    _mood = _value;
    prefs.setString('ff_mood', _value);
  }

  int _timer = 5;
  int get timer => _timer;
  set timer(int _value) {
    _timer = _value;
    prefs.setInt('ff_timer', _value);
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
