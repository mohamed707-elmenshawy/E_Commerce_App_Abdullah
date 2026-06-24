import 'package:e_commerce/core/helpers/shared_pref_helper.dart';
import 'package:e_commerce/core/helpers/shared_pref_keys.dart';
import 'package:e_commerce/core/networking/api_result.dart';
import 'package:e_commerce/core/networking/dio_factory.dart';
import 'package:e_commerce/features/login/data/models/login_request_body.dart';
import 'package:e_commerce/features/login/data/repos/login_repo.dart';
import 'package:e_commerce/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  LoginCubit(this._loginRepo) : super(const InitLoginState()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> emitLoginStates() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(const LoadingLoginState());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    switch (response) {
      case Success(:final data):
        await saveUserToken(data.data?.token ?? '');
        emit(SuccessLoginState(data));
      case Failure(:final errorHandler):
        emit(
          ErrorLoginState(
            errorHandler.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    await SharedPrefHelper.setData(SharedPrefKeys.isUserLoggedIn, true);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
