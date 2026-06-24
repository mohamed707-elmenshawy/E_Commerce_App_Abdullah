import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/login/UI/widgets/login_actions_section.dart';
import 'package:e_commerce/features/login/UI/widgets/login_bloc_listener.dart';
import 'package:e_commerce/features/login/UI/widgets/login_form_section.dart';
import 'package:e_commerce/features/login/UI/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                verticalSpace(36),
                const LoginFormSection(),
                verticalSpace(24),
                const LoginActionsSection(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
