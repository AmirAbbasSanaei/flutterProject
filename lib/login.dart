import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/calculator.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[۰-۹0-9]'),
                            ), // فقط اعداد فارسی یا انگلیسی
                          ],
                          decoration: InputDecoration(
                            labelText: "شماره تلفن",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            // تبدیل اعداد فارسی به انگلیسی
                            String english = value
                                .replaceAll('۰', '0')
                                .replaceAll('۱', '1')
                                .replaceAll('۲', '2')
                                .replaceAll('۳', '3')
                                .replaceAll('۴', '4')
                                .replaceAll('۵', '5')
                                .replaceAll('۶', '6')
                                .replaceAll('۷', '7')
                                .replaceAll('۸', '8')
                                .replaceAll('۹', '9');
                            if (english != value) {
                              _phoneNumberController.value = TextEditingValue(
                                text: english,
                                selection: TextSelection.collapsed(
                                  offset: english.length,
                                ),
                              );
                            }
                          },
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
                      String phoneNumber = _phoneNumberController.text;
                      String password = _passwordController.text;

                      if (phoneNumber.isNotEmpty &&
                          password.isNotEmpty &&
                          phoneNumber.length == 10) {
                        context.go('/main-page');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('لطفا فیلد ها را با دقت پر کنید'),
                          ),
                        );
                      }
                    },
                    child: Text('ورود'),
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
