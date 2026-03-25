import 'package:tranquility/core/utils/common_imports.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: LightAppColors.primary800.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20.sp),
              10.w.pw,
              Text(
                title,
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
