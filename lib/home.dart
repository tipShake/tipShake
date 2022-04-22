import 'package:app/profile.dart';
import 'package:app/tipstart.dart';
import 'package:app/tipsuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF23242F),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Background Image Top.png'))),
        ),
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
                    height: 1.1428571428571428,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff26c165),
                      letterSpacing: 1.246,
                      fontWeight: FontWeight.w500,
                      height: 1.1428571428571428,
                    ),
                  )),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const tipstart()),
                    );
                  },
                  child: Text(
                    'TIP',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff26c165),
                      letterSpacing: 1.246,
                      fontWeight: FontWeight.w500,
                      height: 1.1428571428571428,
                    ),
                  )),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const profileScreen()),
                    );
                  },
                  child: Text(
                    'PROFILES',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff26c165),
                      letterSpacing: 1.246,
                      fontWeight: FontWeight.w500,
                      height: 1.1428571428571428,
                    ),
                  )),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF6B9681),
      body: Column(children: [
        //Card Balance
        Card(
            color: Color(0xFF24B781),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
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
                        Text(
                          '\$ 000.00',
                          style: TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 30,
                            color: Color(0xfffefefe),
                            height: 1.0666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ],
                    ),
                    Card(
                      color: const Color(0xff306f58),
                      child: SizedBox(
                        height: 25,
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
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
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
              height: 85,
              width: 335,
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
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
        ),
        //TODO Create History Slider
        //Slider
        SizedBox(
          height: 65,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: const Color(0xff306f58),
                    child: SizedBox(
                      //Holds  Contents Of Card
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
                            children: const [
                              Text(
                                'Samantha West ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                  height: 1.3333333333333333,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                              Text(
                                'Paid +\$35',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color(0xff24b781),
                                  fontWeight: FontWeight.w500,
                                  height: 1.6666666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: 49,
                      width: 194,
                    ),
                  ),
                  Card(
                    color: const Color(0xff306f58),
                    child: SizedBox(
                      //Holds  Contents Of Card
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
                            children: const [
                              Text(
                                'Samantha West ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                  height: 1.3333333333333333,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                              Text(
                                'Paid +\$35',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color(0xff24b781),
                                  fontWeight: FontWeight.w500,
                                  height: 1.6666666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: 49,
                      width: 194,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Text(
          'How Much are you tipping today?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500,
            height: 1.1764705882352942,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '000.00',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 47,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
            height: 1.1702127659574468,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        Container(
          width: 311,
          height: 154,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/tipbutton.png'),
            ),
          ),
        )
      ]));
}
