import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import '../models/user_data.dart';
import '../models/category.dart';

class DataProvider with ChangeNotifier {
  final List<UserData> _list = [
    UserData(
      id: 'p1',
      name: 'Mahesh',
      age: '28',
      bloodGroup: 'A+',
      address: 'Rajkamal Chowk, Rajkot',
      contact: '6398785412',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg',
      education: 'SSC',
      category: 'Yuvak',
      dob: '1/1/1988',
    ),
    UserData(
      id: 'p2',
      name: 'Ramesh',
      age: '36',
      bloodGroup: 'B+',
      address: 'Aakashvani Chowk, Rajkot',
      contact: '7896541232',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Akshay_Kumar.jpg/330px-Akshay_Kumar.jpg',
      education: 'HSC',
      category: 'Ambrish',
      dob: '10/9/198',
    ),
    UserData(
      id: 'p3',
      name: 'Haresh',
      age: '34',
      bloodGroup: 'O+',
      address: 'University Road, Rajkot',
      contact: '9632587412',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/330px-Indian_actor_Amitabh_Bachchan.jpg',
      education: 'Bachelors',
      category: 'Sadbhav',
      dob: '8/8/1998',
    ),
    UserData(
      id: 'p4',
      name: 'Tanveer',
      age: '42',
      bloodGroup: 'O-',
      address: 'Bhagwatipara Road, Rajkot',
      contact: '9874569854',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg/330px-Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
      education: 'Masters',
      category: 'Sadbhav',
      dob: '10/9/1998',
    ),
    UserData(
      id: 'p5',
      name: 'Manoj',
      age: '42',
      address: 'Bhagwatipara Road, Rajkot',
      contact: '8521478963',
      bloodGroup: 'AB+',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/d/d2/Ranbir_Kapoor_promoting_Brahmastra.jpg',
      education: 'PHD',
      category: 'Yuvak',
      dob: '28/1/1998',
    ),
    UserData(
      id: 'p6',
      name: 'Murtaza',
      age: '24',
      address: 'Bhagwatipara Road, Rajkot',
      contact: '8521478963',
      bloodGroup: 'AB',
      imageUrl: 'https://fileinfo.com/img/ss/xl/jpg_44.png',
      education: 'SSC',
      category: 'Ambrish',
      dob: '28/1/2004',
    ),
  ];

  final List<Category> _categories = [
    const Category(
      id: 'c1',
      title: 'All Details',
    ),
    const Category(
      id: 'c2',
      title: 'Sadbhav',
    ),
    const Category(
      id: 'c3',
      title: 'Yuvak',
    ),
    const Category(
      id: 'c4',
      title: 'Ambrish',
    ),
    const Category(
      id: 'c5',
      title: 'Menchus',
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

  List<UserData> get list {
    return [..._list];
    // ... is a spread operator
  }

  // List<UserData> get sadbhavList {
  //   return _list.where((element) => element.);
  //   // ... is a spread operator
  // }
  List<UserData> getUserByCategory(String categroy) {
    List<UserData> userList = [];
    userList.addAll(_list.where((element) => element.category == categroy));
    return userList;
  }

  List<UserData> getAllUser(String categroy) {
    List<UserData> userList = [];
    userList.addAll(_list);
    return userList;
  }

  UserData findById(String id) {
    return _list.firstWhere((prod) => prod.id == id);
  }

  Future<void> updateUser(String id, UserData newUser) async {
    final prodIndex = _list.indexWhere((prodId) => prodId.id == id);
    if (prodIndex >= 0) {
      // final uri = Uri.parse(
      //   'https://flutter-project-802a7-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken',
      // );
      // await http.patch(uri,
      //     body: json.encode({
      //       'name': newUser.name,
      //       'address': newUser.address,
      //       'imageUrl': newUser.imageUrl,
      //       'contact': newUser.contact,
      //     }));
      _list[prodIndex] = newUser;
      notifyListeners();
    } else {}
  }

  void clear(int a) {
    _listOfNotification = [];
    notifyListeners();
  }

  Future<void> addProducts(UserData data) async {
    // final uri = Uri.parse(
    //   'https://flutter-project-802a7-default-rtdb.firebaseio.com/products.json?auth=$authToken',
    // );
    // try {
    //   final response = await http.post(
    //     uri,
    //     body: json.encode(
    //       {
    // 'name': newUser.name,
    // 'address': newUser.address,
    // 'imageUrl': newUser.imageUrl,
    // 'contact': newUser.contact,
    // 'creatorId': userId,
    //   },
    // ),
    // );
    final newUser = UserData(
      id: DateTime.now().toString(),
      // id: json.decode(response.body)['name'],
      name: data.name,
      address: data.address,
      contact: data.contact,
      imageUrl: data.imageUrl,
      age: data.age,
      bloodGroup: data.bloodGroup,
      category: data.contact,
      dob: data.dob,
      education: data.education,
    );
    _list.add(newUser);
    notifyListeners();
  }

// catch (error) {
//   print(error);
//   throw error;
// }
  Category findById2(String id) {
    return _categories.firstWhere((prod) => prod.id == id);
  }
}

