import 'package:flutter/material.dart';
import 'MyPagesUI/HomePage.dart';
import 'package:azkar_muslim/MyPagesUI/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAthkarNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openPendingNotificationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      navigatorKey: notificationNavigatorKey,

      home: StartUI(),
    );
  }
}
