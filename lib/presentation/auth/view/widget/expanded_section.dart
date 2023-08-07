import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/controller/register_controller.dart';

class ExpandedSection extends GetView<RegisterController> {
  const ExpandedSection({
    Key? key,
    required this.expand,
    required this.child,
  }) : super(key: key);

  final bool expand;
  final Widget child;

  @override
  Widget build(BuildContext context) {

    controller.toggleExpansion(expand);

    return SizeTransition(
      sizeFactor: controller.animation,
      child: child,
    );
  }
}