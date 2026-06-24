import 'package:e_commerce/core/di/dependency_injection.dart';
import 'package:e_commerce/core/helpers/shared_pref_helper.dart';
import 'package:e_commerce/core/helpers/shared_pref_keys.dart';
import 'package:e_commerce/core/networking/dio_factory.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await checkIfLoggedInUser();

  runApp(ECommerceApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  final userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (userToken.isNotEmpty) {
    DioFactory.setTokenIntoHeaderAfterLogin(userToken);
  }
}
// client@gmail.com
//password