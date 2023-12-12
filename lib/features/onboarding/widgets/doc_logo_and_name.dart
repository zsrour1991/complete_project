import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/common/PaddingSize/horizontal_padding.dart';
import 'package:flutter_complete_project/core/theming/images.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Images.dodoLogo),
        HorizontalPadding(percentage: 10,),
        Text('DocDoc',
        style:TextStyles.font24Black700Weight
        )
      ],
    );
  }
}
