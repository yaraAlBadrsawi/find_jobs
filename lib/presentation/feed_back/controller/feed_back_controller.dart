import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeedBackController extends GetxController {
  final GlobalKey<FormState> feedbackController =
      GlobalKey<FormState>(debugLabel: 'feedbackController');

  late TextEditingController tecComment;
  double rating = 0.0;

  @override
  void onInit() {
    tecComment = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    tecComment.dispose();
    super.dispose();
  }

  addFeedback() async {
    if (feedbackController.currentState!.validate()) {
      update();
    }
  }

  updateRate(rating) {
    this.rating = rating;
  }
}
