import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../screens/all_detail_screen.dart';
import 'package:flutter/material.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<DataProvider>(context);
    void clicking(int num) {
      Navigator.of(context).pushReplacementNamed(
        AllDetailScreen.routeName,
        arguments: {
          'category': list.categories[num],
        },
      );
    }

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
                    color: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_box),
                    tooltip: 'details',
                    color: Colors.orange[500],
                    onPressed: () {
                      clicking(0);
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
                    color: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.cake),
                    tooltip: 'details',
                    color: Colors.orange[500],
                    onPressed: () {
                      clicking(1);
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
                    color: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add_box_rounded),
                    tooltip: 'details',
                    color: Colors.orange[500],
                    onPressed: () {
                      clicking(2);
                    },
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
                    color: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'details',
                    color: Colors.orange[500],
                    onPressed: () {
                      clicking(3);
                    },
                    iconSize: 60.00,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 25, 25, 25),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: ShapeDecoration(
                    color: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_balance_sharp),
                    tooltip: 'details',
                    color: Colors.orange[500],
                    onPressed: () {
                      clicking(4);
                    },
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
