import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/cubit/user_cubit.dart';
import 'package:saloon/screens/freemium/homepage.dart';
import 'package:saloon/screens/public/splash.dart';
import 'screens/components/loading_indicator.dart';
import 'screens/sign-in/SignIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = UserCubit.get(context);
    Future<bool> checkLoggedUser() async {
      await userCubit.getSavedUser();
      if (userCubit.loggedUser != null) return true;
      return false;
    }

    return Scaffold(
      body: FutureBuilder(
        future: checkLoggedUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const MyCircularProgressIndicator();
          }
          if (snapshot.data != false) {
            return Homepage();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
