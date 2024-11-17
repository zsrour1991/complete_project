import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/images.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Images.docdocLogoLowOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14,0.4]
            )
          ),
          child: Image.asset(Images.onBoardingDoctor),
        ),
        Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text("Best Doctor Appointment App",
                textAlign: TextAlign.center,
                style: TextStyles.font32BlueBold.copyWith(
                  height: 1.4
                ),),
            ),
        )

      ],
    );
  }
}
