import 'package:contact/core/assets.dart';
import 'package:contact/feature/home/view/widget/add_contact_button.dart';
import 'package:contact/feature/home/view/widget/contacts_list_widget.dart';
import 'package:contact/feature/home/view/widget/delete_contacts_button.dart';
import 'package:flutter/material.dart';

class HomeViewWithDataBody extends StatelessWidget {
  const HomeViewWithDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          left: 20,
          child: Image.asset(AssetsData.routeLogo, width: 100),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: ContactsListWidget(),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DeleteContactsButton(),
              SizedBox(height: 8),
              AddContactButton(),
            ],
          ),
        ),
      ],
    );
  }
}
