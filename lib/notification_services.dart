import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notifications Initialized!');
    }
  }

  static Future<void> sendNotification(String notificationTitle,
      String notificationBody, String fcmToken) async {
    const serverKey =
        'AAAADERvY_c:APA91bFplmf8Gb4tFYL8qm5TmcL2dfs3QFgzf58oItYTjTVrbvrSz0nhvyg9DSapcGf0UwWZ9UMR4cjhQ5IP5UlFG9bG2DaX9RI_5wqbxuVQhCqjqXTs32geBjvuolLTTCOU0XXpu6iD';
    const url = 'https://fcm.googleapis.com/fcm/send';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final notification = {
      'title': notificationTitle,
      'body': notificationBody,
    };

    final message = {
      'to': fcmToken, // The FCM token of the target device
      'notification': notification,
      'priority': 'high',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print(
            'Failed to send notification. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  //  final String myDeviceToken =
  //     "cymr6z34SYGBMNKl3Hk8Z9:APA91bE0CjSm_rzpAKZHubh_UcvAzlIYZ4SZO7jLvncXWYvFqOSdqJxuC2Cy6rXpF1_sWz9nqrT9AznNEtuUqHjqX9BCCwqcBBHfKYNs-tKMlgnO4M_YK01-ISxzA9p5GN5_0oVUiti6";

  // final String myDeviceToken2 =
  //     'cymr6z34SYGBMNKl3Hk8Z9:APA91bE0CjSm_rzpAKZHubh_UcvAzlIYZ4SZO7jLvncXWYvFqOSdqJxuC2Cy6rXpF1_sWz9nqrT9AznNEtuUqHjqX9BCCwqcBBHfKYNs-tKMlgnO4M_YK01-ISxzA9p5GN5_0oVUiti6';
  // final String sameerDeiceToken =
  //     'fzfnGXLdQWWWYZRMEZNjJo:APA91bE1UWSmQ-eNlVK3OAP0tMh9JUT4mRg3RpIwEXV1JoN3eF5rfITeC6nrlClsDCJafpya1CBV7kTuer_yvsNs-uL_6X2TSgk5LdfiXut1W1kO30nMxodwK950cazIF7AbKrBkm6ls';
}
