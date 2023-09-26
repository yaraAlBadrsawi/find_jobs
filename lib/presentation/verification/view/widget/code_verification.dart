import 'package:flutter/material.dart';
import '../../../../../config/constants.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/sizes_manager.dart';


class CodeVerification extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode previousFocusNode;
  final void Function(String value) onChanged;
  final String? Function(String?)? validator;

  const CodeVerification({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.previousFocusNode,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        keyboardType: TextInputType.number,
        maxLength: Constants.codeVerificationMaxLine,
        textInputAction: TextInputAction.done,
        cursorColor: ColorsManager.primary,
        onChanged: (value) {
          onChanged(value);
          if (value.isEmpty) {
            previousFocusNode.requestFocus();
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.fillInputVerification,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              RadiusManager.r10,
            ),
            borderSide: BorderSide(
              width: WidthManager.w1,
              color: ColorsManager.focusedBorderInputVerification,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              RadiusManager.r10,
            ),
            borderSide: BorderSide(
              width: WidthManager.w1,
              color: Colors.white,
            ),
          ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.enabledBorderInputVerification
              )
            )
        ),
      ),
    );
  }
}
