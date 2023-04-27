
import '../widgets/main_drawer.dart';

import '../widgets/body_detail.dart';
import '../screens/notification_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/image_slider.dart';
import '../widgets/notification_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = 'homepage_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MainDrawer(),
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
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
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
