import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const routeNamed = '/detail_screen';

  @override
  Widget build(BuildContext context) {
    final detailId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedData = Provider.of<DataProvider>(
      context,
      listen: false,
    ).findById(detailId);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedData.name),
              background: Hero(
                tag: loadedData.id,
                child: Image.network(
                  loadedData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                    'Age:- ${loadedData.age}\n\n'
                    'Date of Birth:- ${loadedData.dob}\n\n'
                    'Blood Group:-  ${loadedData.bloodGroup}\n\n'
                    'Address:-  ${loadedData.address}\n\n'
                    'Education:-  ${loadedData.education}\n\n'
                    'Contact:-  ${loadedData.contact}\n\n',
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false),
                  ),
                ),
                const SizedBox(
                  height: 800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
