import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/login.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                'Change Your Password',
                style: AppTextStyles.font24SemiBold.copyWith(
                  color: LightAppColors.grey900,
                ),
                textAlign: TextAlign.start,
              ),
              8.h.ph,
              Text(
                'create your new password to log in !',
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
                textAlign: TextAlign.start,
              ),
              24.h.ph,
              AppInput(
                controller: newPasswordController,
                hintText: 'New Password',
                isObscureText: true,
              ),
              16.h.ph,
              AppInput(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                isObscureText: true,
              ),
              24.h.ph,
              AppButton(
                text: 'Change Password',
                onTap: () {
                  AppNavigator.pushAndRemoveUntil(context, LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
