import '../models/category.dart';
import '../models/user_data.dart';
import '../screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../widgets/all_details.dart';
import '../widgets/custom_search_delegate.dart';

class AllDetailScreen extends StatefulWidget {
  static const routeName = '/all_details_screen';

  const AllDetailScreen({super.key});

  @override
  State<AllDetailScreen> createState() => _AllDetailScreenState();
}

class _AllDetailScreenState extends State<AllDetailScreen> {
  Category? category;
  bool dataFetched = false;
  late List<UserData> userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!dataFetched) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      category = args['category'] as Category;
      if (category!.title == 'All Details') {
        userData = Provider.of<DataProvider>(context).getAllUser(category!.title);
      } else {
        userData = Provider.of<DataProvider>(context)
            .getUserByCategory(category!.title);
      }
    }

    dataFetched = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
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
