import 'package:contact/core/assets.dart';
import 'package:contact/core/colors.dart';
import 'package:contact/core/dimentions.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/core/text.dart';
import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/home/view/widget/entry_data_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactCubit = context.watch<ContactCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  contactCubit.pickImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.goldColor),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: contactCubit.selectedImage != null
                          ? FileImage(contactCubit.selectedImage!)
                          : AssetImage(AssetsData.contactImage),
                    ),
                  ),
                  height: Dimensions.screenWidth(context) / 3,
                  width: Dimensions.screenWidth(context) / 3,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactCubit.userNameController.text.isEmpty
                          ? AppText.userNameText
                          : contactCubit.userNameController.text,
                      style: AppTextStyles.titleMediumTextStyle,
                    ),
                    Divider(color: AppColors.goldColor, height: 20),
                    Text(
                      contactCubit.emailController.text.isEmpty
                          ? AppText.emailText
                          : contactCubit.emailController.text,
                      style: AppTextStyles.titleMediumTextStyle,
                    ),
                    Divider(color: AppColors.goldColor, height: 20),
                    Text(
                      contactCubit.phoneController.text.isEmpty
                          ? AppText.phoneText
                          : contactCubit.phoneController.text,
                      style: AppTextStyles.titleMediumTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        EntryDataBox(
          controller: contactCubit.userNameController,
          text: 'Enter User Name',
        ),
        EntryDataBox(
          controller: contactCubit.emailController,
          text: 'Enter User Email',
        ),
        EntryDataBox(
          controller: contactCubit.phoneController,
          text: 'Enter User Phone',
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              contactCubit.addContact();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.goldColor,
              minimumSize: Size(Dimensions.screenWidth(context), 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                AppText.enterUserText,
                style: AppTextStyles.titleMediumTextStyle.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
