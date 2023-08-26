import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
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
   this. isConstraints= false ,
    this.length=0,
    // this.initialValue='',
  }
);

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
  final bool isConstraints  ;
  final int length;
 // final  String? initialValue;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [
            LengthLimitingTextInputFormatter(100), // Set maximum length to 100 characters
          ],
          // style: getRegularTextStyle() // TODO: ADD STYLE
          obscureText: obscure,
          readOnly: readOnly,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          onTap: onTap,
          cursorColor: ColorsManager.primary,
          decoration: InputDecoration(
            // hintStyle: AppStyles.light(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled,
            fillColor: fillColor,
            errorText: errorText,
            alignLabelWithHint: true,
            // This will move the label to the top
            labelStyle: TextStyle(color: ColorsManager.lightGrey),
            labelText: hint,


            border: underlineInputBorder(),
            //grey
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            //red
            // focusedBorder: underlineInputBorder(color: ColorsManager.primary), //primary

            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lightGrey,
              ),
              borderRadius: BorderRadius.circular(
                RadiusManager.r10,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.primary,
              ),
              borderRadius: BorderRadius.circular(
                RadiusManager.r10,
              ),
            ),
          ),
        ),

        SizedBox(height: HeightManager.h5), // Add spacing between text field and character count
        Text(
          isConstraints ? '${controller!.text.length}/$length':'',
          style: TextStyle(color: Colors.grey),
        ),
      ],
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
      this.controller});

  final bool? filled;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFields(
      hint: 'Password',
      controller: controller,
      validator: validator,
      obscure: secure,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
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
