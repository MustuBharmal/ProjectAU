import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 220,
      initialPage: 0,

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 9000,

      /// Loops back to first slide.
      isLoop: true,
      children: [
        Image.asset(
          'assets/images/sample_images1.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/sample_images2.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/sample_images3.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
