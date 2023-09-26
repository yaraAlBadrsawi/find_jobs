import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../../../core/resources/sizes_manager.dart';

class SliverAppBarJS extends StatelessWidget {
  const SliverAppBarJS({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,

      leading:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(FontAwesomeIcons.barsStaggered,color: ColorsManager.primary.withOpacity(0.5),),
      ),


      // expandedHeight: HeightManager.h200,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
