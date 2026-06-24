import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theming/styles.dart';
import 'package:e_commerce/features/login/UI/widgets/email_and_password.dart';
import 'package:flutter/material.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmailAndPassword(),
        verticalSpace(24),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            'Forgot Password?',
            style: TextStyles.font13BlueRegular,
          ),
        ),
      ],
    );
  }
}
