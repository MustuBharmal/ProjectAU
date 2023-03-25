import 'package:flutter/material.dart';

// enum Education {
//   SSC,
//   HSC,
//   Bachelors,
//   Masters,
//   PHD,
// }

// enum Category {
//   Ambrish,
//   Sadbhav,
//   Yuvak,
// }

class PersonDetail{
  final String id;
  final String name;
  final String address;
  final String bloodGroup;
  final String imageUrl;

  // final Education education;
  // final Category category;
  final String dob;

  PersonDetail({
    required this.id,
    required this.name,
    required this.address,
    required this.bloodGroup,
    required this.imageUrl,
    // required this.education,
    // required this.category,
    required this.dob,
  });
}

class Detail with ChangeNotifier {
  Map<String, Detail> _person = {};

  Map<String, Detail> get person {
    return {..._person};
  }
}
