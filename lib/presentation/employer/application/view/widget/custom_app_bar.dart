import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/sizes_manager.dart';

class SliverTabAppBar extends StatelessWidget {
  const SliverTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      bottom: TabBar(
        indicatorColor: ColorsManager.primary,
        indicatorWeight: 5,
        labelStyle:getRegularTextStyle(fontSize: FontSizeManager.s16,
            color: ColorsManager.white),
        tabs: [
        Tab(text: StringsManager.review,),
        Tab(text: StringsManager.completed),
      ],
      ),
title: Text(StringsManager.application),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      // pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: HeightManager.h200,
      leading:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(FontAwesomeIcons.barsStaggered,
          color: ColorsManager.primary.withOpacity(0.5),),
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
