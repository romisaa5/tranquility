import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/login.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _controller = PageController();
  int currentIndex = 0;

  final pages = [
    _OnBoarding(
      image: 'on_boarding1.jpg',
      title: "Feel Free",
      description:
          "because I'm the friendly chatbot here to assist you with anything you need.",
    ),
    _OnBoarding(
      image: 'on_boarding2.jpg',
      title: "Ask For Anything",
      description:
          "I'm your friendly neighborhood chatbot ready to assist you with any questions or concerns.",
    ),
    _OnBoarding(
      image: 'on_boarding3.jpg',
      title: "Your Secert is Save",
      description: "Our platform prioritizes your privacy and security",
    ),
  ];

  void nextPage(BuildContext context) {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      AppNavigator.pushAndRemoveUntil(context, LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final page = pages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: index == 0
                      ? BorderRadius.only(bottomLeft: Radius.circular(100.r))
                      : index == 1
                      ? BorderRadius.only(
                          bottomRight: Radius.circular(100.r),
                          bottomLeft: Radius.circular(100.r),
                        )
                      : BorderRadius.only(bottomRight: Radius.circular(100.r)),
                  child: AppImages(
                    imagePath: page.image,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                20.h.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          page.title,
                          style: AppTextStyles.font24Bold.copyWith(
                            color: LightAppColors.grey900,
                          ),
                        ),
                      ),
                      24.h.ph,
                      FadeIn(
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font20Regular.copyWith(
                            color: LightAppColors.grey600,
                          ),
                        ),
                      ),
                      60.h.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            child: TextButton(
                              onPressed: () {
                                AppNavigator.pushAndRemoveUntil(
                                  context,
                                  LoginView(),
                                );
                              },
                              child: Text(
                                'Skip',
                                style: AppTextStyles.font16Regular.copyWith(
                                  color: LightAppColors.grey900,
                                ),
                              ),
                            ),
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 500),
                            child: CupertinoButton(
                              onPressed: () => nextPage(context),
                              padding: EdgeInsets.zero,
                              child: Container(
                                height: 60.w,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: LightAppColors.primary800,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: LightAppColors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OnBoarding {
  final String image;
  final String title;
  final String description;

  _OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });
}
