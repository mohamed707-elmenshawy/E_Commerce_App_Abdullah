import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back', style: TextStyles.font24BlueBold),
        verticalSpace(8),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
