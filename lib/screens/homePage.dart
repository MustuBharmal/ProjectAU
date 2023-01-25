import 'package:flutter/material.dart';
import '../widgets/allDetails.dart';
import '../widgets/bdyNotification.dart';
import '../widgets/imageSlider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('AU App'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: CircleAvatar(
              child: Container(
                padding: const EdgeInsets.all(3),
              ),
            ),
            onTap: () {},
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: const <Widget>[
          ImageSlider(),
          Divider(),
          AllDetails(),
          BdyNotification(),
        ],
      ),
    );
  }
}
