import 'package:befit_code_testing/core/remote_config/remote_key.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart' as frc;

abstract class RemoteConfigInterface {
  Future<void> setup();
  String getString(RemoteKey key);
  int getInt(RemoteKey key);
  bool getBool(RemoteKey key);
  double getDouble(RemoteKey key);
  Map<String, dynamic> getMap(RemoteKey key);
  List<dynamic> getList(RemoteKey key);
}

class FirebaseRemoteConfig implements RemoteConfigInterface {
  final frc.FirebaseRemoteConfig _firebaseRemoteConfig;
  FirebaseRemoteConfig({required frc.FirebaseRemoteConfig firebaseRemoteConfig})
    : _firebaseRemoteConfig = firebaseRemoteConfig;

  @override
  Future<void> setup() async => await _firebaseRemoteConfig.fetchAndActivate();

  @override
  String getString(RemoteKey key) => _firebaseRemoteConfig.getString(key.name);

  @override
  int getInt(RemoteKey key) => _firebaseRemoteConfig.getInt(key.name);

  @override
  bool getBool(RemoteKey key) => _firebaseRemoteConfig.getBool(key.name);

  @override
  double getDouble(RemoteKey key) => _firebaseRemoteConfig.getDouble(key.name);

  @override
  Map<String, dynamic> getMap(RemoteKey key) {
    return {};
  }

  @override
  List<dynamic> getList(RemoteKey key) {
    return [];
  }
}
