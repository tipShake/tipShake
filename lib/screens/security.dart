import 'package:app/misc/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
//Title
          title: Row(
            children: [
              Icon(Icons.fingerprint),
              Text(
                'Protect profile & wallet',
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
//Bottom Content
        ),
//Bottom Content
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
//Top ^ Helps with Spacing width Bottom is start of content
            Text(
              'security',
              style: TextStyle(
                fontFamily: 'Acumin Pro',
                fontSize: 18,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 8.277777777777779,
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
//Selections

            Divider(
              thickness: .8,
              color: Colors.white,
              indent: 18,
              endIndent: 18,
            ),
//Enable Passcode
            SwitchListTile(
              title: Text(
                'Enable Passcode',
              ),
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
//Enable Face ID
            SwitchListTile(
              title: Text(
                'Enable FaceID',
              ),
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
//Backup Wallet
            ListTile(
              onTap: () {},
              title: Text(
                'Backup your Wallet',
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
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
                softWrap: false,
              ),
              trailing: Icon(Icons.wallet),
            ),
//Wallet Types
            Text(
              'Wallet type',
              style: TextStyle(
                fontFamily: 'Acumin Pro',
                fontSize: 18,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 8.277777777777779,
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size(330, 65),
              ),
              child: Text(
                'Public Wallet',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Color(0xff4270b7),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size(330, 65),
              ),
              child: Text(
                'Private Wallet',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Color(0xff4270b7),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 35,
            ),
            SvgPicture.asset(Logos.TipShakeBlack),
          ],
        ),
      ),
    );
  }
}

class ActivateWallet extends StatelessWidget {
  const ActivateWallet({Key? key}) : super(key: key);

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
      ),),
     
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Activate Wallet',
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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size(330, 65),
              ),
              child: Text(
                'Request New Paid Wallet',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Color(0xff4270b7),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
