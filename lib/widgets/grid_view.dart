import '../dummy_data.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class Gridview extends StatelessWidget {
  const Gridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
        ),
        children: dummyCategories
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            ).toList(),
      ),
    );
  }
}
