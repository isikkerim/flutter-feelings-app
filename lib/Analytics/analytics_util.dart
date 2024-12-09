import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logButtonPress(String buttonName) async {
    await _analytics.logEvent(
      name: 'button_press',
      parameters: <String, Object>{
        'button_name': buttonName,
      },
    );
  }

  Future<void> logContainerTap(String containerName) async {
    await _analytics.logEvent(
      name: 'container_tap',
      parameters: <String, Object>{
        'container_name': containerName,
      },
    );
  }
}

