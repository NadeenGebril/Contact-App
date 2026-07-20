import 'package:contact/core/assets.dart';
import 'package:contact/core/dimentions.dart';
import 'package:contact/core/styles.dart';
import 'package:contact/core/text.dart';
import 'package:contact/feature/home/view/widget/add_contact_button.dart';
import 'package:flutter/material.dart';

class HomeViewEmptyBody extends StatelessWidget {
  const HomeViewEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(AssetsData.listImage)),
        // Positioned(
        //   top: 80,
        //   left: 20,
        //   child: Image.asset(AssetsData.routeLogo, width: 100),
        // ),
        Positioned(
          top: Dimensions.screenHeight(context) / 1.45,
          width: Dimensions.screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.emptyHomeText,
                style: AppTextStyles.titleLargeTextStyle,
              ),
            ],
          ),
        ),
        Positioned(bottom: 20, right: 20, child: AddContactButton()),
      ],
    );
  }
}
