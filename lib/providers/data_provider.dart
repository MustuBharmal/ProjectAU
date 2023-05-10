import 'package:demoapp/constant/firestore_constant.dart';
import 'package:demoapp/models/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import '../models/people_data.dart';
import '../models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class DataProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final List<PeopleData> _list = [
    PeopleData(
      id: 'p1',
      name: 'Mahesh',
      address: 'Rajkamal Chowk, Rajkot',
      age: '28',
      bloodGroup: 'A+',
      category: 'Yuvak',
      contact: '6398785412',
      dob: '1/1/1988',
      education: 'SSC',
      area: 'Area 1',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg',
    ),
    PeopleData(
      id: 'p2',
      name: 'Ramesh',
      address: 'Aakashvani Chowk, Rajkot',
      age: '36',
      bloodGroup: 'B+',
      category: 'Ambrish',
      contact: '7896541232',
      dob: '10/9/198',
      education: 'HSC',
      area: 'Area 2',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Akshay_Kumar.jpg/330px-Akshay_Kumar.jpg',
    ),
    PeopleData(
      id: 'p3',
      name: 'Haresh',
      address: 'University Road, Rajkot',
      age: '34',
      bloodGroup: 'O+',
      category: 'Yuvati',
      contact: '9632587412',
      dob: '8/8/1998',
      education: 'Bachelors',
      area: 'Area 3',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/330px-Indian_actor_Amitabh_Bachchan.jpg',
    ),
    PeopleData(
      id: 'p4',
      name: 'Tanveer',
      address: 'Bhagwatipara Road, Rajkot',
      age: '42',
      bloodGroup: 'O-',
      category: 'Yuvati',
      contact: '9874569854',
      dob: '10/9/1998',
      education: 'Masters',
      area: 'Area 4',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg/330px-Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
    ),
    PeopleData(
      id: 'p5',
      name: 'Manoj',
      address: 'Bhagwatipara Road, Rajkot',
      age: '42',
      bloodGroup: 'AB+',
      category: 'Yuvak',
      contact: '8521478963',
      dob: '28/1/1998',
      education: 'PHD',
      area: 'Area 5',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/d/d2/Ranbir_Kapoor_promoting_Brahmastra.jpg',
    ),
    PeopleData(
      id: 'p6',
      name: 'Murtaza',
      address: 'Bhagwatipara Road, Rajkot',
      age: '24',
      bloodGroup: 'AB',
      category: 'Ambrish',
      contact: '8521478963',
      dob: '28/1/2004',
      education: 'SSC',
      area: 'Area 6',
      imageUrl: 'https://fileinfo.com/img/ss/xl/jpg_44.png',
    ),
  ];

  final List<Category> _categories = [
    const Category(
      id: 'c1',
      title: 'All Details',
    ),
    const Category(
      id: 'c2',
      title: 'Yuvati',
    ),
    const Category(
      id: 'c3',
      title: 'Yuvak',
    ),
    const Category(
      id: 'c3',
      title: 'Ambrish',
    ),
  ];
  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 1',
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

  List<Category> get categories {
    return [..._categories];
  }

  List<NotificationCard> get listOfNotification {
    return [..._listOfNotification];
  }

  List<PeopleData> get list {
    return [..._list];
    // ... is a spread operator
  }

  List<PeopleData> getUserByCategory(String categroy) {
    List<PeopleData> userList = [];
    userList.addAll(_list.where((element) => element.category == categroy));
    return userList;
  }

  List<PeopleData> getAllUser(String categroy) {
    List<PeopleData> userList = [];
    userList.addAll(_list);
    return userList;
  }

  PeopleData findById(String id) {
    return _list.firstWhere((prod) => prod.id == id);
  }

  Future<void> updateUser(String id, PeopleData newPerson) async {}

  void clear(int a) {
    _listOfNotification = [];
    notifyListeners();
  }

  Future<void> fetchAndSetPeopleData() async {
    // DatabaseReference peopleDataRef =
    //     FirebaseDatabase.instance.ref('peopleData/');
    // peopleDataRef.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   print(data); // updateUser(data)
    // });

    // DatabaseReference ref = FirebaseDatabase.instance.ref();
    // await ref.set({
    //
    // });
    // // final url = Uri.parse(
    // //   'https://demoapp-9cfcc-default-rtdb.firebaseio.com/peopleData.json',
    // // );
    // try {
    //   final response = await http.get(url);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   final List<PeopleData> loadedData = [];
    //   extractedData.forEach((personId, data) {
    //     loadedData.add(
    //       PeopleData(
    //         id: personId,
    //         name: data['name'],
    //         address: data['address'],
    //         age: data['age'],
    //         bloodGroup: data['bloodGroup'],
    //         category: data['category'],
    //         contact: data['contact'],
    //         dob: data['dob'],
    //         education: data['education'],
    //         area: data['area'],
    //         imageUrl: data['imageUrl'],
    //       ),
    //     );
    //   });
    //   _list = loadedData;
    //   notifyListeners();
    // } catch (error) {
    //   throw (error);
    // }
  }

  Future<void> addPeopleData(PeopleData data) async {
    try {
      final doc = await db.collection(peopleDataRef).add(data.getJson());
      if (doc.id != '') {
        data.id = doc.id;
      }
      notifyListeners();
      _list.add(data);
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Category findById2(String id) {
    return _categories.firstWhere((prod) => prod.id == id);
  }

  Future<void> deletePerson(String id) async {
    final url = Uri.parse(
        'https://flutter-project-802a7-default-rtdb.firebaseio.com/products/$id.json');
    final existingPersonIndex = _list.indexWhere((person) => person.id == id);
    var existingPerson = _list[existingPersonIndex];

    _list.removeAt(existingPersonIndex);
    notifyListeners();
    // final response = await http.delete(url);
    // if (response.statusCode >= 400) {
    //   _list.insert(existingPersonIndex, existingPerson);
    //   notifyListeners();
    //   throw HttpException('Could not delete this.');
    // }
    // existingPerson = null as PeopleData;
  }
}
