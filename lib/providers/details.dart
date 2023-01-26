enum Education {
  SSC,
  HSC,
  Bachelors,
  Masters,
  PHD,
}

enum Category {
  Ambrish,
  Sadbhav,
  Yuvak,
}

class Details {
  final String name;
  final String address;
  final String bloodgrup;
  final String imageUrl;
  final Education education;
  final Category category;
  final String dob;

  const Details({
    required this.name,
    required this.address,
    required this.bloodgrup,
    required this.imageUrl,
    required this.education,
    required this.category,
    required this.dob,
  });
}
