import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/category.dart';
import '../widgets/admin_app_drawer.dart';
import '../widgets/app_drawer.dart';
import '../widgets/image_slider.dart';
import '../widgets/notification_card.dart';
import 'add_people_data.dart';
import 'details_screen.dart';
import 'notifications_screen.dart';

class HomePage extends StatelessWidget {
  static const routeNamed = '/homepage_screen';

  const HomePage({super.key});

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

    String checkUser() {
      if (FirebaseAuth.instance.currentUser!.uid == 'Qi4FpTqpLMbBN0w1UBjtkH4tdpE3') {
        return 'yuvati';
      } else if (FirebaseAuth.instance.currentUser!.uid ==
          'nYDijzat6nZhTwxADul7T80Czr52') {
        return 'yuvak';
      } else if (FirebaseAuth.instance.currentUser!.uid ==
          'EyPoGULV3kVQ7gHatm0ZQrV1H3d2') {
        return 'ambrish';
      }
      return 'admin';
    }

    var admin = 'VJnIWLC5DpXniGLnQgVIuoBUAR32';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: const Text(
            'AU App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                NotificationsScreen.routeName,
              );
            },
          ),
        ],
      ),
      drawer: FirebaseAuth.instance.currentUser?.uid == admin ? const AdminAppDrawer() : const AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            const ImageSlider(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (checkUser() == 'yuvak' || checkUser() == 'admin')
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 25, 0, 0),
                          child: Ink(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            // color: Colors.black54,
                            decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.account_box),
                              color: Theme.of(context).colorScheme.secondary,
                              tooltip: 'Yuvak',
                              onPressed: () {
                                clicking(1);
                              },
                              iconSize: 45.00,
                            ),
                          ),
                        ),
                      if (checkUser() == 'yuvati' || checkUser() == 'admin')
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                          child: Ink(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.account_balance_wallet),
                              tooltip: 'Yuvati',
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: () {
                                clicking(0);
                              },
                              iconSize: 45.00,
                            ),
                          ),
                        ),
                      if (checkUser() == 'ambrish' || checkUser() == 'admin')
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                          child: Ink(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: ShapeDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.ad_units),
                              tooltip: 'Ambrish',
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: () {
                                clicking(2);
                              },
                              iconSize: 45.00,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 25, 0, 25),
                        child: Ink(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.cake),
                            tooltip: 'Birthday',
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {},
                            iconSize: 45.00,
                          ),
                        ),
                      ),
                      // if (checkUser() == 'admin')
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 25, 25, 25),
                        child: Ink(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add_circle),
                            tooltip: 'Add New',
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AddPeopleData.routeName,
                              );
                            },
                            iconSize: 45.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: NotificationCards(),
            ),
          ],
        ),
      ),
    );
  }
}
