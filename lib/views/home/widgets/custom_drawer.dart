import 'package:flutter/cupertino.dart';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/about_us.dart';
import 'package:tranquility/views/home/widgets/drawer_item.dart';
import 'package:tranquility/views/suggestions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: LightAppColors.grey100,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                color: LightAppColors.primary800,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: LightAppColors.grey200,
                    radius: 70.r,
                    child: Icon(
                      Icons.person,
                      size: 50.sp,
                      color: LightAppColors.grey500,
                    ),
                  ),
                  16.h.ph,
                  Text(
                    "Sara",
                    style: AppTextStyles.font16SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  8.h.ph,
                  Text(
                    "01027545631",
                    style: AppTextStyles.font14Regular.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            20.h.ph,
            DrawerItem(
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {
                AppNavigator.push(context, AboutUsView());
              },
            ),
            DrawerItem(
              icon: Icons.star_border,
              title: "Rate Our App",
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.chat_bubble_outline,
              title: "Suggestions",
              onTap: () {
                AppNavigator.push(context, SuggestionsView());
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Container(
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: LightAppColors.primary800.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.fingerprint, size: 20.sp),
                        10.w.pw,
                        Text("Enable Easy Login"),
                      ],
                    ),
                    CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                      focusColor: Color(0xff2F65F0),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 8.w),
                      Text("Logout", style: TextStyle(color: Colors.red)),
                    ],
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
