import 'package:flutter_bloc/flutter_bloc.dart';

/// --- Events ---
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginEvent(this.phoneNumber, this.password);
}

/// --- States ---
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LogoutEvent extends AuthEvent {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String phoneNumber;
  AuthSuccess(this.phoneNumber);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

/// --- Bloc ---
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LogoutEvent>((event, emit) {
      emit(AuthInitial());
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      await Future.delayed(Duration(seconds: 1)); // شبیه‌سازی تأخیر ورود

      if (event.phoneNumber.length == 10 && event.password.isNotEmpty) {
        emit(AuthSuccess(event.phoneNumber));
      } else {
        emit(AuthFailure('شماره یا رمز اشتباهه'));
      }
    });
  }
}
