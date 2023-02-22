import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.action,
    this.leading,
    this.horizontalPadding,
    this.labelFontSize,
    this.verticalPadding,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.labelColor,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;
  final IconData? leading;
  final Widget? action;
  final double? labelFontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? labelColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        enableFeedback: false,
        foregroundColor: Colors.transparent,
        backgroundColor: backgroundColor ?? Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: horizontalPadding ?? 10,
        //   vertical: verticalPadding ?? 20,
        // ),
        shadowColor: shadowColor,
        elevation: elevation ?? 7,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null)
              Icon(
                leading,
                color: Colors.white,
                size: 25,
              ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: labelFontSize ?? 20,
                  color: labelColor ?? Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
