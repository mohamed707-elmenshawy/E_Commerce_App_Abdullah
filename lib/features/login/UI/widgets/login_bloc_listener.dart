import 'package:e_commerce/core/helpers/extensions.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theming/colors.dart';
import 'package:e_commerce/core/theming/styles.dart';
import 'package:e_commerce/features/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoadingLoginState ||
          current is SuccessLoginState ||
          current is ErrorLoginState,
      listener: (context, state) {
        if (state is LoadingLoginState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        } else if (state is SuccessLoginState) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (route) => false,
          );
        } else if (state is ErrorLoginState) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
