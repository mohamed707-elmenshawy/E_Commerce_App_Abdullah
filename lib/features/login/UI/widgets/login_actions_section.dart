import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theming/styles.dart';
import 'package:e_commerce/core/widgets/app_text_button.dart';
import 'package:e_commerce/features/login/UI/widgets/dont_have_account_text.dart';
import 'package:e_commerce/features/login/UI/widgets/terms_and_conditions_text.dart';
import 'package:e_commerce/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginActionsSection extends StatelessWidget {
  const LoginActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          buttonText: 'Login',
          textStyle: TextStyles.font16WhiteSemiBold,
          onPressed: () {
            context.read<LoginCubit>().emitLoginStates();
          },
        ),
        verticalSpace(16),
        const TermsAndConditionsText(),
        verticalSpace(60),
        const DontHaveAccountText(),
      ],
    );
  }
}
