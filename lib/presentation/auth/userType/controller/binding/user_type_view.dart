import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';

import '../../../../../core/resources/sizes_manager.dart';


class UserTypeView extends StatelessWidget {
  const UserTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w20, vertical: HeightManager.h50),
        child: Column(children: [

          Image.asset(AssetsManager.facebook),
          Text('Ápp name'),
          Text('job Android & Ios app'),
          SizedBox(height: HeightManager.h50,),

          Text('continue as '),

          Text('fdsffffffffffffffffffffffffffffffffffffff'),
          //
          // Container(
          //   decoration: BoxDecoration(),
          //   child: ,)

        ],),
      ),

      );
  }
}
