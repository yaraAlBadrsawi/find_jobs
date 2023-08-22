import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../presentation/job_seeker/bottom_navigation/view/widget/drawer_item.dart';
import '../../../presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../resources/sizes_manager.dart';
import '../../resources/strings_manager.dart';

class DrawerWidget extends GetView<UserHomeController> {
  final List<String> titles;
  final List<IconData> iconData;

  const DrawerWidget({required this.titles, required this.iconData, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: ListTileTheme(
                textColor: ColorsManager.white,
                iconColor: ColorsManager.white,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Container(
                    width: WidthManager.w128,
                    height: HeightManager.h128,
                    margin: EdgeInsets.only(
                      top: HeightManager.h24,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      controller.employerModel.imageUrl, // app logo
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return DrawerItem(
                            title: titles[index],
                            icon: iconData[index],
                            onTap: () {
                              //
                              print('item is clicked');

                              if (titles[index] == StringsManager.logout) {

                                controller.signOut();
                              }
                            });
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ]))));
  }
}
