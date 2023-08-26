import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/employer/application/view/widget/custom_app_bar.dart';

import '../../home/view/widget/sliver_app_bar.dart';
class EmployerApplicationView extends StatelessWidget {
  const EmployerApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(

          body:  NestedScrollView(
            headerSliverBuilder: (context, isScroll) {
              return [
                SliverTabAppBar(),              ];
            },
            body: TabBarView(children: [
              Center(),
              Center(),

            ],),
          ),


        ),
      );

  }
}
