import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0.h),

          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  width: 110.w,
                  height: 120.h,
                  'assets/images/home_blue_pattern.png',
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    "Name",
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  verticalSpacing(5.h),
                  Text(
                    "Omar | 01202304505",
                    style: TextStyles.font12GrayMedium,
                  ),                verticalSpacing(5.h),

                  Text(
                    "Email@gmail.com",
                    style: TextStyles.font12DarkBlueRegular,
                  ),
                ],
              ))
            ],
          ),
        );
      },
    ));
  }
}
