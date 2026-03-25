import 'package:flutter/cupertino.dart';
import 'package:tranquility/core/common/widgets/app_dropdown.dart';
import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/auth/widgets/upload_image.dart';
import 'package:tranquility/views/change_password.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? value;
  String hint = 'Gender';
  List<String> items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          40.h.ph,
          UploadImage(
            onImageSelected: (image) {
              // Handle the selected image
            },
          ),
          24.h.ph,
          AppInput(hintText: 'Name', maxLines: 1),
          16.h.ph,
          AppInput(hintText: 'Email', maxLines: 1),
          16.h.ph,
          Row(
            children: [
              Expanded(child: AppInput(hintText: 'Age')),
              16.w.pw,
              Expanded(
                child: AppDropdown(
                  hint: hint,
                  value: value,
                  items: items,
                  labelBuilder: (String item) => item,
                  onChanged: (String? newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          24.h.ph,
          AppButton(
            text: 'Save',
            onTap: () {
              // Handle save action
            },
          ),
          21.h.ph,
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              AppNavigator.push(context, const ChangePasswordView());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: LightAppColors.primary800,
                  ),
                ),
                AppImages(
                  imagePath: 'edit.svg',
                  colorFilter: ColorFilter.mode(
                    LightAppColors.primary800,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
