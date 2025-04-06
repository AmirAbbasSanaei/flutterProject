import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/calculator.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 1,
            // heightFactor: 0.5,
            child: Container(
              child: Column(
                // phone number section
                children: [
                  Row(
                    children: [
                      // +98
                      Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text('+98', style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(width: 8),
                      // phoneNumber Input
                      Expanded(
                        child: TextField(
                          controller: _phoneNumberController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            labelText: "شماره تلفن",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // password section
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "رمز ورود",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // button
                  ElevatedButton(
                    onPressed: () {
                      // زمانی که دکمه ورود فشرده می‌شود
                      String phoneNumber =_phoneNumberController.text;
                      String password = _passwordController.text;

                      if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                        // انتقال به صفحه بعدی
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calculator(),
                          ),
                        );
                      } else {
                        // اگر فیلدها خالی بودند، پیامی نمایش می‌دهیم
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'لطفا فیلد ها را پر کنید',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('ورود به ماشین حساب'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
