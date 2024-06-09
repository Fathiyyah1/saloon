import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/global.dart';
import 'package:saloon/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
      ),
      home: MyHomePage(
        title: "hi",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screens = [homepage()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            label: "Chats", icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
        BottomNavigationBarItem(
            label: "Calls", icon: Icon(CupertinoIcons.phone)),
        BottomNavigationBarItem(
            label: "People", icon: Icon(CupertinoIcons.person_alt_circle)),
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
