import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon/bloc/cubits/user_cubit.dart';
import 'package:saloon/firebase_options.dart';
import 'package:saloon/screens/public/splash.dart';
import 'package:saloon/screens/sign-in/SignIn.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit()..init(),
        ),
      ],
      child: CupertinoApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            // brightness: Brightness.light,
            // primaryColor: AppColors.Dark,
            ),
        home: SignIn(),
      ),
    );
  }
}
