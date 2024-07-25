import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit,HomeState>(
        buildWhen: (previous, current) =>
        current is SpecializationsLoading||
            current is SpecializationsSuccess||
            current is SpecializationsError,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            specializationsLoading: () => setupLoading(),
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList = specializationsResponseModel.specializationDataList;
            return   setupSuccess( specializationsList);
            },
            specializationsError: (errorHandler) => setupError(),
          );
        });
  }
  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(child: CircularProgressIndicator()),);
  }
  Widget setupSuccess(specializationsList) {
    return Expanded(child: Column(
      children: [
        DoctorsSpecialityListView(specializationDataList:specializationsList ?? [],),
        /// const SpecializationsBlocBuilder(),
        verticalSpacing(8),
        DoctorsListView(
          doctorsList: specializationsList?[0]?.doctorsList,
        ),
      ],
    ));
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
}
