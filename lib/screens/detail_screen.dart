import '../screens/add_people_data.dart';
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
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: const Text(
            'Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPeopleData.routeName,
                arguments: loadedData.id,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(18),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    loadedData.imageUrl,
                    height: 280,
                    width: 500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(20),
                  // height: 50,
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width - 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name:- ${loadedData.name}',
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: ListTile(
                    title: Text(
                      'Age:- ${loadedData.age}\n\n'
                      'Date of Birth:- ${loadedData.dob}\n\n'
                      'Blood Group:-  ${loadedData.bloodGroup}\n\n'
                      'Address:-  ${loadedData.address}\n\n'
                      'Education:-  ${loadedData.education}\n\n'
                      'Contact:-  ${loadedData.contact}\n\n',
                      // textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // const SizedBox(
      //   height: 800,
      // ),
    );
  }
}
