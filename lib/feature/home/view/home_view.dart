import 'package:contact/core/colors.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/home/cubit/contact_cubit_state.dart';
import 'package:contact/feature/home/view/widget/home_view_empty_body.dart';
import 'package:contact/feature/home/view/widget/home_view_with_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is ContactEmpty || state is ContactDraftChanged) {
          return const Scaffold(
            backgroundColor: AppColors.darkBlueColor,
            body: HomeViewEmptyBody(),
          );
        } else {
          return const Scaffold(
            backgroundColor: AppColors.darkBlueColor,
            body: HomeViewWithDataBody(),
          );
        }
      },
    );
  }
}
