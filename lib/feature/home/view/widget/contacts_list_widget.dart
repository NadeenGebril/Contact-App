import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/home/view/widget/contact_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListWidget extends StatelessWidget {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ContactCubit>();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.52,
      ),
      itemCount: cubit.contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = cubit.contacts[index];
        return ContactInfoWidget(contact: contact);
      },
    );
  }
}
