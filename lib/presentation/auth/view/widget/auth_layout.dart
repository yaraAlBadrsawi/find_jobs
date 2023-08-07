
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';



class AuthLayout extends StatelessWidget {
  const AuthLayout(
      {super.key,
        required this.header,
        required this.dis,
        this.fields});
  final Widget? fields;
  final String header, dis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      // appBar: AppBar(
      //   leading: leading,
      // ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h60),
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
                          color: ColorsManager.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: HeightManager.h5,),
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
              SizedBox(height: HeightManager.h45,),

              //fields
              fields ?? const SizedBox(),
              SizedBox(height: HeightManager.h45,),

              //bottom
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: HeightManager.h07,
                        width: MediaQuery.of(context).size.width / 2 - 40 - 10,
                        color: ColorsManager.black,
                      ),
                      SizedBox(height: HeightManager.h10,),
                      Text(
                        StringsManager.or,
                        style:getTextStyle(fontSize: FontSizeManager.s12, color: ColorsManager.black),
                      ),
                      SizedBox(height: HeightManager.h10,),
                      Container(
                        height: HeightManager.h07,
                        width: MediaQuery.of(context).size.width / 2 - 40 - 10,
                        color: ColorsManager.black,
                      )
                    ],
                  ),
                 SizedBox(width: WidthManager.w20,),
                 const  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BoxWidget(image:AssetsManager.facebook),
                      BoxWidget(image : AssetsManager.googleIcon)
                    ],
                  ),
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
        height:HeightManager.h52,
        alignment: Alignment.center,
        width: WidthManager.w52,
        decoration: BoxDecoration(
          color: ColorsManager.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(RadiusManager.r10),
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