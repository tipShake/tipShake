import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b9681),
        toolbarHeight: 155,
        title: Column(
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
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff23242f),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile Settings',
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    height: 1.6,
                  ),
                ),
              ),
            ),
            Card(
                child: SizedBox(
              height: 320,
              width: 327,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            //Button Container
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xff306f58),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              //Icon
                              child: IconButton(
                                  color: Color(0xffffffff),
                                  onPressed: () {},
                                  icon: Icon(Icons.edit)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Column(
                              children: [
                                //Top String
                                Text(
                                  'Change Name',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 16,
                                    color: const Color(0xff343434),
                                    height: 1.25,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                                //Bottom Screen
                                Text(
                                  'Change your first and last name',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12,
                                    color: const Color(0xffa7a7a7),
                                    height: 1.3333333333333333,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            //Arrow Icon
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  //Bank
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            //Button Container
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xff306f58),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              //Icon
                              child: IconButton(
                                  color: Color(0xffffffff),
                                  onPressed: () {},
                                  icon: Icon(Icons.account_balance)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Column(
                              children: [
                                //Top String
                                Text(
                                  'Banking',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 16,
                                    color: const Color(0xff343434),
                                    height: 1.25,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                                //Bottom Screen
                                Text(
                                  'Change your banking settings',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12,
                                    color: const Color(0xffa7a7a7),
                                    height: 1.3333333333333333,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            //Arrow Icon
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  //Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            //Button Container
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xff306f58),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              //Icon
                              child: IconButton(
                                  color: Color(0xffffffff),
                                  onPressed: () {},
                                  icon: Icon(Icons.mail)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Column(
                              children: [
                                //Top String
                                Text(
                                  'Change Email',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 16,
                                    color: const Color(0xff343434),
                                    height: 1.25,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                                //Bottom Screen
                                Text(
                                  'You can change your Email',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12,
                                    color: const Color(0xffa7a7a7),
                                    height: 1.3333333333333333,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            //Arrow Icon
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  //Language
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            //Button Container
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xff306f58),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              //Icon
                              child: IconButton(
                                  color: Color(0xffffffff),
                                  onPressed: () {},
                                  icon: Icon(Icons.language)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Column(
                              children: [
                                //Top String
                                Text(
                                  'Change Language',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 16,
                                    color: const Color(0xff343434),
                                    height: 1.25,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                                //Bottom Screen
                                Text(
                                  'You can change the language',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12,
                                    color: const Color(0xffa7a7a7),
                                    height: 1.3333333333333333,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            //Arrow Icon
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            SignOutButton()
          ],
        ),
      ));
}
