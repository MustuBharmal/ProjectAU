import '../widgets/grid_view.dart';
import '../screens/notification_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/bdy_notification.dart';
import '../widgets/imageSlider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'AU App',
          style: TextStyle(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  'https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png'),
              child: Container(
                padding: const EdgeInsets.all(3),
              ),
            ),
            onTap: () {},
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[
            ImageSlider(),
            Divider(),
            Gridview(),
            BdyNotification()
          ],
        ),
      ),
    );
  }
}
