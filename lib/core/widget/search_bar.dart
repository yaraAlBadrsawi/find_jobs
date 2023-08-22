import 'package:flutter/material.dart';

import '../resources/colors_mangaer.dart';
import '../resources/sizes_manager.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(WidthManager.w20) ,
      child: Container(
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        height: HeightManager.h60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular (RadiusManager.r20) / 2,
          color: ColorsManager.grey,
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: WidthManager.w10),
          child: TextFormField(

            textAlignVertical: TextAlignVertical.center,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.only(top: HeightManager.h12),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              prefixIcon:const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Search About job you posted ',
            ),
          ),
        ),
      ),
    );
  }
}