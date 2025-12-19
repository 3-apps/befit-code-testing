import 'dart:developer';

class FacebookAppEvents {
  /// Re-enables auto logging of app events after user consent
  /// if disabled for GDPR-compliance.
  ///
  /// See: https://developers.facebook.com/docs/app-events/gdpr-compliance
  Future<void> setAutoLogAppEventsEnabled(bool enabled) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => print('FacebookAppEvents: setAutoLogAppEventsEnabled: $enabled'),
    );
  }

  /// Sets the Advert Tracking property
  Future<void> setAdvertiserTracking({required bool enabled}) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => print('FacebookAppEvents: setAdvertiserTracking: $enabled'),
    );
  }

  /// Log an app event with the specified [name] and the supplied [parameters] value.
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    log('FacebookAppEvents: logEvent - $name {$parameters}');
  }
}
