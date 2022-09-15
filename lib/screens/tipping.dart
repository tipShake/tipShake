import 'package:app/misc/controllers.dart';
import 'package:app/misc/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../misc/intergers.dart';

class BasicTip extends StatefulWidget {
  const BasicTip({Key? key}) : super(key: key);

  @override
  State<BasicTip> createState() => _BasicTipState();
}

String code = Numbers.cryptoSent.toString();

class _BasicTipState extends State<BasicTip> {
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //User Profile Picture
          title: Column(
            children: [
              //Who you are tipping
              Text(
                'Who are you tipping?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  height: 1.1764705882352942,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              )
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                //Their Image
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.contacts,
                        color: Colors.white,
                        size: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0),
                        child: Text(
                          'Contacts',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            height: 1.1764705882352942,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                      )
                    ],
                  ),
                ),

                //Crypto Selection & Crypto Equivalent Amount Sending
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Logos.XRP,
                        width: 30,
                        height: 30,
                      ),
                      Text(tipController.text),
                    ],
                  ),
                ),
                //USD Amount Sending
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text("\$00.00"),
                    ],
                  ),
                ),

                //Wallet Balance
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Wallet Balance \$' + Numbers.fullBalance.toString(),
                        style: TextStyle(
                          fontFamily: 'Acumin Pro',
                          fontSize: 15,
                          color: const Color(0xff4270b7),
                          fontWeight: FontWeight.w700,
                          height: 2.1333333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                //Divider
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xffffffff),
                  ),
                ),
//NumberPad
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //123
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '1';
                              });
                            },
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '2';
                              });
                            },
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '3';
                              });
                            },
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //456
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '4';
                              });
                            },
                            child: Text(
                              '4',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '5';
                              });
                            },
                            child: Text(
                              '5',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '6';
                              });
                            },
                            child: Text(
                              '6',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //789
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '7';
                              });
                            },
                            child: Text(
                              '7',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '8';
                              });
                            },
                            child: Text(
                              '8',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '9';
                              });
                            },
                            child: Text(
                              '9',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //0
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: () {}, child: Container()),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromRadius(35),
                              shape: CircleBorder(side: BorderSide.none),
                              primary: Color(0xff1E4579),
                            ),
                            onPressed: () {
                              setState(() {
                                tipController.text += '0';
                              });
                            },
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 1.1875,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  tipController.clear();
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 40,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                //Confirm Button Tip
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Container()),
                    );
                  },
                  child: Text(
                    'tip',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1E4579),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),

///TODO Import Unity AR
                TextButton(
                  onPressed: () {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Container()),
                    );
                  },
                  child: Text(
                    'BASIC MODE - TAP TO SWITCH',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 2,
                      shadows: [
                        Shadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        )
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
