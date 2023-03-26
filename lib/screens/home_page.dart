import '../widgets/main_drawer.dart';

import '../widgets/body_detail.dart';
import '../screens/notification_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/image_slider.dart';
import '../widgets/notification_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text(
          'AU App',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[
            ImageSlider(),
            BodyDetail(),
            Divider(),
            Expanded(
              child: NotificationCards(),
            ),
          ],
        ),
      ),
    );
  }
}
