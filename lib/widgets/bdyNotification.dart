import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class BdyNotification extends StatelessWidget {
  const BdyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // CarouselSlider.builder
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [
        'happy birthday1',
        'happy birthday2',
        'happy birthday3',
        'happy birthday4',
        'happy birthday5'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey),
                alignment: Alignment.center,
                child: Text(
                  i,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
