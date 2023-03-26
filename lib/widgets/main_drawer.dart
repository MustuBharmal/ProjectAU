import '../theme/text_theme.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData icon, VoidCallback? ontapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: titleTextStyle,
      ),
      onTap: ontapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Colors.orange,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 75,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Text(
                  'Hello, there!',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // buildListTile(
          //   'Meals',
          //   Icons.restaurant,
          //   () {
          //     Navigator.of(context).pushReplacementNamed('/');
          //   },
          // ),
          // buildListTile(
          //   'Filters',
          //   Icons.settings,
          //   () {},
          // ),
        ],
      ),
    );
  }
}
