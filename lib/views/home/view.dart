import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/chatbot/start_chat.dart';
import 'package:tranquility/views/home/pages/chat.dart';
import 'package:tranquility/views/home/pages/profile.dart';
import 'package:tranquility/views/home/pages/qoutes.dart';
import 'package:tranquility/views/home/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final _pages = [ChatPage(), QoutesPage(), ProfilePage()];
  final _appBarTitles = ['Chats', 'Quotes', 'Profile'];
  Widget buildSvg(String path, bool isSelected) {
    return AppImages(
      imagePath: path,
      width: 24.w,
      height: 24.h,
      colorFilter: ColorFilter.mode(
        isSelected ? LightAppColors.grey0 : LightAppColors.grey500,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.push(context, StartChatView());
        },
        backgroundColor: LightAppColors.primary800,
        child: AppImages(
          imagePath: 'chatbot.svg',
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(LightAppColors.grey0, BlendMode.srcIn),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: LightAppColors.grey900),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          _appBarTitles[_selectedIndex],
          style: AppTextStyles.font20SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: LightAppColors.primary800,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          selectedItemColor: LightAppColors.grey0,
          unselectedItemColor: LightAppColors.grey500,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppTextStyles.font12Regular.copyWith(
            color: LightAppColors.grey0,
          ),
          unselectedLabelStyle: AppTextStyles.font12Regular.copyWith(
            color: LightAppColors.grey500,
          ),

          items: [
            BottomNavigationBarItem(
              icon: buildSvg('chat.svg', _selectedIndex == 0),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: buildSvg('qoute.svg', _selectedIndex == 1),
              label: 'Quotes',
            ),
            BottomNavigationBarItem(
              icon: buildSvg('profile.svg', _selectedIndex == 2),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
