import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/register.dart';
import 'package:tranquility/views/auth/widgets/social_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppImages(imagePath: 'login.jpg', height: 180.h),
              ),
              16.h.ph,
              Text(
                'Welcome To',
                style: AppTextStyles.font20SemiBold.copyWith(
                  color: LightAppColors.grey900,
                ),
                textAlign: TextAlign.start,
              ),
              8.h.ph,
              AppImages(
                imagePath: 'tranquility.png',
                height: 66.h,
                width: 220.w,
                fit: BoxFit.contain,
              ),
              10.h.ph,
              AppInput(hintText: 'Email', controller: emailController),
              16.h.ph,
              AppInput(
                controller: passwordController,
                hintText: 'Password',
                isObscureText: true,
                maxLines: 1,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: LightAppColors.grey500,
                  ),
                ),
              ),
              24.h.ph,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: AppTextStyles.font16Bold.copyWith(
                      color: LightAppColors.primary800,
                    ),
                  ),
                ),
              ),
              16.h.ph,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    height: 60.h,
                    width: 56.w,
                    decoration: BoxDecoration(
                      color: LightAppColors.primary800.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: AppImages(
                      imagePath: 'subtract.svg',
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                  16.w.pw,
                  Expanded(
                    child: AppButton(text: 'Login', onTap: () {}),
                  ),
                ],
              ),
              24.h.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppTextStyles.font16Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppNavigator.push(context, RegisterView());
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.font16Bold.copyWith(
                        color: LightAppColors.primary800,
                      ),
                    ),
                  ),
                ],
              ),

              SocialButton(
                text: 'Continue with Google',
                imageUrl: 'assets/icons/google.svg',
                onTap: () {},
                backgroundColor: Color(0xff35B542).withValues(alpha: .5),
              ),

              16.h.ph,
              SocialButton(
                text: 'Continue with Facebook',
                imageUrl: 'assets/icons/facebook.svg',
                onTap: () {},
                backgroundColor: Color(0xff518EF8).withValues(alpha: .5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
