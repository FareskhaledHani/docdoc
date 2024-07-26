import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/routing/app_routar.dart';

class DocApp extends StatelessWidget {
  final AppRouter approuter;
  const DocApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt:  true,
      child: MaterialApp(
        title: 'DOC app',
        theme: ThemeData(
          primaryColor:ColorsManager.mainBlue
        ),
        onGenerateRoute: approuter.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
      ),
    );
  }
}
