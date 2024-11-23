import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/images.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hi, Zaynab!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How are you today?',
              style: TextStyles.font12GrayRegular,
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(Images.notifications),
        )
      ],
    );
  }
}
