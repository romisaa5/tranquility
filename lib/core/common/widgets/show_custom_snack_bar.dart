import 'package:tranquility/core/utils/common_imports.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      action: SnackBarAction(
        label: 'حسناً',
        textColor: LightAppColors.grey0,
        onPressed: () {},
      ),
      backgroundColor: backgroundColor ?? LightAppColors.primary800,
      content: Text(
        message,
        style: AppTextStyles.font14SemiBold.copyWith(
          color: LightAppColors.grey0,
        ),
      ),
    ),
  );
}
