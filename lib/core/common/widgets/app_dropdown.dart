import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tranquility/core/utils/common_imports.dart';

class AppDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(T?) onChanged;
  final String? errorText;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    this.errorText,
  });
  @override
  Widget build(BuildContext context) {
    final safeValue = (value != null && items.contains(value)) ? value : null;
    if (items.isEmpty) {
      return _disabledView(context);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: safeValue,
            hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint,
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey500,
                ),
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    labelBuilder(item),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: LightAppColors.primary700.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: errorText != null
                      ? LightAppColors.error500
                      : LightAppColors.primary700.withValues(alpha: .3),
                ),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.expand_more_rounded),
              iconSize: 26.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: LightAppColors.grey0,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(height: 45.h),
          ),
        ),

        if (errorText != null) ...[
          6.h.ph,
          Row(
            children: [
              Icon(Icons.error, color: LightAppColors.error500, size: 18.sp),
              5.w.pw,
              Expanded(
                child: Text(
                  errorText!,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: LightAppColors.error500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _disabledView(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: LightAppColors.primary700.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        hint,
        style: AppTextStyles.font14Regular.copyWith(
          color: LightAppColors.grey500,
        ),
      ),
    );
  }
}
