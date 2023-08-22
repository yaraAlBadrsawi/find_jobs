import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/employer/home/view/widget/sliver_search.dart';

import '../../presentation/employer/home/view/widget/job_post.dart';
import '../../presentation/employer/home/view/widget/sliver_app_bar.dart';
import '../../presentation/job_seeker/home/view/widget/job_seeker_jobs_posts.dart';
import '../resources/sizes_manager.dart';

class HomeBox extends StatelessWidget {
  final String title;

  final bool isEmployer;

  HomeBox(this.title, {this.isEmployer = true, super.key});

  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
          slivers: [
            SliverAppBarBldr(),

            SliverSearch(),

            EmployerJobsPosts()
            ]


    );
  }
}
