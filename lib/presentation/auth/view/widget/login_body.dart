import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/resource/fonts_manager.dart';
import 'package:graduation_project/presentation/resource/sizes_manager.dart';
import 'package:graduation_project/presentation/resource/strings_manager.dart';
import 'package:graduation_project/presentation/resource/styles_manager.dart';

import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/text_field.dart';
import '../../../resource/colors_mangaer.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

 final  GlobalKey<FormState> _key = GlobalKey();

  // bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SizedBox(
        child: Column(
          children: [
            AppTextFields(
              hint: 'UserName',
              validator: (name) {
                // return AppValidator.requiredField(name ?? '');
              },
            ),
           SizedBox(width: WidthManager.w20,),
            AppPassFields(
              validator: (pass) {
                // return AppValidator.passFieldValidator(pass ?? '');
              },
            ),
            SizedBox(width: WidthManager.w20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                 StringsManager.forgetPassword,
                  // style: AppStyles.links(),
                )
              ],
            ),
            SizedBox(width: WidthManager.w10,),

            MainButton(
                Text(
                  StringsManager.login,
                  style: TextStyle(fontSize: FontSizeManager.s16),
                ),
                ColorsManager.primary,
                () {
                  if (_key.currentState!.validate()) {
                    //go to Home page
                  }
                }),
            MainButton(
                Text(
                  StringsManager.signUp,
                  style: TextStyle(fontSize: FontSizeManager.s16),
                ),

                ColorsManager.green,
                 () {

                }),
SizedBox(width: WidthManager.w20,)     ,
            FutureBuilder(
              // future: Authentication.fireBaseInit(),
              builder: (context, snap) {
                if (snap.hasError) {
                  return Text('Error while initializing firebase');
                } else if (snap.connectionState == ConnectionState.done) {
                  return InkWell(
                    onTap: () async {
                      // setState(() {
                      //   isSignIn = true;
                      // // });
                      // User? user = await Authentication.signInWithGoogle(
                      //     context: context);
                      // setState(() {
                      //   isSignIn = false;
                      // });
                      // if (user != null) {
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => UserHome(user: user)));
                      // }
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: ColorsManager.primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Sign In With Google',
                          style: getRegularTextStyle(fontSize: FontSizeManager.s14, color: ColorsManager.white),
                        ),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(ColorsManager.primary),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}