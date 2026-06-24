import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  final AppRouter appRouter;

  const ECommerceApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'E Commerce',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
