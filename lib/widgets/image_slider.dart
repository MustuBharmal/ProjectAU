import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.bhaskarassets.com/web2images/960/2021/07/27/1_1627361538.jpg',
      'https://www.static-contents.youth4work.com/university/Documents/Colleges/collegeLogo/1638902.png?v=20190131140940',
      'https://i.ytimg.com/vi/ItqsRDkEsEk/maxresdefault.jpg',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(4.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 15.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.8,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        // enlargeStrategy: CenterPageEnlargeStrategy.height,
        initialPage: 0,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
