
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';

class AppPopUpMenu extends StatelessWidget {
  const AppPopUpMenu({super.key, required this.list, this.onSelect, required this.txt});
  final List list;
  final String txt;
  final Function(Object)? onSelect;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorsManager.white,
      onSelected: onSelect,
      itemBuilder: ((context) {
        return list
            .map((e) => PopupMenuItem(
            value: e['index'],
            child: Center(
              child: Text(
                e[txt] as String,
                // style: AppStyles.light(),
              ),
            )))
            .toList();
      }),
      child:  Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorsManager.primary,
        size: IconSizeManager.s20,
      ),
    );
  }
}



class PopUpMenu extends StatelessWidget {
  final List<String> list;
  final void Function(String) onSelect;

  const PopUpMenu({super.key, required this.list, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelect,
      itemBuilder: (BuildContext context) {
        return list.map((String category) {
          return PopupMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList();
      },
      child: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color:ColorsManager.primary, // Change to your desired color
        size: 20.0, // Change to your desired size
      ),
    );
  }
}