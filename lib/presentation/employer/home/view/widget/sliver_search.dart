import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widget/search_bar.dart';

class SliverSearch extends StatelessWidget {
  const SliverSearch({super.key});

  @override
  Widget build(BuildContext context) {


    return SliverList(
        delegate:
        SliverChildBuilderDelegate((BuildContext context, int index) {

        return  Container(
          color: ColorsManager.primary.withOpacity(0.50),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(WidthManager.w10),
                child: Text(StringsManager.employerDes,


                style:getBoldTextStyle(fontSize: IconSizeManager.s28,
                    color: Colors.black)
                ),
              ),
            SizedBox(height: HeightManager.h20,),
             SearchBarWidget(),

            ],
          ),
        );
        }, childCount: 1));








  }
}






