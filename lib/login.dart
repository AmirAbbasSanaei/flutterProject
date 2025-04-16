import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text('+98', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _phoneNumberController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[۰-۹0-9]'),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText: "شماره تلفن",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
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
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "رمز ورود",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('ورود موفق ✅')));
                      context.go('/main-page');
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed:
                          state is AuthLoading
                              ? null
                              : () {
                                String phoneNumber =
                                    _phoneNumberController.text;
                                String password = _passwordController.text;
                                context.read<AuthBloc>().add(
                                  LoginEvent(phoneNumber, password),
                                );
                              },
                      child:
                          state is AuthLoading
                              ? CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                              : Text('ورود'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
