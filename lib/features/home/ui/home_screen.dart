import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/ui/widgets/docotors_list/doctors_bloc_builder.dart';

import 'package:docdoc/features/home/ui/widgets/docotors_list/doctors_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/specialization_list/specializations_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              verticalSpacing(24),
              const DoctorsBlueContainer(),
              verticalSpacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpacing(18),
              const SpecializationsBlocBuilder(),
             verticalSpacing(8),
              const DoctorsBlocBuilder()
             //  ///const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

}