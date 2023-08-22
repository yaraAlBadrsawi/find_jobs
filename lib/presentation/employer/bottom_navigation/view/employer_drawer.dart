import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widget/drawer/drawer_widget.dart';

class EmployerDrawer extends StatelessWidget {
   EmployerDrawer({super.key});

  List<String> titles = [
    StringsManager.logout,
    StringsManager.about,
    StringsManager.setting,
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.arrowRightFromBracket,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.gear,
  ];
  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      titles: titles,
      iconData: iconsList,
    );

  }
}
