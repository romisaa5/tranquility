import 'package:flutter/material.dart';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/reset_password.dart';
import 'package:tranquility/views/auth/widgets/otp_field.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
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
                child: AppImages(imagePath: 'otp.png', height: 250.h),
              ),
              16.h.ph,
              Text(
                'Verify Your Account',
                style: AppTextStyles.font24SemiBold.copyWith(
                  color: LightAppColors.grey900,
                ),
                textAlign: TextAlign.start,
              ),
              8.h.ph,
              Text(
                'Please enter the code sent on your email.',
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
                textAlign: TextAlign.start,
              ),
              24.h.ph,
              OtpField(onCompleted: (otp) {}),
              24.h.ph,
              AppButton(
                text: 'Verify',
                onTap: () {
                  AppNavigator.push(context, ResetPasswordView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
