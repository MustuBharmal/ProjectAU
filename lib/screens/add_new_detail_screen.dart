import '../models/user_data.dart';
import '../providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewDetailScreen extends StatefulWidget {
  const AddNewDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-product';

  @override
  State<AddNewDetailScreen> createState() => _AddNewDetailScreenState();
}

class _AddNewDetailScreenState extends State<AddNewDetailScreen> {
  final _contactFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _bloodGroupFocusNode = FocusNode();
  final _educationFocusNode = FocusNode();
  final _categoryFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedUser = UserData(
    id: '',
    name: '',
    age: '',
    bloodGroup: '',
    address: '',
    contact: '',
    imageUrl: '',
    education: '',
    category: '',
    dob: '',
  );
  var _isInit = true;
  var _isLoading = false;
  var _inItvalue = {
    'name': '',
    'address': '',
    'contact': '',
    'age': '',
    'bloodGroup': '',
    'category': '',
    'dob': '',
    'education': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as dynamic;
      if (productId != null) {
        _editedUser = Provider.of<DataProvider>(context).findById(productId);
        _inItvalue = {
          'name': _editedUser.name,
          'address': _editedUser.address,
          'contact': _editedUser.contact,
          'imageUrl': _editedUser.imageUrl,
          'age': _editedUser.age,
          'bloodGroup': _editedUser.bloodGroup,
          'category': _editedUser.contact,
          'dob': _editedUser.dob,
          'education': _editedUser.education,
        };
        _imageUrlController.text = _editedUser.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageUrl);
    _addressFocusNode.dispose();
    _ageFocusNode.dispose();
    _bloodGroupFocusNode.dispose();
    _categoryFocusNode.dispose();
    _dobFocusNode.dispose();
    _contactFocusNode.dispose();
    _educationFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedUser.id != '') {
      await Provider.of<DataProvider>(context, listen: false)
          .updateUser(_editedUser.id, _editedUser);
    } else {
      try {
        await Provider.of<DataProvider>(context, listen: false)
            .addProducts(_editedUser);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text(
              'Something went wrong',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _saveForm(),
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _inItvalue['name'],
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_contactFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['contact'],
                      decoration: const InputDecoration(
                        labelText: 'Contact Detail',
                      ),
                      textInputAction: TextInputAction.next,
                      focusNode: _contactFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_addressFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['address'],
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _addressFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_ageFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the description';
                        }
                        // if (value.length > 2) {
                        //   return 'Should be at least 10 character long.';
                        // }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['age'],
                      decoration: const InputDecoration(
                        labelText: 'Age',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _ageFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_bloodGroupFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['bloodGroup'],
                      decoration: const InputDecoration(
                        labelText: 'Blood Group',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _bloodGroupFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_educationFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['education'],
                      decoration: const InputDecoration(
                        labelText: 'Education',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _educationFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_categoryFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['category'],
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _categoryFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_dobFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _inItvalue['dob'],
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _dobFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = UserData(
                          id: _editedUser.id,
                          name: _editedUser.name,
                          address: _editedUser.address,
                          contact: _editedUser.contact,
                          imageUrl: _editedUser.imageUrl,
                          age: _editedUser.age,
                          bloodGroup: _editedUser.bloodGroup,
                          category: _editedUser.contact,
                          dob: _editedUser.dob,
                          education: _editedUser.education,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? const Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            // initialValue: _inItvalue['imageUrl'],
                            decoration: const InputDecoration(
                              labelText: 'Image URL',
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageFocusNode,
                            onFieldSubmitted: (_) => _saveForm(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an image.';
                              }
                              if (!value.startsWith('http') ||
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid URL1';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = UserData(
                                id: _editedUser.id,
                                name: _editedUser.name,
                                address: _editedUser.address,
                                contact: _editedUser.contact,
                                imageUrl: _editedUser.imageUrl,
                                age: _editedUser.age,
                                bloodGroup: _editedUser.bloodGroup,
                                category: _editedUser.contact,
                                dob: _editedUser.dob,
                                education: _editedUser.education,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
