import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../models/specializations_response.dart';



class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, this.doctorModel});
  final Doctors? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.h),

      ),
      child: Row(
        children: [
         CachedNetworkImage(
                      imageUrl:
                      "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
                      progressIndicatorBuilder: (context, url, downloadProgress) {
                        return Shimmer.fromColors(
                          baseColor: ColorsManager.lightGray,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 110.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      imageBuilder: (context, imageProvider) => Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
         
          horizontalSpacing(16),
          Expanded(
              child: Column(
                children: [
                  Text(
                    doctorModel?.name ??"Name",
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  verticalSpacing(5.h),
                  Text(
                    ' ${doctorModel?.degree} | ${doctorModel?.phone}',
                    style: TextStyles.font12GrayMedium,
                  ),                verticalSpacing(5.h),

                  Text(
                   doctorModel?.email??'Email@gmail.com',
                    style: TextStyles.font12DarkBlueRegular,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
