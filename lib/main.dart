import 'package:contact/feature/home/cubit/contact_cubit_cubit.dart';
import 'package:contact/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Contact());
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactCubit()..checkContacts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
