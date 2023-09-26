import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/job_seeker_drawer_view.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/sizes_manager.dart';

class SliverTabAppBar extends StatelessWidget {
  const SliverTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      // pinned: true,
      centerTitle: false,
      stretch: true,
      // expandedHeight: HeightManager.h220,
      leading: Padding(
        padding: EdgeInsets.all(WidthManager.w10),
        child: Icon(
          FontAwesomeIcons.barsStaggered,
          color: ColorsManager.primary.withOpacity(0.8),
        ),
      ),

      // expandedHeight: HeightManager.h200,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
