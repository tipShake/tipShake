import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../misc/strings.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: Text(
            'Tippers',
            style: TextStyle(
              fontFamily: 'Acumin Pro',
              fontSize: 24,
              color: const Color(0xff4270b7),
              letterSpacing: 0.3119999771118164,
              fontWeight: FontWeight.w700,
              height: 1.3333333333333333,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
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
        body: ListView.builder(
          itemCount: UserNames.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Container(),
                    ));
              },
              child: ListTile(
                //User Avatar
                leading: CircleAvatar(
                  radius: 25,
                ),
                //User Name
                title: Text(
                  UserNames[index],
                ),
                //TipID
                subtitle: Text(
                  '!${TipIds[index]}',
                ),
                //TS Icon
                trailing: SvgPicture.asset(Strings.tipIcon),
              ),
            );
          },
        ),
      ),
    );
  }
}
