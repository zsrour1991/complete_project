import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/metworking/api_error_handler.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsData = [];
  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsData =
            specializationsResponseModel.specializationDataList;
        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: specializationsData?.first?.id);
        emit(HomeState.specializationsSuccess(specializationsData));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);
    if(!doctorsList.isNullOrEmpty()){
      emit(HomeState.doctorsSuccess(doctorsList));
    }
    else{
      emit(HomeState.doctorsError(ErrorHandler.handle('No Doctors Fount')));
    }
  }
  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsData
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
