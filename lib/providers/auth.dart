import 'dart:async';
import 'package:flutter/widgets.dart';

class Auth with ChangeNotifier {
  late String _token;
  DateTime _expiryDate = DateTime.now();
  late String _userId;
  late String _role;
  late Timer _authTimer;

  bool get isAuth {
    return token != '';
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return '';
  }

}
