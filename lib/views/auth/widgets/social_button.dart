import 'package:flutter/cupertino.dart';
import 'package:tranquility/core/utils/common_imports.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imageUrl,
    this.onTap,
    required this.backgroundColor,
    required this.text,
  });

  final String imageUrl;
  final void Function()? onTap;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border(
            left: BorderSide(color: LightAppColors.grey600, width: 3.w),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(imageUrl, height: 50.h, width: 55.h),
            16.w.pw,
            Expanded(
              child: Container(
                height: 50.h,
                color: backgroundColor,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: AppTextStyles.font16Medium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
