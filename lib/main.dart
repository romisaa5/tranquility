import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/di/service_locator.dart';
import 'package:tranquility/core/helpers/app_navigator.dart';
import 'package:tranquility/core/helpers/shared_pref_helper.dart';
import 'package:tranquility/core/theme/app_colors/light_theme_data.dart';
import 'package:tranquility/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initServiceLocator();
  await SharedPrefHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          home: const SplashView(),
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(context),
        );
      },
    );
  }
}
