import 'package:contact/core/colors.dart';
import 'package:contact/core/dimentions.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/core/text.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/home/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteContactButtonWidget extends StatelessWidget {
  const DeleteContactButtonWidget({super.key, required this.contact});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ContactCubit>().deleteContact(contact);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.redColor,
        minimumSize: Size(Dimensions.screenWidth(context), 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_rounded, color: AppColors.goldColor),
          SizedBox(width: 6),
          Text(AppText.deleteText, style: AppTextStyles.text10Style),
        ],
      ),
    );
  }
}
