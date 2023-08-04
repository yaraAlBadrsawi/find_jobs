import 'package:flutter/material.dart';
import '../../presentation/resource/fonts_manager.dart';
import '../../presentation/resource/sizes_manager.dart';
import '../../presentation/util/size_util.dart';



class MainButton extends StatelessWidget {
  final double radius;
  final Widget child ;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final double? minWidth;
  final double? height;
  final ShapeBorder? shapeBorder;
  final Function() onPressed;


      MainButton( this.child,this.color, this.onPressed,
      {super.key, double? radius,  double? minWidth,double? height,EdgeInsetsGeometry? padding,
        ShapeBorder? shapeBorder,

      })
      :
        radius = radius ?? SizeUtil.setRadius(RadiusManager.r15),
        minWidth = minWidth ?? SizeUtil.setWidth(WidthManager.w1),
        height = minWidth ?? SizeUtil.setHeight(HeightManager.h20), //TODO :if something wrong then => add
        padding = padding ?? EdgeInsets.zero,
  shapeBorder = shapeBorder ??  const RoundedRectangleBorder();


//SizeUtil.setWidth(WidthManager.w15)
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: padding,
      onPressed: onPressed,
      color: color,
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              RadiusManager.r12,
            ),
          ),
          minWidth: minWidth,
          height: height,
          // style: ElevatedButton.styleFrom(
            elevation: 0, //TODO : if you want to add elevation for the button add it her
          //   backgroundColor: Colors.transparent,
          // ),
          child:child,
      // Text(
      //   text,
      //   style: TextStyle(fontSize: fontSize),
      // ),

    );
  }
}