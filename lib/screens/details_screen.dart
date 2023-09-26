import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/people_data.dart';
import '../providers/data_provider.dart';
import '../screens/home_page.dart';
import '../widgets/all_details.dart';
import '../widgets/custom_search_delegate.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details_screen';

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Category? category;
  bool dataFetched = false;
  late List<PeopleData> userData;
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (!dataFetched) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      category = args['category'] as Category;
      userData =
          Provider.of<DataProvider>(context).getUserByCategory(category!.title);
    }

    dataFetched = true;
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).fetchData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category!.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              HomePage.routeNamed,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              size: 35.0,
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => AllDetails(
                userData[i].id,
                userData[i].name,
                userData[i].imageUrl,
                userData[i].category,
                userData[i].education,
              ),
              itemCount: userData.length,
            ),
    );
  }
}
