// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9628H0KFvrR3mlW35tIjpbj3-WyKEUVc',
    appId: '1:731401386496:android:b2d7cd3838b96c8a8f36e5',
    messagingSenderId: '731401386496',
    projectId: 'demoapp-9cfcc',
    databaseURL: 'https://demoapp-9cfcc-default-rtdb.firebaseio.com',
    storageBucket: 'demoapp-9cfcc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxGdHzPkHRTuhtW2BBAv23wvM4AFlfq1I',
    appId: '1:731401386496:ios:702fc73c6d7515a78f36e5',
    messagingSenderId: '731401386496',
    projectId: 'demoapp-9cfcc',
    databaseURL: 'https://demoapp-9cfcc-default-rtdb.firebaseio.com',
    storageBucket: 'demoapp-9cfcc.appspot.com',
    androidClientId: '731401386496-662u0um64urqb6f9oemcfrh6j57ihiid.apps.googleusercontent.com',
    iosClientId: '731401386496-o48gadvgacr26kt66stsdofu28cth1ac.apps.googleusercontent.com',
    iosBundleId: 'com.example.demoapp',
  );
}
