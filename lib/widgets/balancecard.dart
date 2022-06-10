import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/integers.dart';
import 'package:app/strings.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 0,
      borderColor: Colors.white,
      borderRadius: 10,
      color: Colors.transparent,
      onTap: () {},
      child: SizedBox(
          height: 150,
          width: 350,
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
//Crypto Selector & Crypto Balance
                Row(
                  children: [
//Crypto Selector
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.network(
                        'https://www.cryptofonts.com/img/icons/xrp.svg',
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
//Balance + Current Crypto
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: Numbers.fullBalance.toString(),
                            style: GoogleFonts.poppins(
                                color: Color(0xffffffff),
                                textStyle:
                                    Theme.of(context).textTheme.headline4),
                          ),
                          TextSpan(
                              text: Strings.Ripple,
                              style: GoogleFonts.poppins(
                                  color: Color(0xffffffff),
                                  textStyle:
                                      Theme.of(context).textTheme.caption)),
                        ],
                      ),
                    ),
                  ],
                ),
//Public Crypto Address + Number
                Row(
                  children: [
                    Text(
                      Strings.pubAddy,
                      style: GoogleFonts.poppins(
                          color: Color(0xffffffff),
                          textStyle: Theme.of(context).textTheme.bodyText2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      Numbers.pubNum.toString(),
                      style: GoogleFonts.poppins(
                          color: Color(0xffffffff),
                          textStyle: Theme.of(context).textTheme.caption),
                    )
                  ],
                ),
//Market Value
                Row(
                  children: [
                    Text(Strings.markVal,
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            textStyle: Theme.of(context).textTheme.subtitle2)),
                    Spacer(),
                    Text(Numbers.marketValue.toString(),
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            textStyle: Theme.of(context).textTheme.subtitle1)),
                  ],
                ),
//TOTAL - User Currencies
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Total',
                            style: GoogleFonts.poppins(
                                color: Color(0xffffffff),
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1),
                          ),
                          TextSpan(
                              text: 'USD',
                              style: GoogleFonts.poppins(
                                  color: Color(0xffffffff),
                                  textStyle:
                                      Theme.of(context).textTheme.caption)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
