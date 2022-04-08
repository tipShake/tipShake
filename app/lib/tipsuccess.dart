import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class tipconfirm extends StatefulWidget {
  const tipconfirm({Key? key}) : super(key: key);

  @override
  _tipconfirmState createState() => _tipconfirmState();
}

class _tipconfirmState extends State<tipconfirm> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xff23242f),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF23242F),
        toolbarHeight: 50,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/userI.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 5.0, color: const Color(0xffffffff)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Success Message
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Success',
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 28,
                      color: const Color(0xffffffff),
                      height: 1.2857142857142858,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Money Transferred Succefully  \n🤑 Go Make it Shake',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      height: 1.5,
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
              )
            ],
          ),

          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '\$140.55',
                    style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 32,
                      color: const Color(0xffffffff),
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  Text(
                    'Transfer Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      height: 1.5,
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

          //Button
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xff689680),
              ),
              child: Text("START TIPPING")),
        ],
      ));
}
