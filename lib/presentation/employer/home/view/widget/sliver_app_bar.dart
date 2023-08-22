import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../../../core/resources/sizes_manager.dart';

class SliverAppBarBldr extends StatelessWidget {
  const SliverAppBarBldr({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: HeightManager.h100,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: Container(
          decoration: BoxDecoration(
              color: ColorsManager.primary,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(RadiusManager.r30),
                  bottomLeft: Radius.circular(RadiusManager.r30))),
        ),
      ),
    );
  }
}
