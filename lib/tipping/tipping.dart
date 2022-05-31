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
            //Crypto Profile Pic & UserName
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/placeholderqr.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      'Jessica Smith',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        height: 1.64,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    Text(
                      'mwmfigfphbyQaLRkT4xHv8aGQY4n7JrbMb',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        height: 1.6666666666666667,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ],
                ),
              ],
            ),
            //Swipeable Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //Money Swipe
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
                    //Amount Tipped
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff23292f),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                              width: 65,
                            ),
                            Column(
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(CryptoFontIcons.XRP),
                                        ),
                                        Text(
                                          'XRP',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 23,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                            height: 1.2608695652173914,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          softWrap: false,
                                        ),
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                    //TODO ADD Crypto Selection
                    //TODO ADD LOWER/HIGHER
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
