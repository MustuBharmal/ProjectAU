import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/category.dart';
import '../providers/data_provider.dart';
import '../screens/details_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void clicking(int num) {
      Navigator.of(context).pushReplacementNamed(
        DetailsScreen.routeName,
        arguments: {
          'category': categories[num],
        },
      );
    }

    String category = '';
    if (FirebaseAuth.instance.currentUser!.uid == 'Qi4FpTqpLMbBN0w1UBjtkH4tdpE3') {
      category = 'Yuvati';
    } else if (FirebaseAuth.instance.currentUser!.uid ==
        'nYDijzat6nZhTwxADul7T80Czr52') {
      category = 'Yuvak';
    } else if (FirebaseAuth.instance.currentUser!.uid ==
        'EyPoGULV3kVQ7gHatm0ZQrV1H3d2') {
      category = 'Ambrish';
    }
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            toolbarHeight: 100,
            title: Text(
              category,
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
                title: Text(category),
                onTap: () {
                  clicking(category == 'Yuvak'
                      ? 1
                      : (category == 'Ambrish' ? 2 : 0));
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
