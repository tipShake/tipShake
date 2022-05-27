import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/main.dart';

// Link to DB
final List data = [
  {
    'color': Colors.white,
  },
  {
    'color': Colors.white,
  },
  {
    'color': Colors.white,
  }
];

class moneyswipe extends StatefulWidget {
  @override
  _moneyswipeState createState() => _moneyswipeState();
}

class _moneyswipeState extends State<moneyswipe> {
  //For Button Bar

  // Dynamically load cards from database
  List<Card> cards = [
    Card(
      data[0]['color'],
    ),
    Card(
      data[1]['color'],
    ),
    Card(
      data[2]['color'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Stack of cards that can be swiped. Set width, height, etc here.
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      // Important to keep as a stack to have overlay of cards.
      child: Stack(
        children: cards,
      ),
    );
  }
}

class Card extends StatelessWidget {
  // Made to distinguish cards
  final Color color;

  Card(this.color);

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'LOWER',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff0ba9d4),
                      fontWeight: FontWeight.w600,
                      height: 1.1702127659574468,
                    ),
                  )),
              Text(
                'DENOMINATION',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff0ba9d4),
                  fontWeight: FontWeight.w600,
                  height: 1.1702127659574468,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'HIGHER',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff0ba9d4),
                      fontWeight: FontWeight.w600,
                      height: 1.1702127659574468,
                    ),
                  )),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Ammount
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Amount Tipped',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            //Money Spent
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '000.00',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                    height: 1.1702127659574468,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
            //Current Balance
            Text(
              'Wallet 000.00',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 1.1714285714285715,
              ),
            ),

            //Swipeable Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 350,
                      width: 250,
                      child: Swipable(
                        horizontalSwipe: false,
                        // Set the swipable widget
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: const AssetImage(
                                    'assets/images/pinkbill.png'),
                                fit: BoxFit.contain,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  offset: Offset(3, 0),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Amount Tipped',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                height: 0.96,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                            Text(
                              '000.00',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 35,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                                height: 1.5714285714285714,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Amount Tipped',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w600,
                                    height: 0.96,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                                Text(
                                  '000.00',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 35,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w300,
                                    height: 1.5714285714285714,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(children: [
                              /*
                              DropdownButton(
                                items: DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              )
                              
                               */
                            ])
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),

            //Crypto Selection
          ],
        ));
  }
}

void setState(Null Function() param0) {}
