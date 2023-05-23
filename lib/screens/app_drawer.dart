import 'package:demoapp/screens/all_detail_screen.dart';

import '../data/category.dart';
import '../screens/add_people_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import 'details_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            toolbarHeight: 100,
            title: const Text(
              'Admin',
            ),
            automaticallyImplyLeading: false,
            leading: CircleAvatar(
              child: IconButton(
                color: Colors.white,
                icon: (Image.asset(
                  "assets/images/profileImage.png",
                  // fit: BoxFit.fill,
                  width: 70,
                  height: 70,
                  color: Colors.white,
                )),
                onPressed: () {},
              ),
            ),
            elevation: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('All Details'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    AllDetailScreen.routeName,
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('Add Member'),
                onTap: () {
                  Navigator.of(context).pushNamed(AddPeopleData.routeName);
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('Logout'),
                onTap: () {
                  Provider.of<DataProvider>(context, listen: false).logout();
                },
              ),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
