import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/chatbot/chat.dart';

class StartChatView extends StatelessWidget {
  const StartChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              40.h.ph,
              AppImages(imagePath: 'chatbot.png'),
              24.h.ph,
              Text(
                'Hey!',
                style: AppTextStyles.font32SemiBold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
              8.h.ph,
              Text(
                'I’am your Personal Assistent',
                style: AppTextStyles.font20Regular.copyWith(
                  color: LightAppColors.grey500,
                ),
              ),
              16.h.ph,
              Text(
                'Start a conversation with our AI chatbot and get instant answers to your questions.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: LightAppColors.grey500,
                ),
                textAlign: TextAlign.center,
              ),
              24.h.ph,
              AppInput(hintText: 'Enter The Title Of Chat'),
              24.h.ph,
              AppButton(
                text: 'Start Chatting',
                onTap: () {
                  AppNavigator.push(context, ChatView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
