class PeopleData {
  String id;
  final String name;
  final String address;
  final String age;
  final String bloodGroup;
  final String category;
  final String contact;
  final String dob;
  final String education;
  final String area;
  final String imageUrl;

  PeopleData({
    required this.id,
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

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'address': address,
      'age': age,
      'contact': contact,
      'bloodGroup': bloodGroup,
      'category': category,
      'dob': category,
      'education': education,
      'area': area,
      'imageUrl': imageUrl,
    };
  }

  factory PeopleData.fromFirebase(Map<String, dynamic> data, String id) {
    return PeopleData(
      id: id,
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
