import 'package:flutter/material.dart';
import 'providers/details.dart';
import './providers/category.dart' as cat;

const dummyCategories = [
  cat.Category(
    id: 'c1',
    title: 'All Details',
    color: Colors.purple,
  ),
  cat.Category(
    id: 'c2',
    title: 'Category',
    color: Colors.red,
  ),
  cat.Category(
    id: 'c3',
    title: 'Leader',
    color: Colors.orange,
  ),
  cat.Category(
    id: 'c4',
    title: 'Area',
    color: Colors.amber,
  ),
  cat.Category(
    id: 'c5',
    title: 'Education',
    color: Colors.blue,
  ),
  cat.Category(
    id: 'c6',
    title: 'About',
    color: Colors.green,
  ),
];

const dummyDetails = [
  Details(
    name: 'Mahesh',
    address: 'Rajkamal Chowk, Rajkot',
    bloodgrup: 'A+',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg',
    education: Education.SSC,
    category: Category.Yuvak,
    dob: '1/1/1988',
  ),
  Details(
      name: 'Ramesh',
      address: 'Aakashvani Chowk, Rajkot',
      bloodgrup: 'B+',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Akshay_Kumar.jpg/330px-Akshay_Kumar.jpg',
      education: Education.HSC,
      category: Category.Ambrish,
      dob: '10/9/198'),
  Details(
    name: 'Haresh',
    address: 'University Road, Rajkot',
    bloodgrup: 'O+',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/330px-Indian_actor_Amitabh_Bachchan.jpg',
    education: Education.Bachelors,
    category: Category.Sadbhav,
    dob: '8/8/1998',
  ),
  Details(
    name: 'Tanveer',
    address: 'Bhagwatipara Road, Rajkot',
    bloodgrup: 'O-',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg/330px-Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
    education: Education.Masters,
    category: Category.Sadbhav,
    dob: '10/9/1998',
  ),
  Details(
    name: 'Manoj',
    address: 'Bhagwatipara Road, Rajkot',
    bloodgrup: 'AB+',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/d2/Ranbir_Kapoor_promoting_Brahmastra.jpg',
    education: Education.PHD,
    category: Category.Yuvak,
    dob: '28/1/1998',
  ),
];
