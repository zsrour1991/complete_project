import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_project/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/DoctorsListView.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/DoctorsSpecialityListView.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationsLoading: () {
              return setupLoading();
            },
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList =
                  specializationsResponseModel.specializationDataList;
              return setupSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
              specializationsDataList: specializationsList ?? []),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          )
        ],
      ),
    );
  }
}
