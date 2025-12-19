import 'dart:convert';
import 'package:flutter/services.dart';

class FirebaseRemoteConfig {
  static final FirebaseRemoteConfig instance = FirebaseRemoteConfig._();

  FirebaseRemoteConfig._();

  final Map<String, dynamic> _config = {};
  bool _isInitialized = false;

  Future<bool> fetchAndActivate() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'packages/firebase_remote_config/assets/config.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      jsonData.forEach((key, value) {
        if (value is List || value is Map) {
          _config[key] = json.encode(value);
        } else {
          _config[key] = value;
        }
      });

      _isInitialized = true;
      await Future.delayed(const Duration(milliseconds: 200));
      return true;
    } catch (e) {
      _isInitialized = true;
      await Future.delayed(const Duration(milliseconds: 200));
      return false;
    }
  }

  String getString(String key) {
    if (!_isInitialized) return '';
    final value = _config[key];
    if (value == null) return '';
    if (value is String) return value;
    return value.toString();
  }

  int getInt(String key) {
    if (!_isInitialized) return 0;
    final value = _config[key] ?? 0;
    return value is int ? value : (value is num ? value.toInt() : 0);
  }

  bool getBool(String key) {
    if (!_isInitialized) return false;
    final value = _config[key] ?? false;
    return value is bool ? value : false;
  }

  double getDouble(String key) {
    if (!_isInitialized) return 0.0;
    final value = _config[key] ?? 0.0;
    return value is double ? value : (value is num ? value.toDouble() : 0.0);
  }
}
