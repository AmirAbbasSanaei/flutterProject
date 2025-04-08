import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 151, 255),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.go('/main-page'); // برگشت به صفحه اصلی
          },
        ),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Text("تنظیمات"),
    );
  }
}
