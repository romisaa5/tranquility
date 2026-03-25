import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/login.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
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
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: LightAppColors.grey500,
                  ),
                ),
              ),
              16.h.ph,
              AppInput(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                isObscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: LightAppColors.grey500,
                  ),
                ),
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
