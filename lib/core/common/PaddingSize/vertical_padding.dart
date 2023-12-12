import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalPadding extends StatelessWidget {
  final double percentage;

  const VerticalPadding({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: percentage * ScreenUtil().scaleHeight);
  }
}
