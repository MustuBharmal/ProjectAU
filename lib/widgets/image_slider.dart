import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: ImageSlideshow(
        width: double.infinity,
        height: 230,
        initialPage: 0,

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 9000,

        /// Loops back to first slide.
        isLoop: true,
        children: [
          Image.network(
            'https://images.bhaskarassets.com/web2images/960/2021/07/27/1_1627361538.jpg',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://www.static-contents.youth4work.com/university/Documents/Colleges/collegeLogo/1638902.png?v=20190131140940',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://i.ytimg.com/vi/ItqsRDkEsEk/maxresdefault.jpg',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
