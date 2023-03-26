import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class Notifications with ChangeNotifier {

  List<NotificationCard> _listOfNotification = [];
   void clear() {
     _listOfNotification = [];
     notifyListeners();
   }

  static void removeAt(index) {}
}
