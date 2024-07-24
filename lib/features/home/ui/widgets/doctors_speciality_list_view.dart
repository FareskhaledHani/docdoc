import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundColor: ColorsManager.moreLighterGray,
              child: SvgPicture.asset(
                'assets/svgs/general_speciality.svg',
                height: 40.h,
                width: 40.w,
              ),

            ),  verticalSpacing(8.h),
            Text("Omar",style: TextStyles.font12DarkBlueRegular,),
          ],
        ),
        );

      }),
    );
  }
}
