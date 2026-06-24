import 'package:e_commerce/features/login/data/models/login_response.dart';

sealed class LoginState {
  const LoginState();
}

final class InitLoginState extends LoginState {
  const InitLoginState();
}

final class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

final class SuccessLoginState extends LoginState {
  final LoginResponse loginResponse;

  const SuccessLoginState(this.loginResponse);
}

final class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState(this.message);
}
