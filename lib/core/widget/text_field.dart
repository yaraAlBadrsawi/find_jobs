
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

// TextFormField baseTextFormField({
//   required TextEditingController controller,
//   String? hintText,
//   TextInputType? keyboardType,
//   bool? obscureText,
//   validator,
//   FocusNode? focusNode,
//   onChange,
// }) {
//   return TextFormField(
//     style: getRegularTextStyle(
//       fontSize: FontSizeManager.s16,
//       color: ColorsManager.black,
//     ),
//     controller: controller,
//     keyboardType: keyboardType,
//     cursorColor: ColorsManager.primary,
//     // obscureText: obscureText.onNull(),
//     validator: validator,
//     focusNode: focusNode,
//     onChanged: onChange ?? (val) {},
//     decoration: InputDecoration(
//       filled: true,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: WidthManager.w16,
//         vertical: HeightManager.h6,
//       ),
//       fillColor: ColorsManager.white,
//       // hintText: hintText!.onNull(),
//       hintStyle: getRegularTextStyle(
//         fontSize: FontSizeManager.s16,
//         color: ColorsManager.grey,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           color: ColorsManager.white,
//         ),
//         borderRadius: BorderRadius.circular(
//           RadiusManager.r6,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           color: ColorsManager.primary,
//         ),
//         borderRadius: BorderRadius.circular(
//           RadiusManager.r6,
//         ),
//       ),
//     ),
//   );
// }



class AppTextFields extends StatelessWidget {
  const AppTextFields({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscure = false,
    this.validator,
    required this.hint,
    this.fillColor,
    this.filled,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
    this.prefixIcon,
    this.errorText,
    this.maxLines = 1,
    this.onTap,
  });


  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscure;
  final String? Function(String?)? validator;
  final String hint;
  final Color? fillColor;
  final Function(String)? onChanged;
  final bool? filled;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final String? errorText;
  final Function()? onTap;

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      // style: getRegularTextStyle() // TODO: ADD STYLE
      obscureText: obscure,
      readOnly:readOnly,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      onTap: onTap,
      cursorColor: ColorsManager.primary,
      decoration: InputDecoration(
        hintText: hint,

        // hintStyle: AppStyles.light(),
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor:fillColor,
        errorText: errorText,
        border: underlineInputBorder(), //grey
        errorBorder: underlineInputBorder(color: Colors.red), //red
        // focusedBorder: underlineInputBorder(color: ColorsManager.primary), //primary

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.white,
          ),
          borderRadius: BorderRadius.circular(
            RadiusManager.r6,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.primary,
          ),
          borderRadius: BorderRadius.circular(
            RadiusManager.r6,
          ),
        ),

      ),
    );
  }
}

UnderlineInputBorder underlineInputBorder({Color color = Colors.grey}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1.5,
    ),
  );
}

class AppPassFields extends StatelessWidget {
   AppPassFields(
      {super.key,
        this.filled,
        this.prefixIcon,
        this.fillColor,
        this.onChanged,
        this.validator,
      this.controller
      });

  final bool? filled;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final TextEditingController? controller;

bool secure=true;
@override
  Widget build(BuildContext context) {
    return AppTextFields(
      hint: 'Password',
      controller: controller,
      validator: validator,
      obscure: secure,
      onChanged: onChanged,
      prefixIcon:prefixIcon,
      suffixIcon: IconButton(
          onPressed: () {
            // setState(() {
              secure = !secure;
            // });
          },
          icon: Icon(Icons.remove_red_eye_rounded,
              color: secure == false ? Colors.green : ColorsManager.primary)),
      fillColor: fillColor,
      filled: filled,
    );
  }
}