import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;
  const BorderBox({required this.child, this.padding=const EdgeInsets.all(8.0), this.width=0, this.height=0 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      padding: padding,
      child: child,
    );
  }
}
