import 'package:app/misc/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Wallet_Backup extends StatefulWidget {
  const Wallet_Backup({Key? key}) : super(key: key);

  @override
  State<Wallet_Backup> createState() => _Wallet_BackupState();
}

class _Wallet_BackupState extends State<Wallet_Backup> {
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
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.history),
                Text(
                  'Backup Your Wallet',
                  style: TextStyle(
                    fontFamily: 'Acumin Pro',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1,
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
              ],
            ),
          ),
          body: PageView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I understand that if I lose my recovery phrase I will not be able to access my account',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: Icon(Icons.radio_button_off),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  SvgPicture.asset(Logos.TipShakeBlack)
                ],
              ),
//Show Random Security Words
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Write down or copy these words in the right order and save them somewhere safe.',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 19,
                      color: const Color(0xff4d5858),
                      letterSpacing: 0.076,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

//Create Builder For Phrases

                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: passNumbers.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 40,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 2.0, color: const Color(0xffffffff)),
                            ),
                            child: Row(
                              children: [
                                Text(passNumbers[index]),
                                VerticalDivider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                                Text(passPhrases[index]),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

//Seperating the Phrases View
class PassPhrasesSection extends StatelessWidget {
  const PassPhrasesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                height: 40,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 2.0, color: const Color(0xffffffff)),
                ),
                child: Row(
                  children: [
                    Text(passNumbers.first),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(passPhrases.first),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
