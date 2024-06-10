import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon/cubit/app_cubit.dart';
import 'package:saloon/global.dart';
import 'package:saloon/screens/Appointment.dart';
import 'package:saloon/screens/Profile.dart';
import 'package:saloon/screens/Settings.dart';
import 'package:saloon/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: CupertinoApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.primary,
        ),
        home: MyHomePage(
          title: "hi",
        ),
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
  var screens = [homepage(), Appointment(), Profile(), Settings()];

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
