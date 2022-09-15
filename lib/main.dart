import 'package:app/screens/onboarding.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
    ),
    home: const onboardScreen(),
  ));
}
