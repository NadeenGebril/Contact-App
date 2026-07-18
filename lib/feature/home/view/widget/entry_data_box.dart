import 'package:contact/core/colors.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryDataBox extends StatelessWidget {
  const EntryDataBox({super.key, required this.controller, required this.text});
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    final contactCubit = context.read<ContactCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          contactCubit.onTyping();
        },
        decoration: InputDecoration(
          hint: Text(text, style: AppTextStyles.titleMediumTextStyle),
          hintStyle: AppTextStyles.titleMediumTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.goldColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.goldColor),
          ),
        ),
      ),
    );
  }
}
