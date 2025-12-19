import 'dart:developer';

import 'package:befit_code_testing/core/analytics_track/analytics_track_interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class GoogleAnalyticsTrack implements AnalyticsTrackInterface {
  final FirebaseAnalytics _firebaseAnalytics;
  GoogleAnalyticsTrack({required FirebaseAnalytics firebaseAnalytics})
    : _firebaseAnalytics = firebaseAnalytics;

  @override
  Future<void> initialize() async {
    try {
      await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    } catch (e) {
      log('Failed to initialize Google Analytics: $e');
    }
  }

  @override
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    try {
      await _firebaseAnalytics.logEvent(name: name, parameters: parameters);
    } catch (e) {
      log('Failed to send event $name: $e');
    }
  }
}

