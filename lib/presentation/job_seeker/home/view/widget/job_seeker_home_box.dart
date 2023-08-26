import 'package:flutter/material.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/widget/radius_box.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/widget/category_box.dart';

import '../../../../employer/home/view/widget/sliver_app_bar.dart';
import 'job_seeker_jobs_posts.dart';

class JobSeekerHomeBox extends StatelessWidget {
  const JobSeekerHomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, isScroll) {
          return [
            SliverAppBarBldr(),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h400,
                child: Flexible(
                    flex: 1,
                    child: 
                
                
                GridView.builder(

                    shrinkWrap: true,
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3, // Number of columns in the grid
                  mainAxisSpacing: 10.0, // Spacing between rows
                  crossAxisSpacing: 10.0, // Spacing between columns
                 //     mainAxisExtent: HeightManager.h100,

                    )
                    , itemBuilder: (context,index){
                  return CategoryBox(color: ColorsManager.primary.withOpacity(0.5),
                  text: categories[index],
                    image: categoriesImage[index],

                  );

                    })



                ),
              ),
              Padding(
                padding:  EdgeInsets.all(WidthManager.w5),
                child: Text('recommended jobs : ',),
              ),

              SizedBox(
                height: HeightManager.h500,
                child: Flexible(
                    flex: 1,
                    child:
                ListView.builder(itemBuilder: (context,index){

                  return JobSeekerJobsPosts();
                })


                ),
              ),
            ],
          ),
        ));
  }
}
