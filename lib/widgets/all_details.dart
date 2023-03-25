import '../providers/list_provider.dart';
import '../screens/detail_screen.dart';
import '../providers/lists.dart';
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:provider/provider.dart';

class AllDetails extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final Category category;
  final Education education;

  const AllDetails(
      this.id, this.name, this.imageUrl, this.category, this.education,
      {super.key});

  @override
  Widget build(BuildContext context) {
    String cat = EnumToString.convertToString(category);
    String ed = EnumToString.convertToString(education);
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
              "Education: $ed\n"
              "Category : $cat",
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
