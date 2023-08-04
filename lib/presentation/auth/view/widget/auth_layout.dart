
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/presentation/resource/sizes_manager.dart';

import '../../../resource/colors_mangaer.dart';
import '../../../resource/fonts_manager.dart';
import '../../../resource/styles_manager.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout(
      {super.key,
        this.leading,
        required this.header,
        required this.dis,
        this.fields});
  final Widget? leading, fields;
  final String header, dis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // page header
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        header,
                        style:  getRegularTextStyle(
                          fontSize: FontSizeManager.s38,
                          color: ColorsManager.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: WidthManager.w5,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Text(
                        dis,
                        style: getTextStyle(fontSize: FontSizeManager.s12, color: ColorsManager.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: WidthManager.w45,),

              //fields
              fields ?? const SizedBox(),
              SizedBox(width: WidthManager.w45,),

              //bottom
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: .7,
                        width: MediaQuery.of(context).size.width / 2 - 40 - 10,
                        color: ColorsManager.black,
                      ),
                      SizedBox(height: HeightManager.h10,),
                      Text(
                        'Or',
                        style:getTextStyle(fontSize: FontSizeManager.s12, color: ColorsManager.black),
                      ),
                      SizedBox(height: HeightManager.h10,),
                      Container(
                        height: .7,
                        width: MediaQuery.of(context).size.width / 2 - 40 - 10,
                        color: ColorsManager.black,
                      )
                    ],
                  ),
                 // SizedBox(width: WidthManager.w20,),
                 //  Row(
                 //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 //    children: [
                 //      BoxWidget(image: 'images/Facebook_logo_(square).png'),
                 //      BoxWidget(image : 'images/Instagram-Icon.png')
                 //    ],
                 //  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class BoxWidget extends StatelessWidget {
  final String image ;
  const BoxWidget({required this.image, super.key});

  @override
  Widget build(BuildContext context) {

      return Container(
        height: 52,
        alignment: Alignment.center,
        width: 52,
        decoration: BoxDecoration(
          color: ColorsManager.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsManager.black.withOpacity(.2),
          ),
        ),
        child:
    SvgPicture.asset(
    image,
      height: HeightManager.h35,
      width: WidthManager.w35,
    )
      );
  }
}


/*



   AppLayout()

 */