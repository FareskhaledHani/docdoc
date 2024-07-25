import 'package:docdoc/features/home/models/specializations_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  const DoctorSpecialityListViewItem({super.key, this.specializationData, required this.itemIndex});
 final SpecializationsData? specializationData;
 final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24),
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
          Text(

            specializationData?.name??"Omar",
            style: TextStyles.font12DarkBlueRegular,),
        ],
      ),
    );

  }
}
