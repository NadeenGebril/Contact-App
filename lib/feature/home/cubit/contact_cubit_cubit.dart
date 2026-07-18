import 'dart:developer';
import 'dart:io';
import 'package:contact/feature/home/cubit/contact_cubit_state.dart';
import 'package:contact/feature/home/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  List<ContactModel> contacts = [];
  File? selectedImage;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage = File(image.path);
      emit(ContactDraftChanged());
    }
  }

  void checkContacts() {
    if (contacts.isEmpty) {
      log('Empty');
      emit(ContactEmpty());
    } else {
      emit(ContactLoaded());
      log(contacts.toString());
    }
  }

  void onTyping() {
    emit(ContactDraftChanged());
  }

  void addContact() {
    if (userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      contacts.add(
        ContactModel(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          photo: selectedImage?.path,
        ),
      );
    }
    selectedImage = null;
    userNameController.clear();
    emailController.clear();
    phoneController.clear();
    checkContacts();
  }

  void deleteContact(ContactModel contact) {
    contacts.remove(contact);
    checkContacts();
  }

  void deleteAllContacts() {
    contacts.clear();
    checkContacts();
  }
}
