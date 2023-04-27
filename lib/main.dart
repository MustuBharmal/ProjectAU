import 'package:demoapp/screens/add_new_detail_screen.dart';
import 'package:demoapp/screens/splash_screen.dart';

import '../providers/data_provider.dart';
import '../screens/detail_screen.dart';
import 'package:provider/provider.dart';
import '../screens/all_detail_screen.dart';
import '../screens/notification_screen.dart';
import 'screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<UserData> _availableDetails;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
          ).copyWith(secondary: Colors.redAccent),
        ),
        home: const SplashScreen(),
        routes: {
          AddNewDetailScreen.routeName:(ctx)=>const AddNewDetailScreen(),
          NotificationScreen.routeName: (ctx) => const NotificationScreen(),
          AllDetailScreen.routeName: (ctx) => const AllDetailScreen(),
          DetailScreen.routeNamed: (ctx) => const DetailScreen(),
          HomePage.routeName: (ctx) => const HomePage(),
        },
      ),
    );
  }
}
