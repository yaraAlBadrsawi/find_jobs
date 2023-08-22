import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/widget/home_box.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/widget/radius_box.dart';
import '../../bottom_navigation/view/job_seeker_drawer_view.dart';

class UserHomeView extends GetView<UserHomeController> {
  UserHomeView({super.key});

  final _drawerController = AwesomeDrawerBarController();
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  final _advancedDrawerController = AdvancedDrawerController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: JobSeekerDrawer(),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorsManager.primary, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),

        child: Scaffold(

          key:_key,
          body: SafeArea(
            child: Column(
              children: [
                Row(children: [
                  IconButton(onPressed:() {

                    _advancedDrawerController.showDrawer();

                  }, icon: Icon(FontAwesomeIcons.barsStaggered,color: ColorsManager.primary,))

                ],)
                , Text(StringsManager.categories),
                Text(StringsManager.categories),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(WidthManager.w10),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: HeightManager.h50,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(WidthManager.w5),
                            child: IntrinsicWidth(
                              child: RadiusBox(
                                text: categories[index],
                                color: ColorsManager.secondary.withOpacity(0.8),
                                fontSize: FontSizeManager.s18,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Container(color: ColorsManager.primary,)),
                Flexible(
                  flex: 2,
                  child: HomeBox(StringsManager.recentJobs, isEmployer: false),
                )
              ],
            ),
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
