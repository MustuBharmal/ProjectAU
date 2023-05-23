import '../models/people_data.dart';
import '../screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../widgets/all_details.dart';
import '../widgets/custom_search_delegate.dart';

class AllDetailScreen extends StatefulWidget {
  static const routeName = '/all_detail_screen';

  const AllDetailScreen({super.key});

  @override
  State<AllDetailScreen> createState() => _AllDetailScreenState();
}

class _AllDetailScreenState extends State<AllDetailScreen> {
  bool dataFetched = false;
  late List<PeopleData> userData;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!dataFetched) {
      userData = Provider.of<DataProvider>(context).getAllUser();
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
        title: const Text(
          "All Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
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
          ? const CircularProgressIndicator()
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
