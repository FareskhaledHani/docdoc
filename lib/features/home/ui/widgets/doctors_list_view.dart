import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../models/specializations_response.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, this.doctorsList});
 final List<Doctors?>? doctorsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: doctorsList?.length,
      itemBuilder: (context, index) {
       return DoctorsListViewItem(doctorModel: doctorsList?[index]);
      },
    ));
  }
}
