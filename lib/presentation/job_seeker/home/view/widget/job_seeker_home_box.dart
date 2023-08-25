import 'package:flutter/material.dart';

import '../../../../employer/home/view/widget/sliver_app_bar.dart';

class JobSeekerHomeBox extends StatelessWidget {
  const JobSeekerHomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [

          const SliverAppBarBldr(),




        ]


    );
  }
}
