import 'package:contact/core/colors.dart';
import 'package:contact/core/helper/bottom_sheet_helper.dart';
import 'package:contact/feature/home/view/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "add",
      backgroundColor: AppColors.goldColor,
      onPressed: () {
        BottomSheetHelper.show(context: context, child: BottomSheetWidget());
      },
      child: const Icon(Icons.add, color: AppColors.darkBlueColor),
    );
  }
}
