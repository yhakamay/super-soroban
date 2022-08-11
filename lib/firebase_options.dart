// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDFy4ypSZYVGv_3WloekSKKQPSzWTi29oE',
    appId: '1:510954039165:web:ec8d91af410005d8e34e14',
    messagingSenderId: '510954039165',
    projectId: 'motchi',
    authDomain: 'motchi.firebaseapp.com',
    storageBucket: 'motchi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWt3N7opNKBPXitnYcTJDgc4YmxhfmvBY',
    appId: '1:510954039165:ios:9082f187068ecfc9e34e14',
    messagingSenderId: '510954039165',
    projectId: 'motchi',
    storageBucket: 'motchi.appspot.com',
    iosClientId: '510954039165-fb6btv60hv4a1adn858d88d6804hftne.apps.googleusercontent.com',
    iosBundleId: 'com.yhakamay.motchi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWt3N7opNKBPXitnYcTJDgc4YmxhfmvBY',
    appId: '1:510954039165:ios:9082f187068ecfc9e34e14',
    messagingSenderId: '510954039165',
    projectId: 'motchi',
    storageBucket: 'motchi.appspot.com',
    iosClientId: '510954039165-fb6btv60hv4a1adn858d88d6804hftne.apps.googleusercontent.com',
    iosBundleId: 'com.yhakamay.motchi',
  );
}