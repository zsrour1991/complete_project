import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_project/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/DoctorsListView.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_listView.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
                  specializationsResponseModel;
              return setupSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
  /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(child: Column(children: [
      const SpecialityShimmerLoading(),
      verticalSpace(8),
      const DoctorsShimmerLoading()
    ],));
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsList) {
    return SpecialityListView(
        specializationsDataList: specializationsList ?? []);
  }
}
