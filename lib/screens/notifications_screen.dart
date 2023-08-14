import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/notifications.dart';
import '../models/people_data.dart';
import '../providers/data_provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  static const routeName = '/notification';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Future<void> _refreshProd(BuildContext context) async {
    await Provider.of<DataProvider>(context, listen: false).fetchData();
  }

  String userId = '';
  var category = '';
  late List<PeopleData> userData;
  bool dataFetched = false;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userId = ModalRoute.of(context)!.settings.arguments as String;
    if (!dataFetched) {
      if (userId == 'Qi4FpTqpLMbBN0w1UBjtkH4tdpE3') {
        category = 'Yuvati';
      } else if (userId == 'nYDijzat6nZhTwxADul7T80Czr52') {
        category = 'Yuvak';
      } else if (userId == 'EyPoGULV3kVQ7gHatm0ZQrV1H3d2') {
        category = 'Ambrish';
      } else {
        category = 'admin';
      }
      userData = Provider.of<DataProvider>(context).getUserByCategory(category);
    }
    dataFetched = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birthdays',
        ),
      ),
      body: FutureBuilder(
        future: _refreshProd(context),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => _refreshProd(context),
                child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          Notifications(data);
                        },
                        itemCount: userData.length,
                      )
                    // : const Center(
                    //     child: Text('No birthdays'),
                    //   ),
              ),
      ),
    );
  }
}
