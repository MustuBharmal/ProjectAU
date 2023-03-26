import '../screens/detail_screen.dart';
import 'package:flutter/material.dart';

class AllDetails extends StatelessWidget {

  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final String education;
  const AllDetails(this.id, this.name, this.imageUrl, this.category, this.education, {super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            leading: CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(imageUrl),
            ),
            subtitle: Text(
              "Education: $education\n"
              "Category : $category",
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailScreen.routeNamed,
                arguments: (id),
              );
            },
            horizontalTitleGap: 30,
            minVerticalPadding: 20,
            minLeadingWidth: 65,
          ),
          const SizedBox(
            height: 20.0,
            child: Divider(),
          )
        ],
      ),
    );
  }
}
