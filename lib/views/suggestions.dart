import 'package:tranquility/core/utils/common_imports.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({super.key});

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Suggestions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            AppImages(imagePath: 'suggest.png'),
            16.h.ph,
            Text(
              'Tell Us How We Can Help',
              style: AppTextStyles.font20SemiBold.copyWith(
                color: LightAppColors.grey900,
              ),
            ),
            40.h.ph,
            AppInput(hintText: 'Subject', maxLines: 1),
            16.h.ph,
            AppInput(hintText: 'Body', maxLines: 5),
            24.h.ph,
            AppButton(
              text: 'Send Message',
              onTap: () {
                // Handle submission logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
