// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureBox extends StatefulWidget {
  const FeatureBox({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final String label;
  final void Function() onTap;

  @override
  State<FeatureBox> createState() => _FeatureBoxState();
}

class _FeatureBoxState extends State<FeatureBox>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCirc,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) => controller.reverse(),
      onEnter: (_) => controller.forward(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -5 * controller.value),
              child: Container(
                  height: (1.sw > 576) ? 220.h : 80,
                  width: (1.sw > 576) ? 220 : 1.sw,
                  padding: EdgeInsets.symmetric(
                    horizontal: (1.sw > 576) ? 0 : 90.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 15,
                        spreadRadius: 0.1 + controller.value * 15,
                        color: const Color.fromARGB(15, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: child),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Icon(Icons.play_circle_sharp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/${widget.icon}',
                    height: 25,
                  ),
                  if (1.sw <= 576)
                    SizedBox(
                      width: 90.w,
                    ),
                  if (1.sw <= 576)
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  if (1.sw <= 576)
                    const Spacer(
                      flex: 10,
                    ),
                ],
              ),
              // if ((1.sw > 576)) const Spacer(),
              if ((1.sw > 576))
                FittedBox(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.black,
                      // fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
