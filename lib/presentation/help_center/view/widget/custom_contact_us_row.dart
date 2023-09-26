import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';

import '../../../../core/resources/styles_manager.dart';

class CustomContactUsRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String body;
  final GestureTapCallback? onTap;

  const CustomContactUsRow(
      {Key? key,
        required this.iconPath,
        required this.title,
        required this.body,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              width: 48,
              height: 48,
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(title),
                const SizedBox(
                  height: 6,
                ),
                Text(body,style: getRegularTextStyle(fontSize: FontSizeManager.s16,color: Colors.black),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}