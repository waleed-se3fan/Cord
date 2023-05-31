import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/splash/splash_screen.dart';
import 'core/styles/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/navigator.dart';

class CordApp extends StatelessWidget {
  const CordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: SplashScreen(),
        );
      },
    );
  }
}
