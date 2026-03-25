import 'package:tranquility/core/utils/common_imports.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'About Us',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            20.h.ph,
            AppImages(imagePath: 'app_logo.jpg', height: 238.h, width: 238.w),
            24.h.ph,
            Text(
              'Welcome to Tranquility where relaxation meets innovation.',
              style: AppTextStyles.font20SemiBold.copyWith(
                color: LightAppColors.grey900,
              ),
              textAlign: TextAlign.center,
            ),
            16.h.ph,
          ],
        ),
      ),
    );
  }
}
