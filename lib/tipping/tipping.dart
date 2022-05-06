import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  // Add your own applicable data here
  final Color color;
  Card(this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Ammount
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ],
        ),

        //Money Spent
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '000.00',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40,
                color: const Color(0xffffffff),
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
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
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
                            image:
                                const AssetImage('assets/images/pinkbill.png'),
                            fit: BoxFit.contain,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(3, 0),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 250,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff23292f),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'XRP',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 23,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.2608695652173914,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),

                            //Crypto Icon
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: SvgPicture.network(
                                  'https://www.cryptofonts.com/img/icons/xrp.svg',
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        //Crypto Selection
      ],
    );
  }
}
