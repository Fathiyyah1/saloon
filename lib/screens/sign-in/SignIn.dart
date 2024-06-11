import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/bloc/cubits/user_cubit.dart';
import 'package:saloon/models/user.dart';
import 'package:saloon/screens/freemium/homepage.dart';
import 'package:saloon/screens/sign-up/SignUp.dart';
import 'package:skadi/skadi.dart';

import '../components/logo_widget.dart';
import '../components/my_tfield.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final _auth = auth.FirebaseAuth.instance;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LogoWidget(),
              // Text(
              //   "Welcome to LingoLeap!",
              //   style: TextStyle(color: Colors.purple, fontSize: 30),
              // ),
              Column(
                children: [
                  MyTextField(
                      controller: emailCont,
                      title: "Email",
                      icon: const Icon(Icons.email)),
                  MyTextField(
                    controller: passCont,
                    title: "Password",
                    obscure: true,
                    icon: const Icon(Icons.password),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: SkadiAsyncButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserCubit userCubit = UserCubit.get(context);
                            try {
                              final res = await userCubit.loginUser(
                                  emailCont.text, passCont.text);
                              if (res is User) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return const Homepage();
                                  },
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Login failed. Please check your credentials."),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("An error occurred: $e"),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              )),
                          child: Text(
                            "Sign up now!",
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
