import '../models/people_data.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class Notifications extends StatelessWidget {
  late PeopleData data;

  Notifications(data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              data.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            leading: CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(data.imageUrl),
            ),
            subtitle: Text(
              "Education: $data.education\n"
              "Category : $data.category",
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailScreen.routeName,
                arguments: data.id,
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
