import 'package:flutter/material.dart';
import 'lists.dart';

class ListProvider with ChangeNotifier {
  final List<Lists> _list = [

    Lists(
      id: 'p1',
      name: 'Mahesh',
      address: 'Rajkamal Chowk, Rajkot',
      bloodGroup: 'A+',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg',
      education: Education.SSC,
      category: Category.Yuvak,
      dob: '1/1/1988',
    ),
    Lists(
        id: 'p2',
        name: 'Ramesh',
        address: 'Aakashvani Chowk, Rajkot',
        bloodGroup: 'B+',
        imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Akshay_Kumar.jpg/330px-Akshay_Kumar.jpg',
        education: Education.HSC,
        category: Category.Ambrish,
        dob: '10/9/198',),
    Lists(
      id: 'p3',
      name: 'Haresh',
      address: 'University Road, Rajkot',
      bloodGroup: 'O+',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/330px-Indian_actor_Amitabh_Bachchan.jpg',
      education: Education.Bachelors,
      category: Category.Sadbhav,
      dob: '8/8/1998',
    ),
    Lists(
      id: 'p4',
      name: 'Tanveer',
      address: 'Bhagwatipara Road, Rajkot',
      bloodGroup: 'O-',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg/330px-Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
      education: Education.Masters,
      category: Category.Sadbhav,
      dob: '10/9/1998',
    ),
    Lists(
      id: 'p5',
      name: 'Manoj',
      address: 'Bhagwatipara Road, Rajkot',
      bloodGroup: 'AB+',
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/d/d2/Ranbir_Kapoor_promoting_Brahmastra.jpg',
      education: Education.PHD,
      category: Category.Yuvak,
      dob: '28/1/1998',
    ),

  ];


  List<Lists> get list {
    return [..._list];
    // ... is a spread operator
  }
  Lists findById(String id) {
    return _list.firstWhere((prod) => prod.id == id);
  }

}