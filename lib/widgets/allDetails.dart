import 'package:flutter/material.dart';

class AllDetails extends StatelessWidget {
  const AllDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: 230,
        child: GestureDetector(
          onTap: () {},
          child: const Text(
            'All Details',
          ),
        ),
      ),
    );
  }
}
