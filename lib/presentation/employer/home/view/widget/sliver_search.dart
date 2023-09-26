import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widget/search_bar.dart';

class SliverSearch extends StatelessWidget {
  final String title;

  const SliverSearch(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Container(
        color: ColorsManager.primary.withOpacity(0.50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w30, vertical: HeightManager.h5),
              child: Text(title,
                  style: getBoldTextStyle(
                      fontSize: IconSizeManager.s30, color: Colors.black)),
            ),
            SearchBarWidget(),
          ],
        ),
      );
    }, childCount: 1));
  }
}
