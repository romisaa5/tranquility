import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/verify_otp.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppImages(
                  imagePath: 'forget_password.png',
                  height: 250.h,
                ),
              ),
              16.h.ph,
              Text(
                'Forgot Your Password?',
                style: AppTextStyles.font24SemiBold.copyWith(
                  color: LightAppColors.grey900,
                ),
                textAlign: TextAlign.start,
              ),
              8.h.ph,
              Text(
                'Enter your email address below and we\'ll send you a link to reset your password.',
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
                textAlign: TextAlign.start,
              ),
              24.h.ph,
              AppInput(hintText: 'Email'),
              24.h.ph,
              AppButton(
                text: 'Forget Password',
                onTap: () {
                  AppNavigator.push(context, VerifyOtpView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
