import 'package:app/widgets/modal_bottom_sheet.dart';
import 'package:app/widgets/quickadd.dart';
import 'package:app/widgets/scanqr.dart';
import 'package:app/widgets/tiphistory.dart';
import 'package:app/tipping/tipstart.dart';
import 'package:app/strings.dart';
import 'package:app/integers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:app/widgets/scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/balancecard.dart';
import 'package:app/screens/basictip.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xffBFC4C7),
          Color(0xffB7C9E2),
          Color(0xffCAC2BA),
        ],
      )),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 125,
            //User Profile Picture
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/3755708/pexels-photo-3755708.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3755708.jpg&fm=jpg'),
                    ),
                    ShowQr(),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BasicTip()),
                      );
                    },
                    child: Text(
                      'TIP',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffffffff),
                          textStyle: Theme.of(context).textTheme.button),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrScanner()),
                      );
                    },
                    color: Colors.white,
                    icon: const Icon(Ionicons.scan_outline)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Color(0xffBFC4C7),
                                      Color(0xffB7C9E2),
                                      Color(0xffCAC2BA),
                                    ],
                                  )),
                                  child: ProfileScreen(
                                    actions: [
                                      SignedOutAction((context) {
                                        Navigator.pushReplacementNamed(
                                            context, '/');
                                      })
                                    ],
                                  ),
                                )),
                      );
                    },
                    child: Text(
                      'PROFILES',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffffffff),
                          textStyle: Theme.of(context).textTheme.button),
                    )),
              ],
            ),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Card Balance
            const BalanceCard(),

            //Tip History
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Tip History',
                    style: GoogleFonts.poppins(
                        color: const Color(0xffffffff),
                        textStyle: Theme.of(context).textTheme.headline6),
                  )
                ],
              ),
            ),

            //TipCards Horizontal Swipe
            const TipCard(),

            const SizedBox(
              height: 30,
            ),
            //How Much You Tip?
            Text(
              'How Much are you tipping today?',
              style: GoogleFonts.poppins(
                  color: const Color(0xff1E4579),
                  textStyle: Theme.of(context).textTheme.headline6),
            ),
            const SizedBox(
              height: 20,
            ),
            //Tipping Amount
            Text(
              Numbers.moneyAdded.toString(),
              style: GoogleFonts.poppins(
                  color: const Color(0xff1E4579),
                  textStyle: Theme.of(context).textTheme.headline2),
            ),
            const Spacer(),
            //Quickly Add Money
            const QuickAdd(),

            const Spacer()
          ])),
    );
  }
}
