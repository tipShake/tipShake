import 'package:app/tipping/tipstart.dart';
import 'package:app/widgets/scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  num tipBal = 0;
  num accBal = 0;
  String accountBal = "\$";

  Widget build(BuildContext context) {
    String fullBal = accountBal + accBal.toString();
    String tipToday = accountBal + tipBal.toString();

    return Scaffold(
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
                    child: CircleAvatar(),
                    height: 86,
                    width: 86,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 5.0, color: const Color(0xffffffff)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    widget.user.email!,
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
                                actions: [
                                  SignedOutAction((context) {
                                    Navigator.pushReplacementNamed(
                                        context, '/');
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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Card Balance
          Card(
              color: Color(0xFF24B781),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                            fullBal,
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
                            children: [
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
                                'Mastercard Account *0000',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
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
                                child: CircleAvatar(
                                  child: Image.network(
                                      'https://isteam.wsimg.com/ip/a3fe5ef1-b3dc-4156-b365-a700ef65fb35/fb_2224846467552818_1440x1080/:/cr=t:0%25,l:12.5%25,w:75%25,h:100%25/rs=w:730,h:730,cg:true'),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Hard Yacht Cafe ',
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
                                child: CircleAvatar(
                                  child: Image.network(
                                      'http://owlmetals.com/wp-content/uploads/2013/07/Logo_Official2.png'),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Owl Metals ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Paid +\$87',
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
          //How Much You Tip?
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
            tipToday,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 47,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w600,
              height: 1.1702127659574468,
            ),
          ),
          Spacer(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              //Add Money To Your Account

              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  setState(() {
                    tipBal++;
                  });

                  print(tipToday);

                  final snackBar = SnackBar(
                    content:
                        Text("Add " + tipBal.toString() + ' To Account 0000'),
                    action: SnackBarAction(
                      label: 'Add',
                      onPressed: () {
                        setState(() {
                          accBal = tipBal;
                        });
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('+1'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  setState(() {
                    tipBal = tipBal + 2;
                  });

                  print(tipToday);

                  final snackBar = SnackBar(
                    content: Text("Add $tipBal To Account 0000"),
                    action: SnackBarAction(
                      label: 'Add',
                      onPressed: () {
                        setState(() {
                          accBal = tipBal;
                        });
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('+2'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  setState(() {
                    tipBal = tipBal + 5;
                  });

                  print(tipToday);

                  final snackBar = SnackBar(
                    content: Text("Add $tipBal To Account 0000"),
                    action: SnackBarAction(
                      label: 'Add',
                      onPressed: () {
                        setState(() {
                          accBal = tipBal;
                        });
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('+5'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  setState(() {
                    tipBal = tipBal + 10;
                  });

                  print(tipToday);

                  final snackBar = SnackBar(
                    content: Text("Add $tipBal To Account 0000"),
                    action: SnackBarAction(
                      label: 'Add',
                      onPressed: () {
                        setState(() {
                          accBal = tipBal;
                        });
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('+10'),
              ),
            ],
          ),

          Spacer()
        ]));
  }
}
