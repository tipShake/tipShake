import 'package:app/misc/controllers.dart';
import 'package:app/screens/contacts.dart';
import 'package:app/screens/history.dart';
import 'package:app/screens/scanner.dart';
import 'package:app/screens/settings.dart';
import 'package:app/screens/tipping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../misc/strings.dart';
import '../widgets/tipavatar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen(
      {Key? key,
      required this.username,
      required this.accountbalance,
      required this.email,
      required this.phonenumber,
      required this.userpic,
      required this.pickedbill,
      required this.dailylimit,
      required this.tippedtoday,
      required this.totalusd,
      required this.marketvalue,
      required this.marketvaluechange,
      required this.tiplimit})
      : super(key: key);

  final String username;
  final String accountbalance;
  final String email;
  final String phonenumber;
  final String userpic;
  final String pickedbill;
  final String dailylimit;
  final String tippedtoday;
  final String totalusd;
  final String marketvalue;
  final String marketvaluechange;
  final String tiplimit;

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    dailylimitController.text = widget.dailylimit;
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
//User Profile Picture
          title: Text(
            '!${widget.username}',
            style: const TextStyle(
              fontFamily: 'Acumin Pro',
              fontSize: 14,
              color: Color(0xff4d5858),
              fontWeight: FontWeight.w700,
              height: 1.4285714285714286,
            ),
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
//Navigation Bar
        bottomNavigationBar: BottomAppBar(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Contacts
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contacts(),
                      ));
                },
                child: SvgPicture.asset(Buttons.Contacts),
              ),
//Scan QR
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scanner(),
                      ));
                },
                child: SvgPicture.asset(Buttons.Scan),
              ),
//Home/Quick Tip
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasicTip(),
                      ));
                },
                onLongPress: () {
                  setState(() {});
                },
                child: SvgPicture.asset(Buttons.Home),
              ),
//Show My QR
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    elevation: 5,
                    isDismissible: true,
                    enableDrag: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 490,
                        decoration: BoxDecoration(
                          color: const Color(0xe54270b7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: Column(
                          children: [
//User Data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('No Name Given'),
                                TipAvatar(
                                  userpic: widget.userpic,
                                  size: 130,
                                ),
                                Text(widget.username),
                              ],
                            ),
//Bottom Content
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: (() {}),
                                  icon: Icon(
                                    Icons.download,
                                    size: 50,
                                  ),
                                ),
                                QrImage(
                                  data:
                                      'This QR code has an embedded image as well',
                                  version: QrVersions.auto,
                                  size: 200,
                                  gapless: false,
                                  embeddedImage: AssetImage(
                                      'assets/logos/tipshake_qr.png'),
                                  embeddedImageStyle: QrEmbeddedImageStyle(
                                    size: Size(50, 50),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.ios_share,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: SvgPicture.asset(Buttons.ShowQR),
              ),
//Settings/Profile
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          userpic: widget.userpic,
                        ),
                      ));
                },
                child: SvgPicture.asset(Buttons.Settings),
              ),
            ],
          ),
        ),
//Navigation Bar - End
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //NFT | User Avatar | History
              Row(
                children: [
                  SizedBox(
                    width: 168,
                  ),
                  //Avatar + Create NFT
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      TipAvatar(
                        userpic: widget.userpic,
                        size: 110,
                      ),
                      //Create NFT Button
                      Positioned(
                        top: 75,
                        right: 125,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                          ),
                          onPressed: () {},
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(Buttons.CreateNFT),
                              const Text(
                                'create\nNFT',
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 12,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                      ), //User Avatar
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //History Button
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                        iconSize: 45,
                        icon: const Icon(Icons.history),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => History(),
                              ));
                        },
                      ),
                      Container(
                        height: 7.5,
                        width: 7.5,
                        decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              //Words of the Day?
              Text(
                'Random Word Of The Day',
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontSize: 30,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Quick Look Data
              Container(
                width: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(width: 2.0, color: const Color(0xffffffff)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Crypto Amount + Select
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 40,
                                  color: Color(0xffffffff),
                                  height: 1.6,
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.accountbalance,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 35),
                                  ),
                                  TextSpan(
                                    text: 'XRP',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            )
                          ],
                        ),
                        //XRP Logo
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                              Logos.XRP,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        //Bottom Card Content
                        //Market Value
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Market Value',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 15,
                                color: Color(0xff1e4579),
                                fontWeight: FontWeight.w300,
                                height: 2.1333333333333333,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            ///Market Value Change
                            Text(
                              '${widget.marketvaluechange}%',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 15,
                                color: Color(0xffe31414),
                                fontWeight: FontWeight.w500,
                                height: 2.1333333333333333,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),

                            Spacer(),

                            ///Market Value
                            Text(
                              '\$${widget.marketvalue}',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 18,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.7777777777777777,
                                shadows: [
                                  Shadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 1),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ],
                        ),
                        //Total USD
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 15,
                                  color: Color(0xff1e4579),
                                  height: 2.1333333333333333,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Total',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'USD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            Spacer(),
                            Text(
                              '\$${widget.totalusd}',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 18,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.7777777777777777,
                                shadows: [
                                  Shadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 1),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ],
                        ),
                        //Amount Tipped Today
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 15,
                                  color: Color(0xff1e4579),
                                  height: 0.9333333333333333,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Amount tipped today',
                                  ),
                                  TextSpan(
                                    text: ':   ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            Spacer(),
                            Text(
                              '\$${widget.tippedtoday}',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 18,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.7777777777777777,
                                shadows: [
                                  Shadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 1),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ],
                        ),
                        //Daily Limit
                        Row(
                          children: [
                            Text(
                              'Daily limit',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 15,
                                color: Color(0xff1e4579),
                                height: 2.1333333333333333,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            Spacer(),
                            Text(
                              '\$${widget.dailylimit}',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro',
                                fontSize: 18,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.7777777777777777,
                                shadows: [
                                  Shadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 1),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //TipShake Bill Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0x40ffffff),
                        border: Border.all(
                            width: 0.5, color: const Color(0xffffffff)),
                      ),
                    ),
                    SvgPicture.asset(
                      widget.pickedbill,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              //Button Row - Change Tip + Change Swipe
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  //Change Daily Tipping Limit
                  SizedBox(
                    width: 160,
                    height: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          elevation: 5,
                          isDismissible: true,
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  height: 730,
                                  child: Scaffold(
                                    body: Column(
                                      children: [
                                        //Setting Your Daily Tipping Limit
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Logos.XRP,
                                                color: Colors.black38,
                                                width: 30,
                                                height: 30,
                                              ),
                                              Text(
                                                'Set your daily tipping limit',
                                                style: TextStyle(
                                                  fontFamily: 'Acumin Pro',
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff1e4579),
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.6,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Current Limit
                                        Divider(
                                          color: Colors.blue,
                                          thickness: .7,
                                          indent: 100,
                                          endIndent: 100,
                                        ),
                                        Text(
                                          'CURRENT LIMIT: \$${widget.dailylimit} USD',
                                          style: TextStyle(
                                            fontFamily: 'Acumin Pro',
                                            fontSize: 14,
                                            color: const Color(0xff4270b7),
                                            height: 1.1428571428571428,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.center,
                                          softWrap: false,
                                        ),
                                        //XRP Balance
                                        Text(
                                          "${widget.accountbalance} XRP",
                                          style: TextStyle(
                                            fontFamily: 'Acumin Pro',
                                            fontSize: 14,
                                            color: const Color(0xff4270b7),
                                            height: 1.1428571428571428,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.center,
                                          softWrap: false,
                                        ),
                                        Divider(
                                          color: Colors.blue,
                                          thickness: .7,
                                          indent: 100,
                                          endIndent: 100,
                                        ),
                                        //Bottom Content Keypad
                                        Column(
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                style: TextStyle(
                                                  fontFamily: 'Acumin Pro',
                                                  fontSize: 83,
                                                  color:
                                                      const Color(0xff1e4579),
                                                  height: 1.6024096385542168,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '\$',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: dailylimitController
                                                        .text,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textHeightBehavior:
                                                  TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                              softWrap: false,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${widget.accountbalance}XRP',
                                                  style: TextStyle(
                                                    fontFamily: 'Acumin Pro',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff4270b7),
                                                    height: 2.2857142857142856,
                                                  ),
                                                  textHeightBehavior:
                                                      TextHeightBehavior(
                                                          applyHeightToFirstAscent:
                                                              false),
                                                  textAlign: TextAlign.right,
                                                  softWrap: false,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  //123
                                                  ButtonBar(
                                                    alignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '1';
                                                          });
                                                        },
                                                        child: const Text(
                                                          '1',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '2';
                                                          });
                                                        },
                                                        child: Text(
                                                          '2',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '3';
                                                          });
                                                        },
                                                        child: Text(
                                                          '3',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //456
                                                  ButtonBar(
                                                    alignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '4';
                                                          });
                                                        },
                                                        child: Text(
                                                          '4',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '5';
                                                          });
                                                        },
                                                        child: const Text(
                                                          '5',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '6';
                                                          });
                                                        },
                                                        child: const Text(
                                                          '6',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //789
                                                  ButtonBar(
                                                    alignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '7';
                                                          });
                                                        },
                                                        child: Text(
                                                          '7',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '8';
                                                          });
                                                        },
                                                        child: Text(
                                                          '8',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '9';
                                                          });
                                                        },
                                                        child: Text(
                                                          '9',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //0
                                                  ButtonBar(
                                                    alignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize: const Size
                                                                .fromRadius(35),
                                                            shape: const CircleBorder(
                                                                side: BorderSide
                                                                    .none),
                                                            primary:
                                                                const Color(
                                                                    0xff1E4579),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              dailylimitController
                                                                  .text += '.';
                                                            });
                                                          },
                                                          onLongPress: () {
                                                            setState(() {
                                                              dailylimitController
                                                                  .clear();
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.circle,
                                                          )),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: const Size
                                                              .fromRadius(35),
                                                          shape:
                                                              const CircleBorder(
                                                                  side:
                                                                      BorderSide
                                                                          .none),
                                                          primary: const Color(
                                                              0xff1E4579),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            dailylimitController
                                                                .text += '0';
                                                          });
                                                        },
                                                        child: Text(
                                                          '0',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 48,
                                                            color: Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.1875,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize: const Size
                                                                .fromRadius(40),
                                                            shape: const CircleBorder(
                                                                side: BorderSide
                                                                    .none),
                                                            primary: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('cancel')),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        //Update Button
                                        Container(
                                          child: Center(
                                            child: TextButton(
                                              onPressed: () {
                                                setState() {}

                                                print(widget.dailylimit);

                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'UPDATE',
                                                style: TextStyle(
                                                  fontFamily: 'Acumin Pro',
                                                  fontSize: 16,
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          height: 50,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff4270b7),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(31.0),
                                              topRight: Radius.circular(31.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0x29000000),
                                                offset: Offset(0, 3),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff4270b7),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //XRP Icon
                          Row(
                            children: [
                              SvgPicture.asset(
                                Logos.XRP,
                                width: 35,
                                height: 35,
                              ),
                            ],
                          ),
                          //Text 1
                          Row(
                            children: const [
                              Text(
                                'Daily tipping limit',
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  height: 1.4285714285714286,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                          //Text 2
                          Row(
                            children: const [
                              Text(
                                'Set your daily tipping limit',
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 10,
                                  color: Color(0xffffffff),
                                  height: 1.4545454545454546,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Change Swipe Amount
                  SizedBox(
                    width: 192,
                    height: 90,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff4270b7))),
                      onPressed: () {
                        SwipeAmountKeyPad(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Swipe Amount Button Icon
                          Row(
                            children: [
                              SvgPicture.asset(
                                Buttons.SwipeAmount,
                                width: 25,
                                height: 25,
                              )
                            ],
                          ),
                          //Swipe Amount Button Title
                          Row(
                            children: const [
                              Text(
                                'Change Swipe Amount',
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  height: 1.4285714285714286,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                          //Swipe Amount Button SubTitle
                          Row(
                            children: const [
                              Text(
                                'Select your default tip amount',
                                style: TextStyle(
                                  fontFamily: 'Acumin Pro',
                                  fontSize: 10,
                                  color: Color(0xffffffff),
                                  height: 1.4545454545454546,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SwipeAmountKeyPad(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext contex, StateSetter setState) {
          return SizedBox(
            height: 730,
            child: Scaffold(
              body: Column(
                children: [
//Setting Your Swipe Amount
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Buttons.SwipeAmount,
                          color: Colors.black38,
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          'Set your default swipe amount',
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 20,
                            color: const Color(0xff1e4579),
                            fontWeight: FontWeight.w700,
                            height: 1.6,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
//Current Limit
                  Divider(
                    color: Colors.blue,
                    thickness: .7,
                    indent: 100,
                    endIndent: 100,
                  ),
                  Text(
                    'CURRENT LIMIT: \$${widget.tiplimit} USD',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 14,
                      color: const Color(0xff4270b7),
                      height: 1.1428571428571428,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
//XRP Balance
                  Text(
                    "${widget.accountbalance} XRP",
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 14,
                      color: const Color(0xff4270b7),
                    ),
                  ),
                  Divider(
                    color: Colors.blue,
                    thickness: .7,
                    indent: 100,
                    endIndent: 100,
                  ),
                  //Bottom Content Keypad
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 83,
                            color: const Color(0xff1e4579),
                            height: 1.6024096385542168,
                          ),
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: tiplimitController.text,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.accountbalance}XRP',
                            style: TextStyle(
                              fontFamily: 'Acumin Pro',
                              fontSize: 14,
                              color: const Color(0xff4270b7),
                              height: 2.2857142857142856,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
//123
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '1';
                                    });
                                  },
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '2';
                                    });
                                  },
                                  child: Text(
                                    '2',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '3';
                                    });
                                  },
                                  child: Text(
                                    '3',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                              ],
                            ),
//456
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '4';
                                    });
                                  },
                                  child: Text(
                                    '4',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '5';
                                    });
                                  },
                                  child: const Text(
                                    '5',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '6';
                                    });
                                  },
                                  child: const Text(
                                    '6',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                              ],
                            ),
//789
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '7';
                                    });
                                  },
                                  child: Text(
                                    '7',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '8';
                                    });
                                  },
                                  child: Text(
                                    '8',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '9';
                                    });
                                  },
                                  child: Text(
                                    '9',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                              ],
                            ),
//0
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size.fromRadius(35),
                                      shape: const CircleBorder(
                                          side: BorderSide.none),
                                      primary: const Color(0xffdbd499),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        tiplimitController.text += '.';
                                      });
                                    },
                                    onLongPress: () {
                                      setState(() {
                                        tiplimitController.clear();
                                      });
                                    },
                                    child: const Icon(Icons.circle)),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size.fromRadius(35),
                                    shape: const CircleBorder(
                                        side: BorderSide.none),
                                    primary: const Color(0xffdbd499),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      tiplimitController.text += '0';
                                    });
                                  },
                                  child: Text(
                                    '0',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 48,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                      height: 1.1875,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size.fromRadius(40),
                                      shape: const CircleBorder(
                                          side: BorderSide.none),
                                      primary: Colors.red,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('cancel')),
                              ],
                            ),
//Update

                            Container(
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    setState() {
                                      tiplimitController.text +=
                                          widget.tiplimit;
                                    }

                                    print(widget.tiplimit);

                                    Navigator.pop(context);
                                  },
//Update Text

                                  child: Text(
                                    'UPDATE',
                                    style: TextStyle(
                                      fontFamily: 'Acumin Pro',
                                      fontSize: 16,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xff4270b7),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(31.0),
                                  topRight: Radius.circular(31.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
