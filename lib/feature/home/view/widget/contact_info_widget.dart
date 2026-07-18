import 'dart:io';

import 'package:contact/core/assets.dart';
import 'package:contact/core/colors.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/feature/home/model/contact_model.dart';
import 'package:contact/feature/home/view/widget/delete_contact_button_widget.dart';
import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key, required this.contact});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: contact.photo == null
                          ? const AssetImage(AssetsData.contact1Image)
                          : FileImage(File(contact.photo!)),

                      fit: BoxFit.cover,
                    ),
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.goldColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        contact.userName,
                        style: AppTextStyles.bodySmallTextStyle.copyWith(
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email, size: 20),
                      SizedBox(width: 6),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            contact.email,
                            style: AppTextStyles.titleMediumTextStyle.copyWith(
                              color: AppColors.darkBlueColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.wifi_calling_3_rounded, size: 20),
                      SizedBox(width: 6),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            contact.phone,
                            style: AppTextStyles.titleMediumTextStyle.copyWith(
                              color: AppColors.darkBlueColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DeleteContactButtonWidget(contact: contact),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
