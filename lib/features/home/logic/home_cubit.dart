import 'package:docdoc/core/helpers/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_error_handler.dart';
import '../models/specializations_response.dart';
import '../repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(success: (specializationsResponseModel) {
      specializationsList =
          specializationsResponseModel.specializationDataList ?? [];
      getDoctorsList(specializationId: specializationsList?.first?.id);
      emit(HomeState.specializationsSuccess(specializationsList));
    }, failure: (errorHandler) {
      emit(HomeState.specializationsError(errorHandler));
    });
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}