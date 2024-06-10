import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon/cubit/user_states.dart';
import 'package:saloon/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitState());
  static UserCubit get(BuildContext context) => BlocProvider.of(context);
  User? loggedUser;

  void init() async {
    loggedUser = await getSavedUser();
  }

  Future<User?> getSavedUser() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? progressString = prefs.getString("progress");
      List progress = jsonDecode(progressString ?? "");
      print(progressString);
      print(progress);
      loggedUser = User(
        id: prefs.getString('id')!,
        email: prefs.getString('email')!,
        name: prefs.getString('name')!,
        isPremium: prefs.getBool('isPremium')!,
        progress: progressString != null && progressString != "()"
            ? progress.map((e) => Progress.fromJson(e)).toList()
            : [],
      );
      emit(TriggerUser());
      return loggedUser;
    } catch (e) {
      print("Error in getSavedUser $e");
    }
  }

  Future<dynamic> loginUser(String email, String pass) async {
    final _auth = auth.FirebaseAuth.instance;
    try {
      auth.UserCredential _credential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      final firebaseUser = _credential.user;
      if (firebaseUser != null) {
        bool isPremium = false;
        List<Progress> progress = [];
        var userData = await getUserData(firebaseUser.uid);
        if (userData != null && userData['isPremium'] != null) {
          isPremium = userData['isPremium'];
          progress = (userData['progress'] as List)
              .map((e) => Progress.fromJson(e))
              .toList();
        } else {
          // Set isPremium to false in firebase
          await createUserData(firebaseUser.uid, false);
        }
        loggedUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName!,
          isPremium: isPremium,
          progress: progress,
        );
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString("id", loggedUser!.id);
        prefs.setString("email", loggedUser!.email);
        prefs.setString("name", loggedUser!.name);
        prefs.setBool("isPremium", loggedUser!.isPremium);
        prefs.setString(
            "progress",
            jsonEncode(
              loggedUser!.progress
                  .map(
                    (e) => e.toJson(),
                  )
                  .toList(),
            ));
        return loggedUser;
      } else {
        return null;
      }
    } on auth.FirebaseException catch (e) {
      throw e.code;
    }
  }

  Future<User?> registerUser(String name, String email, String pass) async {
    final _auth = auth.FirebaseAuth.instance;
    auth.UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    final firebaseUser = credential.user;
    if (firebaseUser != null) {
      await firebaseUser.updateDisplayName(name);
      loggedUser = User(
        id: firebaseUser.uid,
        email: firebaseUser.email!,
        name: name,
        isPremium: false,
        progress: [],
      );
      await createUserData(firebaseUser.uid, false);
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      prefs.setString("id", loggedUser!.id);
      prefs.setString("email", loggedUser!.email);
      prefs.setString("name", loggedUser!.name);
      prefs.setBool("isPremium", loggedUser!.isPremium);
      return loggedUser;
    } else {
      return null;
    }
  }

  Future logOut() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    await prefs.clear();
  }

  Future updateUserPremium(bool isPremium) async {
    loggedUser!.isPremium = isPremium;
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("isPremium", isPremium);
    emit(TriggerUser());
  }
}
