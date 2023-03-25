import '../screens/all_detail_screen.dart';
import 'package:flutter/material.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_box),
                    tooltip: 'details',
                    color: Colors.white70,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(AllDetailScreen.routeName);
                    },
                    iconSize: 60.00,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_circle_outlined),
                    tooltip: 'details',
                    color: Colors.white70,
                    onPressed: () {},
                    iconSize: 60.00,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add_box_rounded),
                    tooltip: 'details',
                    color: Colors.white70,
                    onPressed: () {},
                    iconSize: 60.00,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(70, 25, 0, 25),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'details',
                    color: Colors.white70,
                    onPressed: () {},
                    iconSize: 60.00,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 25, 25, 25),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_balance_sharp),
                    tooltip: 'details',
                    color: Colors.white70,
                    onPressed: () {},
                    iconSize: 60.00,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
