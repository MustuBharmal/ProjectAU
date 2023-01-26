import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/details.dart';
class AllDetailScreen extends StatelessWidget {
  const AllDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailsData = Provider.of<Details>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Details'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(8), child: ListView.builder(itemBuilder: (_,i) => Container(), itemCount: 0,),),
    );
  }
}
