import 'package:app/addmoney.dart';
import 'package:app/profile.dart';
import 'package:app/tipping/tipstart.dart';
import 'package:app/tipping/tipsuccess.dart';
import 'package:app/widgets/navbar.dart';
import 'package:app/widgets/scanner.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterfire_ui/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/login.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;

  final user = 'Larry';
  get width => 5;
  String dropdownValue = 'XRP';
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF23242F),
        toolbarHeight: 120,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/userW.jpg')),
                    borderRadius: const BorderRadius.all(
                        Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 5.0, color: const Color(0xffffffff)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: const [
                Text(
                  'Lexi West',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 20,
                    color: Color(0xffffffff),
                    height: 1.4,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                Text(
                  '@MAKEITSHAKE',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
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
                onPressed: () {},
                child: Text(
                  'HOME',
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner()),
                  );
                },
                child: Text(
                  'TIP',
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(
                                      Icons.account_balance_wallet_rounded),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.white),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>['XRP', 'BTC', 'MANA', 'USDC']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                              actions: [
                                SignedOutAction((context) {
                                  Navigator.pushReplacementNamed(context, '/');
                                })
                              ],
                            )),
                  );
                },
                child: Text(
                  'PROFILES',
                )),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF6B9681),
      body: Column(children: [
        //Card Balance
        Card(
            color: Color(0xFF24B781),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 100,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0, top: 1),
                          child: Text(
                            'Balance',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color(0xfffefefe),
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Text(
                          '\$ 000.00',
                          style: TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 30,
                            color: Color(0xfffefefe),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      color: const Color(0xff306f58),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'Paying from ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Color(0xffffffff),
                                height: 1.3333333333333333,
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.ccMastercard,
                              color: Colors.white,
                            ),
                            Text(
                              'Mastercard Account 0000',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                height: 1.4285714285714286,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        //Tip History
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tipstart()),
              );
            },
            child: Text(
              'Tip History',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 20,
                color: Color(0xff343434),
                height: 1.6,
              ),
            ),
          ),
        ),
        //Slider
        SizedBox(
          height: 65,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  CustomCard(
                    borderRadius: 5,
                    color: Color(0xff306f58),
                    onTap: () {},
                    childPadding: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //USR IMAGE
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //USR IMAGE
                            Container(
                              height: 34,
                              width: 34,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/usr1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Samantha West ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Paid +\$35',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xff24b781),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCard(
                    borderRadius: 5,
                    color: Color(0xff306f58),
                    onTap: () {},
                    childPadding: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //USR IMAGE
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //USR IMAGE
                            Container(
                              height: 34,
                              width: 34,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/usr1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Samantha West ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Paid +\$35',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xff24b781),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'How Much are you tipping today?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500,
            height: 1.1764705882352942,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '000.00',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 47,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
            height: 1.1702127659574468,
          ),
        ),
        Spacer(),
        OpenContainer(
          transitionType: _containerTransitionType,
          transitionDuration: Duration(milliseconds: 800),
          openBuilder: (context, _) => addMoney(),
          closedBuilder: (context, _) => Container(
            alignment: Alignment.center,
            child: Container(
              width: 311,
              height: 154,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tipbutton.png'),
                ),
              ),
            ),
          ),
        ),
      ]));
}

Widget displayUserInformation(context, snapshot) {
  final user = snapshot.data;

  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Name: ${user.displayName ?? 'Anonymous'}",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Email: ${user.email ?? 'Anonymous'}",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Created: ${DateFormat('MM/dd/yyyy').format(user.metadata.creationTime)}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}
