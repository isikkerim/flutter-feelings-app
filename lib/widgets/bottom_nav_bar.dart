import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Root/color.dart';
import '../views/bottomViews/1_bottom_home_page.dart';
import '../views/bottomViews/2_bottom_discover.dart';
import '../views/bottomViews/3_bottom_aktivity.dart';
import '../views/bottomViews/4_bottom_content.dart';
import '../views/bottomViews/5_bottom_profile.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    BottomHomePage(),
    ExplorePage(),
    BottomActivityPage(),
    NewsHomePage(),
    BottomProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Icon(FontAwesomeIcons.trophy),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ColorConstants.light_background_linear_gradient,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: ColorConstants.light_background_linear_gradient),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: tabItems[_selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  gradient: ColorConstants.light_background_linear_gradient),
              child: FlashyTabBar(
                backgroundColor: Colors.transparent,
                animationCurve: Curves.linear,
                selectedIndex: _selectedIndex,
                iconSize: 30,
                showElevation: false,
                onItemSelected: (index) => setState(() {
                  _selectedIndex = index;
                }),
                items: [
                  FlashyTabBarItem(
                      activeColor: Theme.of(context).secondaryHeaderColor,
                      icon: Icon(Icons.home_outlined),
                      title: Text(
                        'Ana Sayfa',
                      )),
                  FlashyTabBarItem(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    icon: Icon(Icons.search_off_outlined),
                    title: Text(
                      'Keşfet',
                    ),
                  ),
                  FlashyTabBarItem(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    icon: Icon(Icons.local_activity_outlined),
                    title: Text('Aktiviteler'),
                  ),
                  FlashyTabBarItem(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    icon: Icon(Icons.content_copy_outlined),
                    title: Text('Yazılar'),
                  ),
                  FlashyTabBarItem(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    icon: Icon(Icons.person_2_outlined),
                    title: Text('Profil'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
