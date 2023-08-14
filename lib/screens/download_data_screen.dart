import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

final db = FirebaseFirestore.instance;
const tappedIndex = 0;
List<List<String>> itemList = [];

class DownloadData extends StatefulWidget {
  const DownloadData({Key? key}) : super(key: key);

  @override
  State<DownloadData> createState() => _DownloadDataState();
}

class _DownloadDataState extends State<DownloadData> {
  Stream<QuerySnapshot> streamQuery = db.collection('peopleData').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList = [
      <String>[
        'name',
        'address',
        'age',
        'area',
        'bloodGroup',
        'category',
        'contact',
        'dob',
        'education'
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items to be exported'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: streamQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      DocumentSnapshot doc = snapshot.data!.docs[i];
                      itemList.add(
                        <String>[
                          doc.get('name'),
                          doc.get('address'),
                          doc.get('age'),
                          doc.get('area'),
                          doc.get('bloodGroup'),
                          doc.get('category'),
                          doc.get('dob'),
                          doc.get('education'),
                        ],
                      );
                      return Slidable(
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                              color: tappedIndex == i
                                  ? (Colors.green[400])!
                                  : (Colors.red[200])!,
                              elevation: 16,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Wrap(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doc.get('name'),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          doc.get('address'),
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          generateCsv(),
          Fluttertoast.showToast(
            msg: 'Item List was exported.',
          ),
          Navigator.of(context).pop(),
        },
        child: const Icon(
          Icons.file_download,
        ),
      ),
    );
  }
}

generateCsv() async {
  print('Generate CSV WAS CLICKED');

  String csvData = const ListToCsvConverter().convert(itemList);
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy-HH-mm-ss').format(now);
  saveFileToExternalStorage(csvData, formattedDate);
  // downloadCollectionAsCSV(itemList.cast<PeopleData>());
}

// Future downloadCollectionAsCSV(List<PeopleData>? docs) async {
//   docs = docs ?? [];
//   String fileContent = "name, address, age, dob";
//   docs.asMap().forEach((i, record) => fileContent = fileContent +
//       '\n' +
//       record.name +
//       ". " +
//       record.address+
//       ". " +
//       record.age +
//       ". " +
//       record.dob.toString());
//
//   final fileName = "FF${DateTime.now()}.csv";
//   var bytes = utf8.encode(fileContent);
//   final stream = Stream.fromIterable(bytes);
//   return download(stream, fileName);
//
// }
Future<void> saveFileToExternalStorage(
    String csvData, String formattedDate) async {
  final externalStorageDirectory = await getExternalStorageDirectory();
  final downloadDirectory = '${externalStorageDirectory?.path}/MyAppDownloads';

  final Directory appDownloadDirectory = Directory(downloadDirectory);
  if (!(await appDownloadDirectory.exists())) {
    await appDownloadDirectory.create(recursive: true);
    await setMediaScanSetting(
        downloadDirectory); // Optional: For media scanning
  }

  final file = File('$downloadDirectory/item_export_$formattedDate.csv');
  await file.writeAsString(csvData);
  print('File saved successfully!');
  String filePath = file.path;
  print('File path: $filePath');
}

Future<void> setMediaScanSetting(String directory) async {
  try {
    const MethodChannel channel = MethodChannel('flutter.io/path_provider');
    await channel.invokeMethod(
        'externalStorage.setMediaScanSetting', directory);
  } catch (e) {
    print('Error setting media scan setting: $e');
  }
}
