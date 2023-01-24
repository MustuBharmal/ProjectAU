import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MyApp());
}

var num = 8;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
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
          children: <Widget>[
            ImageSlideshow(
              width: double.infinity,
              height: 220,
              initialPage: 0,

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 3000,

              /// Loops back to first slide.
              isLoop: true,
              children: [
                Image.asset(
                  'assets/images/sample_images1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/sample_images2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/sample_images3.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Divider(),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blueGrey,
                    Colors.blueAccent,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 230,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'All Details',
                    ),
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.cake),
              title: Text('happy Birthday1'),
            ),
            const ListTile(
              leading: Icon(Icons.cake),
              title: Text('happy Birthday2'),
            ),const ListTile(
              leading: Icon(Icons.cake),
              title: Text('happy Birthday3'),
            ),const ListTile(
              leading: Icon(Icons.cake),
              title: Text('happy Birthday4'),
            ),
          ],
        ),
      ),
    );
  }
}
