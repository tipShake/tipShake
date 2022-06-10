import 'package:app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
  ]);

  runApp(MaterialApp(
    //---------Theme Start -----------------------------
    title: 'Tipshake',
    theme: ThemeData(
      primaryTextTheme: TextTheme(
        headline1: GoogleFonts.poppins(
            fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        headline2: GoogleFonts.poppins(
            fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3:
            GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
        headline4: GoogleFonts.poppins(
            fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        headline5:
            GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
        headline6: GoogleFonts.poppins(
            fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        subtitle1: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        subtitle2: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyText1: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        bodyText2: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        button: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
        caption: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        overline: GoogleFonts.poppins(
            fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff4270B7))),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 0,
        color: Color(0xffCAC2BA),
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
    ),
    //---------Theme End -----------------------------

    home: const Login(),
  ));
}
