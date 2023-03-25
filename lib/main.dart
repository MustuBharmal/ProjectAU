import '../providers/detail.dart';
import '../providers/list_provider.dart';
import '../screens/detail_screen.dart';
import 'package:provider/provider.dart';
import '../screens/all_detail_screen.dart';
import '../screens/notification_screen.dart';
import 'screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ListProvider() ,
        ),
        ChangeNotifierProvider(

         create: (ctx) => Detail(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
          ).copyWith(secondary: Colors.redAccent),
        ),
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          NotificationScreen.routeName: (ctx) => const NotificationScreen(),
          AllDetailScreen.routeName: (ctx) => const AllDetailScreen(),
          DetailScreen.routeNamed: (ctx) => const DetailScreen(),
        },
      ),
    );
  }
}
