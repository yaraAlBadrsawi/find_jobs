import 'package:flutter/material.dart';

import '../../../../core/resources/fonts_manager.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(child: Text('UserHomeView',style: TextStyle(fontSize: FontSizeManager.s50)

    )));
  }
}
