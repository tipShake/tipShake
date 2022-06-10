import 'package:app/screens/tipsuccess.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/integers.dart';
import 'package:number_pad/number_pad.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 125,
          //User Profile Picture
          title: Column(
            children: [
              //Who you are tipping
              Text(
                'You are Tipping !Tipmaster',
                style: GoogleFonts.poppins(
                    color: const Color(0xffffffff),
                    textStyle: Theme.of(context).textTheme.button),
              ),
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                //Their Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    )
                  ],
                ),

                //Crypto Selection & Crypto Equivalent Amount Sending
                Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: SvgPicture.network(
                        'https://www.cryptofonts.com/img/icons/xrp.svg',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Numbers.cryptoSent.toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff1E4579),
                          textStyle: Theme.of(context).textTheme.headline3),
                    ),
                  ],
                ),
                //USD Amount Sending
                Row(
                  children: [
                    Spacer(),
                    AutoSizeText(
                      '\$$code',
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff1E4579),
                          textStyle: Theme.of(context).textTheme.headline3),
                    )
                  ],
                ),

                //Wallet Balance
                Row(
                  children: [
                    Spacer(),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Acumin Pro',
                          fontSize: 15,
                          color: const Color(0xff4270b7),
                          height: 2.1333333333333333,
                        ),
                        children: [
                          TextSpan(
                            text: 'Wallet Balance \$',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: Numbers.fullBalance.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    )
                  ],
                ),
                //Divider
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xffffffff),
                ),
                Spacer(),
                //TODO Custom Number Pad for now using a normal looking one
                const Spacer(),
                //Number Pad
                NumberPad(
                  onChange: (value) {
                    setState(() {
                      code = value;
                      code = Numbers.cryptoBal.toString();
                    });
                  },
                ),
                Spacer(),

                //Confirm Button Tip
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TipSuccess()),
                    );
                  },
                  child: Text(
                    'TIP',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1E4579),
                        textStyle: Theme.of(context).textTheme.headline4),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
