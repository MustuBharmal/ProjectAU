import '../screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/list_provider.dart';
import '../widgets/all_details.dart';

class AllDetailScreen extends StatelessWidget {
  static const routeName = '/all_details_screen';

  const AllDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsData = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => AllDetails(
          detailsData.list[i].id,
          detailsData.list[i].name,
          detailsData.list[i].imageUrl,
          detailsData.list[i].category,
          detailsData.list[i].education,
        ),
        itemCount: detailsData.list.length,
      ),
    );
  }
}
