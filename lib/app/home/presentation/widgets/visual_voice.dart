import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';

class VisualComponent extends StatefulWidget {
  final int duration;
  const VisualComponent({super.key,required this.duration});

  @override
  State<VisualComponent> createState() => _VisualComponentState();
}


class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration+1500),
    );
    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
      controller.repeat(reverse: true);
  }

  @override
  dispose() {
    controller.dispose();
    animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: animation.value.h,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: AppColors.animGradient,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
