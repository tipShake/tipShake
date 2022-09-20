import 'package:app/misc/strings.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
    ),
    home: const homeScreen(
        username: 'Larry',
        accountbalance: '100.00',
        email: 'lilghostdancer@gmail.com',
        phonenumber: '240-625-8214',
        userpic: 'assets/logos/tipshake_qr.png',
        pickedbill: Bills.Purple),
  ));
}
