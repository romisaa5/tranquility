import 'package:tranquility/core/common/widgets/app_dropdown.dart';
import 'package:tranquility/views/auth/login.dart';
import 'package:tranquility/views/auth/widgets/upload_image.dart';

import '../../core/utils/common_imports.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  List<String> genderOptions = ['Male', 'Female'];
  String? selectedGender;
  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    ageController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              20.h.ph,
              UploadImage(onImageSelected: (String? path) {}),
              40.h.ph,
              AppInput(hintText: 'Username', controller: usernameController),
              16.h.ph,
              AppInput(hintText: 'Email', controller: emailController),
              16.h.ph,
              AppInput(
                hintText: 'Age',
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              16.h.ph,
              AppDropdown<String>(
                hint: 'Gender',
                value: selectedGender,
                items: genderOptions,
                labelBuilder: (gender) => gender,
                onChanged: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              16.h.ph,
              AppInput(
                hintText: 'Password',
                isObscureText: true,
                controller: passwordController,
              ),
              16.h.ph,
              AppInput(
                hintText: 'Confirm Password',
                isObscureText: true,
                controller: confirmPasswordController,
              ),
              14.h.ph,
              AppButton(text: 'Sign Up', onTap: () {}),
              24.h.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyles.font16Regular.copyWith(
                      color: LightAppColors.grey500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppNavigator.push(context, LoginView());
                    },
                    child: Text(
                      'Login',
                      style: AppTextStyles.font16Bold.copyWith(
                        color: LightAppColors.primary800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
