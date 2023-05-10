import 'package:firebase_auth/firebase_auth.dart';

import '../providers/auth.dart';
import '../screens/add_new_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import 'all_detail_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<DataProvider>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Admin'),
            automaticallyImplyLeading: false,
            leading: const CircleAvatar(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('All Details'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AllDetailScreen.routeName,
                arguments: {
                  'category': list.categories[0],
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Add Member'),
            onTap: () {
              Navigator.of(context).pushNamed(AddNewDetailScreen.routeName);
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
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
