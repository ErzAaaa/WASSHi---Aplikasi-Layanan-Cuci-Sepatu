import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  final bool isLoggedIn;
  final String? errorMessage;

  AuthState({required this.isLoggedIn, this.errorMessage});

  factory AuthState.initial() => AuthState(isLoggedIn: false);
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void login(String username, String password) {
    if (username == "dipo" && password == "123") {
      emit(AuthState(isLoggedIn: true));
    } else {
      emit(AuthState(isLoggedIn: false, errorMessage: "Username atau Password salah"));
    }
  }

  void logout() {
    emit(AuthState(isLoggedIn: false));
  }
}
