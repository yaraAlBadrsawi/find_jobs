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
      required this.subtitle,
      this.fields});

  final Widget? fields;
  final String header, dis, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: HeightManager.h70),
              color: ColorsManager.white,
              child: Text(
                header,
                style: getBoldTextStyle(
                    fontSize: FontSizeManager.s20, color: ColorsManager.black),
              ),
            ),

            SizedBox(
              height: HeightManager.h20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dis,
                      style: getRegularTextStyle(
                        fontSize: FontSizeManager.s35,
                        color: ColorsManager.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: HeightManager.h5,
                ),
                Text(
                  subtitle,
                  style: getTextStyle(
                      fontSize: FontSizeManager.s14, color: ColorsManager.grey),
                )
              ],
            ),
            SizedBox(
              height: HeightManager.h30,
            ),

            //fields
            fields ?? const SizedBox(),
            SizedBox(
              height: HeightManager.h10,
            ),

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
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    Text(
                      StringsManager.or,
                      style: getTextStyle(
                          fontSize: FontSizeManager.s12,
                          color: ColorsManager.black),
                    ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    Container(
                      height: HeightManager.h07,
                      width: MediaQuery.of(context).size.width / 2 - 40 - 10,
                      color: ColorsManager.black,
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxWidget(image: AssetsManager.facebook),
                    BoxWidget(image: AssetsManager.googleIcon)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String image;

  const BoxWidget({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: HeightManager.h40,
        alignment: Alignment.center,
        width: WidthManager.w40,
        decoration: BoxDecoration(
          color: ColorsManager.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(RadiusManager.r30),
          border: Border.all(
            color: ColorsManager.black.withOpacity(.2),
          ),
        ),
        child: SvgPicture.asset(
          image,
          height: HeightManager.h40,
          width: WidthManager.w40,
        ));
  }
}

/*



   AppLayout()

 */
