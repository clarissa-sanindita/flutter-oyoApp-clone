import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oyo/Hotel/modelHotel.dart';
import 'package:oyo/profile.dart';
import 'package:oyo/register.dart';
import 'package:provider/provider.dart';


import 'dash.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'notif.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializedNotification();
  runApp(ChangeNotifierProvider<HotelService>(
    create: (_) =>HotelService(),
    child: MyApp())
    );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title',
      initialRoute: '/login',
      routes: {
        '/': (context) => Dashboard(),
        '/login': (context) => login(),
        '/profile': (context) => Profile(),
        '/signin': (context) => register(),
      },
    );
  }
}


