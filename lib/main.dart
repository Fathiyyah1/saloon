import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon/cubit/user_cubit.dart';
import 'package:saloon/screens/utils/global.dart';
import 'package:saloon/screens/freemium/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: CupertinoApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            // brightness: Brightness.light,
            // primaryColor: AppColors.Dark,
            ),
        home: Homepage(),
      ),
    );
  }
}
