import 'package:tranquility/core/utils/common_imports.dart';
import 'package:tranquility/views/home/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final _pages = [
    Center(child: Text('Chats Page')),
    Center(child: Text('Quotes Page')),
    Center(child: Text('Profile Page')),
  ];

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
