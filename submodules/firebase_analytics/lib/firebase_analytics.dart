import 'dart:developer';

class FirebaseAnalytics {
  static final FirebaseAnalytics instance = FirebaseAnalytics._();
  
  FirebaseAnalytics._();

  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => print('FirebaseAnalytics: setAnalyticsCollectionEnabled: $enabled'),
    );
  }

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    log('FirebaseAnalytics: logEvent - $name {$parameters}');
  }
}
