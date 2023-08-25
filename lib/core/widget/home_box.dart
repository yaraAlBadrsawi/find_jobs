import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/presentation/employer/home/controller/employer_controller.dart';
import 'package:graduation_project/presentation/employer/home/view/widget/sliver_search.dart';

import '../../presentation/employer/home/view/widget/job_post.dart';
import '../../presentation/employer/home/view/widget/sliver_app_bar.dart';
import '../../presentation/job_seeker/home/view/widget/job_seeker_jobs_posts.dart';
import '../resources/sizes_manager.dart';


// this is for Employer
class HomeBox extends GetView<EmployerHomeController> {
  final String title;
  final bool isEmployer;

  HomeBox(this.title, {this.isEmployer = true, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBarBldr(),
      const SliverSearch(),
      EmployerJobsPosts()
    ]);
  }
}
