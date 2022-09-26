import 'package:app/widgets/tipavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../misc/intergers.dart';
import '../misc/strings.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,

          title: Text(
            'History',
            style: TextStyle(
              fontFamily: 'Acumin Pro',
              fontSize: 24,
              color: const Color(0xff4270b7),
              letterSpacing: 0.3119999771118164,
              fontWeight: FontWeight.w700,
            ),
          ),
//SearchField
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border:
                        Border.all(width: 2.0, color: const Color(0xffffffff)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter or Scan Users !TipiD',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0x80000000),
                        ),
                        icon: Icon(
                          Icons.search,
                          color: Color(0x80000000),
                        ),
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  Buttons.Scan,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Logos.XRP),
                  Text(
                    'Market Value {XRP}',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 25,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.114,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Market Balance
                Text(
                  '\$' + Numbers.marketValue.toString(),
                  style: TextStyle(
                    fontFamily: 'Acumin Pro',
                    fontSize: 25,
                    color: const Color(0xff375542),
                    letterSpacing: 0.18,
                    height: 0.9666666666666667,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                  softWrap: false,
                ),
                //Divider
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50,
                    width: 1,
                    child: SvgPicture.string(
                      '<svg viewBox="171.0 207.4 1.0 73.9" ><path transform="translate(171.02, 207.4)" d="M 0 0 L 0 73.88081359863281" fill="none" stroke="#ffffff" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //High/Low Indicatiors
                Column(
                  children: [
                    Icon(Icons.arrow_drop_up),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                Text(
                  '0.00%',
                  style: TextStyle(
                    fontFamily: 'Acumin Pro',
                    fontSize: 28,
                    color: const Color(0xff375542),
                    letterSpacing: 0.168,
                    height: 0.9642857142857143,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                  softWrap: false,
                ),
              ],
            ),
            Divider(
              thickness: 5,
            ),
            // Recent Tippers
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: UserNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
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
//Start of Bottom Content
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            UserNames.elementAt(index),
                                            style: TextStyle(
                                              fontFamily: 'Acumin Pro',
                                              fontSize: 16,
                                              color: const Color(0xffffffff),
                                              fontWeight: FontWeight.w700,
                                              shadows: [
                                                Shadow(
                                                  color:
                                                      const Color(0x29000000),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                )
                                              ],
                                            ),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'connect',
                                              style: TextStyle(
                                                fontFamily: 'Acumin Pro',
                                                fontSize: 16,
                                                color: const Color(0xff1e4579),
                                                fontWeight: FontWeight.w700,
                                                height: 3,
                                              ),
                                              textHeightBehavior:
                                                  TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                          false),
                                              textAlign: TextAlign.center,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //TODO Add Picture to Dummy Profiles
                                      CircleAvatar(
                                        radius: 65,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "!${TipIds.elementAt(index)}",
                                            style: TextStyle(
                                              fontFamily: 'Acumin Pro',
                                              fontSize: 16,
                                              color: const Color(0xffffffff),
                                              fontWeight: FontWeight.w700,
                                              shadows: [
                                                Shadow(
                                                  color:
                                                      const Color(0x29000000),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                )
                                              ],
                                            ),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                          TextButton(
                                            onPressed: () {},

                                            ///TODO ADD String to strings object
                                            child: Image.asset(
                                                'assets/buttons/quicktipbtn.png'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
//Bill
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Bills.Green,
                                          width: 330,
                                          height: 145,
                                        ),
                                      ],
                                    ),
                                  ),
//History Selector
                                  Container(
                                    width: double.infinity,
                                    color: const Color(0xff1e4579),
                                    child: ListTile(
                                      title: Text(
                                        '11/04/2022',
                                        style: TextStyle(
                                          fontFamily: 'Acumin Pro',
                                          fontSize: 20,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.arrow_forward_ios)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ///TODO Finish Bottom
                                    ],
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    child: ListTile(
                      //User Name
                      title: Text(
                        UserNames[index],
                        style: TextStyle(
                          fontFamily: 'Acumin Pro',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.096,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),

                      //TipID
                      subtitle: Text(
                        '!${TipIds[index]}',
                      ),
                      //User Avatar
                      leading: const CircleAvatar(),
                      trailing: Text(
                        '${RecentTips[index]}',
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              thickness: 5,
            ),
            //tipshake logo
            SizedBox(
              height: 65,
            ),
            SvgPicture.asset(
              Logos.TipShakeBlack,
              width: 65,
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
