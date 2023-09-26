import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/presentation/employer/home/controller/employer_controller.dart';
import 'package:graduation_project/presentation/employer/home/view/widget/sliver_search.dart';

import '../../../../../core/resources/strings_manager.dart';
import 'job_post.dart';
import 'sliver_app_bar.dart';
import '../../../../job_seeker/home/view/widget/job_seeker_jobs_posts.dart';
import '../../../../../core/resources/sizes_manager.dart';

// this is for Employer
class EmployerHomeBox extends GetView<EmployerHomeController> {
  final String title;
  final bool isEmployer;

  EmployerHomeBox(this.title, {this.isEmployer = true, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBarBldr(),
      SliverSearch(StringsManager.employerDes),
      const EmployerJobsPosts(),
    ]);
  }
}
