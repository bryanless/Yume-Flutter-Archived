import 'package:flutter/material.dart';
import 'package:yume_flutter/theme/shape.dart';

class CardAnimeImage extends StatelessWidget {
  const CardAnimeImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(YumeShape.roundedRectangle),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
