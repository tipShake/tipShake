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
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    //---------Theme End -----------------------------

    home: Login(),
  ));
}
