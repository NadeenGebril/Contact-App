import 'package:contact/core/colors.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryDataBox extends StatelessWidget {
  const EntryDataBox({
    super.key,
    required this.controller,
    required this.text,
    required this.condetion,
  });
  final TextEditingController controller;
  final String text;
  final String? Function(String?) condetion;
  @override
  Widget build(BuildContext context) {
    final contactCubit = context.read<ContactCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.titleMediumTextStyle,
        validator: (value) {
          return condetion(value);
        },
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.redColor),
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
