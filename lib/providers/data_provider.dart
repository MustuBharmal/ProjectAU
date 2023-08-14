import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

import '/constant/firestore_constant.dart';
import '../models/people_data.dart';

class DataProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final List<PeopleData> _list = [];
  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'Birthday',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 4',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 5',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ];

  List<NotificationCard> get listOfNotification {
    return [..._listOfNotification];
  }

  List<PeopleData> get list {
    return [..._list];
    // ... is a spread operator
  }

  List<PeopleData> getUserByCategory(String category) {
    List<PeopleData> userList = [];
    userList.addAll(_list.where((element) => element.category == category));
    notifyListeners();
    return userList;
  }

  List<PeopleData> getAllUser() {
    List<PeopleData> userList = [];
    userList.addAll(_list);
    notifyListeners();
    return userList;
  }

  PeopleData findById(String id) {
    return _list.firstWhere((person) => person.id == id);
  }

  PeopleData birthday() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return _list.firstWhere((person) => person.dob == formattedDate.toString());
  }

  Future<void> updatePerson(String? id, PeopleData newPerson) async {
    var col = db.collection('peopleData');
    col.doc('id').update(
          newPerson.toJson(),
        );
    notifyListeners();
  }

  void clear(int a) {
    _listOfNotification = [];
    notifyListeners();
  }

  Future<void> fetchData() async {
    _list.clear();
    final docRef = db.collection('peopleData');
    docRef.get().then(
      (ref) {
        for (var element in ref.docs) {
          _list.add(PeopleData.fromSnapshot(element));
        }
      },
      onError: (e) => print('Error getting document: $e'),
    );
    notifyListeners();
  }

  Future<void> addPeopleData(PeopleData data) async {
    try {
      final doc = await db.collection(peopleDataRef).add(data.toJson());
      if (doc.id != '') {
        data.id = doc.id;
      }
      _list.add(data);
      notifyListeners();
    } catch (error) {
      // print(error);
      throw error;
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<List<PeopleData>> allPersonDetails() async {
    final snapshot = await db.collection('peopleData').get();
    final personData =
        snapshot.docs.map((e) => PeopleData.fromSnapshot(e)).toList();
    return personData;
  }
}
// Future<void> deletePerson(String id) async {
//   final url = Uri.parse(
//       'https://flutter-project-802a7-default-rtdb.firebaseio.com/products/$id.json');
//   final existingPersonIndex = _list.indexWhere((person) => person.id == id);
//   var existingPerson = _list[existingPersonIndex];
//
//   _list.removeAt(existingPersonIndex);
//   notifyListeners();
// final response = await http.delete(url);
// if (response.statusCode >= 400) {
//   _list.insert(existingPersonIndex, existingPerson);
//   notifyListeners();
//   throw HttpException('Could not delete this.');
// }
// existingPerson = null as PeopleData;
// }
