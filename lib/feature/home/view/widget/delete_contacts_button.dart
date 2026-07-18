import 'package:contact/core/colors.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteContactsButton extends StatelessWidget {
  const DeleteContactsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ContactCubit>();
    return FloatingActionButton(
      heroTag: "delete",
      backgroundColor: AppColors.redColor,
      onPressed: () {
        cubit.deleteAllContacts();
      },
      child: const Icon(Icons.delete_rounded, color: AppColors.whiteColor),
    );
  }
}
