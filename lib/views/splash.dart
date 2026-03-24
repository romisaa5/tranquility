import 'dart:async';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      AppNavigator.pushAndRemoveUntil(context, OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 180.w,

              backgroundColor: LightAppColors.primary800.withValues(alpha: .1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImages(
                    imagePath: 'tranquility.png',
                    height: 66.h,
                    width: 220.w,
                    fit: BoxFit.contain,
                  ),
                  8.h.ph,
                  Text(
                    'Together Towards Tranquility',
                    style: AppTextStyles.font18Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
