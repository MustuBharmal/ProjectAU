import '../models/category.dart';

final List<Category> categories = [
  const Category(
    id: 'c1',
    title: 'All Details',
    role: 'r0',
  ),
  const Category(
    id: 'c2',
    title: 'Yuvati',
    role: 'r1',
  ),
  const Category(
    id: 'c3',
    title: 'Yuvak',
    role: 'r2',
  ),
  const Category(
    id: 'c3',
    title: 'Ambrish',
    role: 'r2',
  ),
];
// List<Category> get categories {
//   return [..._categories];
// }
Category findById2(String id) {
  return categories.firstWhere((prod) => prod.id == id);
}
