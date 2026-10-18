import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/tabs/explore_tab.dart';
import 'package:movie_app/ui/home/tabs/home_tab.dart';
import 'package:movie_app/ui/home/tabs/profile_tab.dart';
import 'package:movie_app/ui/home/tabs/search_tab.dart';
import 'package:movie_app/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  Color yellow = const Color(0xFFFFBB3B);
  Color navColor = const Color(0xFF282A28);

  double w(double value) => SizeUtils.getWidth(context, value);

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const ExploreTab(),
    const ProfileTab(),
  ];

  Widget buildIcon(String path, Color color) {
    return Image.asset(
      path,
      color: color,
      width: w(26),
      height: w(26),
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: tabs[selectedIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(w(9), 0, w(9), w(9)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(w(16)),
            child: BottomNavigationBar(
              backgroundColor: navColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,

              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },

              items: [
                BottomNavigationBarItem(
                  icon: buildIcon('assets/images/Home_logo.png', Colors.white),
                  activeIcon: buildIcon('assets/images/Home_logo.png', yellow),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: buildIcon(
                    'assets/images/Search_logo.png',
                    Colors.white,
                  ),
                  activeIcon: buildIcon(
                    'assets/images/Search_logo.png',
                    yellow,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: buildIcon('assets/images/explore.png', Colors.white),
                  activeIcon: buildIcon('assets/images/explore.png', yellow),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: buildIcon('assets/images/Profiel.png', Colors.white),
                  activeIcon: buildIcon('assets/images/Profiel.png', yellow),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
