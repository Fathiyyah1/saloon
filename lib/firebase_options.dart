// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC_IVltlvcy4mTd_Q3slCODhyPnvBtKu4U',
    appId: '1:77339413326:web:16833b95168c20df13ac1f',
    messagingSenderId: '77339413326',
    projectId: 'retplan-project',
    authDomain: 'retplan-project.firebaseapp.com',
    storageBucket: 'retplan-project.appspot.com',
    measurementId: 'G-JMWK0303DJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfvY-jVcg3SJS2XMYHF_p-fkg1StTwqSc',
    appId: '1:77339413326:android:ec354298c0cac29713ac1f',
    messagingSenderId: '77339413326',
    projectId: 'retplan-project',
    storageBucket: 'retplan-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBe1dsqjc57xkN_9_1IA8p7gmZ0HNTzmBA',
    appId: '1:77339413326:ios:3b1e95225806a96c13ac1f',
    messagingSenderId: '77339413326',
    projectId: 'retplan-project',
    storageBucket: 'retplan-project.appspot.com',
    iosClientId:
        '77339413326-s536ak1t02pgiihs54j2cbefjvgle15r.apps.googleusercontent.com',
    iosBundleId: 'com.example.retplan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBe1dsqjc57xkN_9_1IA8p7gmZ0HNTzmBA',
    appId: '1:77339413326:ios:3b1e95225806a96c13ac1f',
    messagingSenderId: '77339413326',
    projectId: 'retplan-project',
    storageBucket: 'retplan-project.appspot.com',
    iosClientId:
        '77339413326-s536ak1t02pgiihs54j2cbefjvgle15r.apps.googleusercontent.com',
    iosBundleId: 'com.example.retplan',
  );
}
