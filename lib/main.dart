import '../screens/notification_screen.dart';

import 'screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        errorColor: Colors.purple,
      ),
      home: const HomePage(),
      routes:  {
        NotificationScreen.routeName: (ctx) => const NotificationScreen(),
      },
    );
  }
}
