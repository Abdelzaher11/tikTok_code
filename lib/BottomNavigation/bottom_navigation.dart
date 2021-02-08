import 'package:flutter/material.dart';
import 'package:tiktok_code/BottomNavigation/Explore/explore_page.dart';
import 'package:tiktok_code/BottomNavigation/Home/home_page.dart';
import 'package:tiktok_code/BottomNavigation/MyProfile/my_profile_page.dart';
import 'package:tiktok_code/BottomNavigation/Notifications/notification_messages.dart';
import 'package:tiktok_code/Locale/locale.dart';
import 'package:tiktok_code/Routes/routes.dart';
import 'package:tiktok_code/Theme/colors.dart';
import 'package:tiktok_code/Theme/style.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    ExplorePage(),
    Container(),
    NotificationMessages(),
    MyProfilePage(),
  ];

  void onTap(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> _bottomBarItems = [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_home.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_homeactive.png')),
        title: Text(locale.home),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_explore.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_exploreactive.png')),
        title: Text(locale.explore),
      ),
      BottomNavigationBarItem(
        icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: BoxDecoration(
              borderRadius: radius,
              color: mainColor,
            ),
            child: Icon(Icons.add)),
        title: SizedBox.shrink(),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_notification.png')),
        activeIcon:
            ImageIcon(AssetImage('assets/icons/ic_notificationactive.png')),
        title: Text(locale.notification),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_profile.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_profileactive.png')),
        title: Text(locale.profile),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: transparentColor,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              iconSize: 22.0,
              selectedItemColor: secondaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              unselectedItemColor: secondaryColor,
              items: _bottomBarItems,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
