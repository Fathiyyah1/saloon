import 'package:flutter/cupertino.dart';
import 'package:saloon/screens/Appointment.dart';
import 'package:saloon/screens/Profile.dart';
import 'package:saloon/screens/Settings.dart';
import 'package:saloon/screens/public/home.dart';

var screens = [homepage(), Appointment(), Profile(), Settings()];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(
            label: "Appointments", icon: Icon(CupertinoIcons.calendar_today)),
        BottomNavigationBarItem(
            label: "Profile", icon: Icon(CupertinoIcons.person_alt_circle)),
        BottomNavigationBarItem(
            label: "Settings", icon: Icon(CupertinoIcons.settings_solid)),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return Container(
          child: Center(
            child: screens[index],
          ),
        );
      },
    ));
  }
}
