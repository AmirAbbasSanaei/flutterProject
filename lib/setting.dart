import 'package:flutter/material.dart';
import 'package:flutter_application_2/base_page.dart';
import 'package:go_router/go_router.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(title: "تنظیمات", body: Center(child: Text("تنظیمات")));
  }
}
