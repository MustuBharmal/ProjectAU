import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import '../widgets/person_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/people_data.dart';
import '../providers/data_provider.dart';
import '../data/category.dart';

class AddPeopleData extends StatefulWidget {
  const AddPeopleData({Key? key}) : super(key: key);
  static const routeName = 'add_people_data';

  @override
  State<AddPeopleData> createState() => _AddPeopleDataState();
}

class _AddPeopleDataState extends State<AddPeopleData> {
  File? _selectedImage;
  String age = '0';
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _bloodGroup = TextEditingController();
  late var _category = categories[0];
  final _contact = TextEditingController();
  final _dob = TextEditingController();
  final _education = TextEditingController();
  final _area = TextEditingController();
  final _imageUrl = TextEditingController();
  var _editedUser = PeopleData(
    id: '',
    name: '',
    address: '',
    age: '',
    bloodGroup: '',
    category: '',
    contact: '',
    dob: '',
    education: '',
    area: '',
    imageUrl: '',
  );
  var _isInit = true;
  var _isLoading = false;
  var _inItValue = {
    'name': '',
    'address': '',
    'age': '',
    'contact': '',
    'bloodGroup': '',
    'category': '',
    'dob': '',
    'education': '',
    'area': '',
    'imageUrl': '',
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final personId = ModalRoute.of(context)!.settings.arguments as dynamic;
      if (personId != null) {
        _editedUser = Provider.of<DataProvider>(context).findById(personId);
        _inItValue = {
          'name': _editedUser.name,
          'address': _editedUser.address,
          'age': _editedUser.age,
          'contact': _editedUser.contact,
          'bloodGroup': _editedUser.bloodGroup,
          'category': _editedUser.category,
          'dob': _editedUser.dob,
          'education': _editedUser.education,
          'area': _editedUser.area,
          'imageUrl': _editedUser.imageUrl,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || _selectedImage == null) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedUser.id != '') {
      await Provider.of<DataProvider>(context, listen: false)
          .updatePerson(_editedUser.id, _editedUser);
    } else {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images')
          .child('${_name.text}.jpg');
      await storageRef.putFile(_selectedImage!);
      _editedUser.imageUrl = await storageRef.getDownloadURL();
      _editedUser = PeopleData(
        id: _editedUser.id,
        name: _name.text,
        address: _address.text,
        age: age,
        bloodGroup: _bloodGroup.text,
        category: _category.title.toString(),
        contact: _contact.text,
        dob: _dob.text,
        education: _education.text,
        area: _area.text,
        imageUrl: _editedUser.imageUrl,
      );
      await Provider.of<DataProvider>(context, listen: false)
          .addPeopleData(_editedUser);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add People'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _form,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  children: <Widget>[
                    PersonImagePicker(
                      onPickImage: (pickedImage) {
                        _selectedImage = pickedImage;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    nameTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    addressTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    bloodGroupField(),
                    const SizedBox(
                      height: 20,
                    ),
                    categoryField(),
                    const SizedBox(
                      height: 20,
                    ),
                    contactField(),
                    const SizedBox(
                      height: 20,
                    ),
                    dobField(),
                    const SizedBox(
                      height: 20,
                    ),
                    educationTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    areaTextField(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      // initialValue: _inItValue['name'],
      controller: _name,
      validator: (value) {
        if (value!.isEmpty) return "Name can't be empty";
        return null;
      },
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.person,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Full Name",
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      // initialValue: _inItValue['address'],
      controller: _address,
      validator: (value) {
        if (value!.isEmpty) return "Address can't be empty";
        return null;
      },
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.add_business_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Address",
        helperText: "Address can't be empty",
        hintText: "Bhagwatipara, Rajkot",
      ),
    );
  }

  Widget bloodGroupField() {
    return TextFormField(
      // initialValue: _inItValue['bloodGroup'],
      controller: _bloodGroup,
      validator: (value) {
        if (value!.isEmpty) return "Bloodgroup can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.bloodtype_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Blood Group",
        helperText: "Blood Group can't be empty",
        hintText: "AB+",
      ),
    );
  }

  Widget categoryField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.category_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Choose your category",
        helperText: "Category can't be empty",
      ),
      value: _category,
      items: [
        for (final category in categories)
          DropdownMenuItem(
            value: category,
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  category.title,
                ),
              ],
            ),
          ),
      ],
      onChanged: (value) {
        setState(() {
          _category = value!;
        });
      },
    );
  }

  Widget contactField() {
    return TextFormField(
      // initialValue: _inItValue['contact'],
      controller: _contact,
      validator: (value) {
        if (value!.isEmpty) return "Contact Number can't be empty";

        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.contacts_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Contact Number",
        helperText: "Contact can't be empty",
        hintText: "99XXX21345",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      // initialValue: _inItValue['dob'],
      // validator: (value) {
      //   if (calculateAge(DateTime.parse(value!)) < 16 || value.isEmpty) {
      //     return 'Please enter date.';
      //   }
      //   return null;
      // },
      readOnly: true,
      controller: _dob,
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.cake_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: 'Birth Date',
        helperText: "Birth Date can't be empty",
        hintText: 'Pick your Date',
      ),
      onTap: () async {
        var date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
        if (date != null) {
          setState(() {
            age = calculateAge(date).toString();
          });
          _dob.text = DateFormat('dd/MM/yyyy').format(date);
        }
      },
    );
  }

  Widget educationTextField() {
    return TextFormField(
      // initialValue: _inItValue['education'],
      controller: _education,
      validator: (value) {
        if (value!.isEmpty) return "Education can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.cast_for_education_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Education",
        helperText: "It can't be empty",
        hintText: "B.TECH",
      ),
    );
  }

  Widget areaTextField() {
    return TextFormField(
      // initialValue: _inItValue['area'],
      controller: _area,
      validator: (value) {
        if (value!.isEmpty) return "Area field can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: borderDecorate(),
        focusedBorder: focusedBorderDecorate(),
        prefixIcon: Icon(
          Icons.location_city_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: "Area",
        helperText: "Which Area belongs to.",
        hintText: "Area 1",
      ),
    );
  }

  OutlineInputBorder borderDecorate() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.teal,
      ),
    );
  }

  OutlineInputBorder focusedBorderDecorate() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      ),
    );
  }
}
