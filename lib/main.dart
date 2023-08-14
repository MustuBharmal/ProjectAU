import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/data_provider.dart';
import '../screens/add_people_data.dart';
import '../screens/all_detail_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/details_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/splash_screen.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';

final user = FirebaseAuth.instance.currentUser;
var userId = user!.uid;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
            accentColor: Colors.white,
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return HomePage(userId);
            }
            return const AuthScreen();
          },
        ),
        routes: {
          AllDetailScreen.routeName: (ctx) => const AllDetailScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
          AddPeopleData.routeName: (ctx) => const AddPeopleData(),
          NotificationsScreen.routeName: (ctx) => const NotificationsScreen(),
          DetailScreen.routeName: (ctx) => const DetailScreen(),
          HomePage.routeNamed: (ctx) => HomePage(userId),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
        },
      ),
    );
  }
}
//
