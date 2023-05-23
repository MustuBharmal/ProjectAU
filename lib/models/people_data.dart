import 'package:cloud_firestore/cloud_firestore.dart';

class PeopleData {
  String? id;
  final String name;
  final String address;
  final String age;
  final String bloodGroup;
  late final String category;
  final String contact;
  final String dob;
  final String education;
  final String area;
  late String imageUrl;

  PeopleData({
    this.id,
    required this.name,
    required this.address,
    required this.age,
    required this.bloodGroup,
    required this.category,
    required this.contact,
    required this.dob,
    required this.education,
    required this.area,
    required this.imageUrl,
  });

  toJson() {
    return {
      'name': name,
      'address': address,
      'age': age,
      'contact': contact,
      'bloodGroup': bloodGroup,
      'category': category,
      'dob': dob,
      'education': education,
      'area': area,
      'imageUrl': imageUrl,
    };
  }

  factory PeopleData.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PeopleData(
      id: document.id,
      name: data['name'],
      address: data['address'],
      age: data['age'],
      category: data['category'],
      contact: data['contact'],
      bloodGroup: data['bloodGroup'],
      dob: data['dob'],
      education: data['education'],
      area: data['area'],
      imageUrl: data['imageUrl'],
    );
  }
}
