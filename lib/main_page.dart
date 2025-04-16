import 'package:flutter/material.dart';
import 'package:flutter_application_2/base_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_2/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    String phone = '';
    if (authState is AuthSuccess) {
      phone = authState.phoneNumber;
    }
    return  BasePage(
      title: "صفحه اصلی",
      body: Center(child: Text("خوش آمدید $phone")),
    );
    
  }
}
