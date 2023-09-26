import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/model/application/application_details.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/employer/application/controller/employer_applicatin_controller.dart';
import 'package:graduation_project/presentation/employer/application/view/widget/application_card.dart';
import 'package:graduation_project/presentation/employer/application/view/widget/custom_app_bar.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/view/employer_drawer.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class EmployerApplicationView extends GetView<EmployerApplicationController> {
  const EmployerApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>   ApplicationLayout(
        EmployerDrawer(),
        controller.reviewApplications.value,
        controller.completedApplication.value,
        EmployerReviewApplication(),
      ))
    ;
    //  return ApplicationLayout(EmployerDrawer(),controller.reviewApplications ) ;
  }
}

class ApplicationLayout extends StatelessWidget {
  final Widget drawer;
  final List<dynamic> reviewApplication;
  final List<dynamic> completedApplication;
  final Widget reviewApplicationWidget;

  const ApplicationLayout(
    this.drawer,
    this.reviewApplication,
    this.completedApplication,
    this.reviewApplicationWidget, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: drawer,
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
        // controller: controller.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, isScroll) {
                  return [
                    SliverTabAppBar(),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: HeightManager.h30,
                            horizontal: WidthManager.w30),
                        color: ColorsManager.primary.withOpacity(0.8),
                        child: Text(
                          StringsManager.application,
                          style: getRegularTextStyle(
                            fontSize: FontSizeManager.s30,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          indicatorColor: ColorsManager.primary,
                          indicatorWeight: 5,
                          unselectedLabelColor: ColorsManager.grey,
                          // Set the text color for unselected tabs
                          labelColor: ColorsManager.primary,

                          labelStyle: getRegularTextStyle(
                              fontSize: FontSizeManager.s18,
                              color: ColorsManager.grey),
                          tabs: [
                            Tab(
                              text: StringsManager.review,
                            ),
                            Tab(text: StringsManager.completed),
                          ],
                          // Your TabBar properties here
                          // ...
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    reviewApplication.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                            backgroundColor: ColorsManager.white,
                            color: ColorsManager.primary,
                          ))
                        : reviewApplicationWidget,
                    // SizedBox(),
                    CompletedApplication(completedApplication),
                  ],
                ),
              ),
            )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ColorsManager.white.withOpacity(0.5),
      // Match the background color
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
