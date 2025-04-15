import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 151, 255),
        elevation: 0.0,
        title: Text(
          "Main Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 115, 187, 247),
              ),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  String phone = '';
                  if (state is AuthSuccess) {
                    phone = state.phoneNumber;
                  }
                  return Text(
                    'خوش آمدید, $phone',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('ماشین حساب'),
              onTap: () {
                context.go('/calculator');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('تنظیمات'),
              onTap: () {
                context.go('/setting');
              },
            ),
            // خروج
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('خروج'),
              onTap: () {
                context.read<AuthBloc>().add(LogoutEvent());
                context.go('/'); 
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text("خوش آمدید $phone")),
    );
  }
}
