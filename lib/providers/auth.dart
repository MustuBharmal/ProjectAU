import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime.now();
  late String _userId;
  late Timer _authTimer;

  bool get isAuth {
    return token != '';
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate.isAfter(DateTime.now()) && _token != '') {
      return _token;
    }
    return '';
  }


  // Future<void> signUp(String email, String password) async {
  //   return _authenticate(email, password, 'signUp');
  // }
  //
  // Future<void> login(String email, String password) async {
  //   return _authenticate(email, password, 'signInWithPassword');
  // }

  Future<bool> tryAutoLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return false;
    }
    return true;
  }

  Future<void> logout() async {
    _token = '';
    _userId = '';
    _expiryDate = DateTime.now();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}
