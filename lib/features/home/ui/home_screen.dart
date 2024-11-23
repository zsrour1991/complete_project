import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/DoctorBlueContainer.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/DoctorSpecialitySeeAll.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctros_bloc_builder.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpace(16),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              const SpecializationsBlocBuilder(),
              verticalSpace(6),
              const DoctorsBlocBuilder()

            ],
          ),
        )));
  }
}
