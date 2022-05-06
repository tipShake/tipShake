import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
                actions: [
                  AuthStateChangeAction<SignedIn>((context, _) {
                    Navigator.of(context).pushReplacementNamed('/HomePage');
                  }),
                ],
                headerBuilder: (context, constraints, _) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(image: AssetImage('assets/images/logoBW.png')),
                  );
                },
                providerConfigs: [
                  EmailProviderConfiguration(),
                ]);
          }
          return HomePage();
        });
  }
}

/*
Scaffold(
        backgroundColor: Color(0xFF23242F),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 94,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/logoBW.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Tagline
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A new way to Tip! ',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 28,
                    color: const Color(0xffffffff),
                    height: 1.4285714285714286,
                  ),
                ),
              ],
            ),

            //Description
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 65,
                ),
                Text(
                  'A new and fun way to tip & send money!',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16,
                    color: const Color(0xff97ffd9),
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
            //Sign In
            Container(
              height: 54,
              width: 327,
              decoration: BoxDecoration(
                color: const Color(0xb5689680),
                borderRadius: BorderRadius.circular(52.0),
                border: Border.all(width: 3.0, color: const Color(0xff23242f)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff24b781),
                    offset: Offset(0, 4),
                    blurRadius: 28,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
            //Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an  account ?',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        height: 1.5,
                      ),
                    )),
              ],
            ),
            Row(
              children: [RegisterScreen()],
            )
          ],
        ),
      )
 */
