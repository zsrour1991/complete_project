import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalPadding extends StatelessWidget {
  final double percentage;

  const HorizontalPadding({Key? key, this.percentage=.1})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: percentage.w);
  }
}
