import 'package:app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterFireUIAuth.configureProviders([
    EmailProviderConfiguration(),
  ]);

  runApp(MaterialApp(
    //---------Theme Start -----------------------------

    title: 'Tipshake',
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,

      // Define the default font family.
      fontFamily: 'Poppins',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(),
    ),
    //---------Theme End -----------------------------

    home: Login(),
  ));
}
