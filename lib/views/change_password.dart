import 'package:tranquility/core/utils/common_imports.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppImages(imagePath: 'forget_password.png'),
          24.h.ph,
          Text(
            'Change Your Password',
            style: AppTextStyles.font24SemiBold.copyWith(
              color: LightAppColors.grey900,
            ),
          ),
          24.h.ph,
          AppInput(
            controller: oldPasswordController,
            hintText: 'Old Password',
            isObscureText: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isOldPasswordVisible = !isOldPasswordVisible;
                });
              },
              icon: Icon(
                isOldPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          16.h.ph,
          AppInput(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isNewPasswordVisible = !isNewPasswordVisible;
                });
              },
              icon: Icon(
                isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            controller: newPasswordController,
            hintText: 'New Password',
            isObscureText: true,
          ),
          16.h.ph,
          AppInput(
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
              ),
            ),
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            isObscureText: true,
          ),
          24.h.ph,
          AppButton(
            text: 'Change Password',
            onTap: () {
              // Handle change password logic here
            },
          ),
        ],
      ),
    );
  }
}
