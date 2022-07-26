import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

Future initializedNotification() async {
  final fcm = FirebaseMessaging.instance;

  fcm.getToken().then((value) => (debugPrint(value)));
  
  debugPrint(
      "Token: ${await FirebaseMessaging.instance.getToken().toString()}");

  
  FirebaseMessaging.onMessage.listen(_onMessageHandler);

 
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessageHandler);


  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint("Notifikasi sudah dibaca");
  });

  final message = await fcm.getInitialMessage();
  if (message != null) {
    debugPrint("Notif: ${message.data}");
  }
}

void _onMessageHandler(RemoteMessage message) {
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Notif: ${message.notification?.body}");
}

Future<void> _onBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint("Notif: ${message.notification?.title}");
  debugPrint("Notif: ${message.notification?.body}");
}