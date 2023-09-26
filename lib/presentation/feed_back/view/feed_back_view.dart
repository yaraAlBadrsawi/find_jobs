import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/feed_back_controller.dart';

class FeedBackView extends GetView<FeedBackController> {
  const FeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // child: SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: GetBuilder<FeedBackController>(
          //     builder: (controllerImp) {
          //       return Form(
          //           key: controllerImp.feedbackController,
          //           child: Column(
          //             children: [
          //               CustomAppBar(
          //                 title: feedback.tr,
          //               ),
          //               const SizedBox(height: 40),
          //               RoundedImage2(
          //                 imagePath: Get.arguments['storeLogo'],
          //                 height: 165,
          //                 width: 165,
          //                 borderRadius: BorderRadius.circular(80),
          //               ),
          //               RatingBar.builder(
          //                 initialRating: 0,
          //                 minRating: 0.5,
          //                 direction: Axis.horizontal,
          //                 allowHalfRating: true,
          //                 itemCount: 5,
          //                 itemPadding: const EdgeInsets.only(
          //                     left: 8, right: 8, top: 60, bottom: 40),
          //                 unratedColor: Colors.grey.shade200,
          //                 itemBuilder: (context, _) => SvgPicture.asset(
          //                   AppImageAsset.fullStar,
          //                   width: 24,
          //                   height: 24,
          //                 ),
          //                 onRatingUpdate: (rating) {
          //                   controllerImp.updateRate(rating);
          //                 },
          //               ),
          //               CustomTextForm(
          //                 controller: controllerImp.tecComment,
          //                 valid: (value) {
          //                   return validInput(value!, 0, 100, "comment");
          //                 },
          //                 keyboardType: TextInputType.multiline,
          //                 hintText: addYourComment.tr,
          //                 labelText: comment.tr,
          //                 margin: const EdgeInsets.only(bottom: 0, left: 30, right: 30),
          //               ),
          //               CustomButtonAuth(
          //                 text: submit.tr,
          //                 onPressed: () => controllerImp.addFeedback(),
          //                 margin: const EdgeInsets.all(30),
          //               ),
          //             ],
          //           ),
          //
          //       );
          //     },
          //   ),
          // ),
        ),
      ),
    );;
  }
}
