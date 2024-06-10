import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/screens/freemium/Appointment.dart';
import 'package:saloon/screens/freemium/Profile.dart';
import 'package:saloon/screens/freemium/Settings.dart';
import 'package:saloon/screens/public/home.dart';
import 'package:saloon/screens/utils/global.dart';

var screens = [homepage(), Appointment(), Profile(), Settings()];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    homepage(),
    Appointment(),
    Profile(),
    Settings()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor:
                  Colors.transparent, // Make background transparent
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.calendar_today),
                  label: 'Appointments',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_alt_circle),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings_solid),
                  label: 'Settings',
                ),
              ],
              onTap: _onTabTapped,
            ),
            tabBuilder: (BuildContext context, int index) {
              return _screens[_selectedIndex];
            },
          ),
          Positioned(
            bottom: 50.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(CupertinoIcons.home, "Home", 0),
                  _buildNavItem(
                      CupertinoIcons.calendar_today, "Appointments", 1),
                  _buildNavItem(CupertinoIcons.person_alt_circle, "Profile", 2),
                  _buildNavItem(CupertinoIcons.settings_solid, "Settings", 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onTabTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: _selectedIndex == index
                ? AppColors.Dark
                : CupertinoColors.inactiveGray,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? AppColors.Dark
                  : CupertinoColors.inactiveGray,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
