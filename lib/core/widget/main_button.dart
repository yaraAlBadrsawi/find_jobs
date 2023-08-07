import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';

import '../util/size_util.dart';


class MainButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function() onPressed;
  final Color color ;
  final double radius; // optional


  MainButton(
      {super.key,
        required this.child,
        required this.width,
        required this.height,
        required this.color,
        required this.onPressed,

        double? radius })
      : radius = radius ?? SizeUtil.setRadius(RadiusManager.r10);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // border: Border.all(width: 5, color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color

        // gradient: const LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     ManagerColor.oliveDrab,
        //     ManagerColor.oliveDrabDark,
        //   ],
        // ),
      ),
      child: ElevatedButton(
          onPressed: onPressed,

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorsManager.transparent,
          ),
          child:
      child

      //   Text(
      //   text,
      //   style: TextStyle(fontSize: fontSize),
      // )
      ),

    );
  }
}

// import 'package:flutter/material.dart';
// import '../../presentation/resource/fonts_manager.dart';
// import '../../presentation/resource/sizes_manager.dart';
// import '../../presentation/util/size_util.dart';
//
//
//
// class MainButton extends StatelessWidget {
//   final double radius;
//   final Widget child ;
//   final EdgeInsetsGeometry? padding;
//   final Color color;
//   final double? minWidth;
//   // final double? height;
//   final ShapeBorder? shapeBorder;
//   final Function() onPressed;
//
//
//       MainButton( this.child,this.color, this.onPressed,
//       {super.key, double? radius,
//         // double? height,
//         double? minWidth, EdgeInsetsGeometry? padding,
//         ShapeBorder? shapeBorder,
//
//       })
//       :
//         radius = radius ?? SizeUtil.setRadius(RadiusManager.r15),
//         minWidth = minWidth ?? SizeUtil.setWidth(WidthManager.w30),
//         // height = height ?? SizeUtil.setHeight(HeightManager.h50), //TODO :if something wrong then => add
//         padding = padding ?? EdgeInsets.zero,
//   shapeBorder = shapeBorder ??  const RoundedRectangleBorder();
//
//
// //SizeUtil.setWidth(WidthManager.w15)
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//         padding: padding,
//       onPressed: onPressed,
//       color: color,
//       shape: shapeBorder ??
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(
//               RadiusManager.r12,
//             ),
//           ),
//           minWidth: minWidth,
//           // height: height,
//           // style: ElevatedButton.styleFrom(
//             elevation: 0, //TODO : if you want to add elevation for the button add it her
//           //   backgroundColor: Colors.transparent,
//           // ),
//           child:child,
//       // Text(
//       //   text,
//       //   style: TextStyle(fontSize: fontSize),
//       // ),
//
//     );
//   }
// }