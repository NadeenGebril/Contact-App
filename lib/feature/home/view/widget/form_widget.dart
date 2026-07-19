import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/home/view/widget/entry_data_box.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.formKey,
    required this.contactCubit,
  });

  final GlobalKey<FormState> formKey;
  final ContactCubit contactCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EntryDataBox(
            controller: contactCubit.userNameController,
            text: 'Enter User Name',
            condetion: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter User Name';
              }
              return null;
            },
          ),
          EntryDataBox(
            controller: contactCubit.emailController,
            text: 'Enter User Email',
            condetion: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter User Email';
              }

              final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email';
              }

              return null;
            },
          ),
          EntryDataBox(
            controller: contactCubit.phoneController,
            text: 'Enter User Phone',
            condetion: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter User Phone';
              }

              final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

              if (!phoneRegex.hasMatch(value)) {
                return 'Enter a valid phone number';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
