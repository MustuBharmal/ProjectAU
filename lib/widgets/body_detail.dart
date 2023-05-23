import '../data/category.dart';
import '../screens/add_people_data.dart';
import '../screens/details_screen.dart';
import 'package:flutter/material.dart';

class BodyDetail extends StatefulWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {

  void clicking(int num) {
    Navigator.of(context).pushReplacementNamed(
      DetailsScreen.routeName,
      arguments: {
        'category': categories[num],
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      clicking(2);
                    },
                    iconSize: 45.00,
                  ),
                ),
              ),
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
                      clicking(1);
                    },
                    iconSize: 45.00,
                  ),
                ),
              ),
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
                      clicking(3);
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
                    onPressed: () {
                      // clicking(3);
                    },
                    iconSize: 45.00,
                  ),
                ),
              ),
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
                      Navigator.of(context).pushNamed(AddPeopleData.routeName);
                    },
                    iconSize: 45.00,
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
