import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculator.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/main_page.dart';
import 'package:flutter_application_2/setting.dart';
import 'package:flutter_application_2/auth_bloc.dart';
import 'package:flutter_application_2/sidebar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AuthBloc()),
      BlocProvider(create: (_) => SidebarBloc()),
    ],
    child: const MyApp(),
  ),
);
final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginPage()),
    GoRoute(path: '/calculator', builder: (context, state) => Calculator()),
    GoRoute(path: '/main-page', builder: (context, state) => MainPage()),
    GoRoute(path: '/setting', builder: (context, state) => Setting()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: goRouter);
  }
}
