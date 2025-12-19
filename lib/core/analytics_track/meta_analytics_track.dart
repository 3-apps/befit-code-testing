import 'dart:developer';

import 'package:befit_code_testing/core/analytics_track/analytics_track_interface.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

class MetaAnalyticsTrack implements AnalyticsTrackInterface {
  final FacebookAppEvents _facebookAppEvents;
  MetaAnalyticsTrack({required FacebookAppEvents facebookAppEvents})
    : _facebookAppEvents = facebookAppEvents;

  @override
  Future<void> initialize() async {
    try {
      await _facebookAppEvents.setAutoLogAppEventsEnabled(true);
      await _facebookAppEvents.setAdvertiserTracking(enabled: true);
    } catch (e) {
      log('Failed to initialize Meta Analytics: $e');
    }
  }

  @override
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    try {
      await _facebookAppEvents.logEvent(name: name, parameters: parameters);
    } catch (e) {
      log('Failed to send event $name: $e');
    }
  }
}
