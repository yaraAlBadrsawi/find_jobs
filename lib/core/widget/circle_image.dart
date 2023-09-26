import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_mangaer.dart';
import '../resources/sizes_manager.dart';

class CircleImage extends StatelessWidget {
final   String imagePath;
final double size;
  const CircleImage(this.imagePath ,{this.size= 150 , super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsManager.lightWhite2,
          width: WidthManager.w8,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(WidthManager.w0),
        child: ClipOval(
          child: imagePath.isNotEmpty
              ? Image.network(
           imagePath,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context,
                Widget child,
                ImageChunkEvent?
                loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primary,
                  value: loadingProgress
                      .expectedTotalBytes !=
                      null
                      ? loadingProgress
                      .cumulativeBytesLoaded /
                      loadingProgress
                          .expectedTotalBytes!
                      : null,
                ),
              );
            },
          )
              : Image.asset(AssetsManager.defaultImage),
        ),
      ),
    );
  }
}
