import 'package:app/tipsuccess.dart';
import 'package:flutter/material.dart';

class myqr extends StatefulWidget {
  const myqr({Key? key}) : super(key: key);

  @override
  _myqrState createState() => _myqrState();
}

class _myqrState extends State<myqr> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xff23242f),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF23242F),
        toolbarHeight: 50,
      ),
      body: Center(
        child: Column(
          children: [
            //Qr Code
            SizedBox(
              height: 30,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/placeholderqr.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            //Description
            Text(
              'Show your Code to another Tipper',
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
            SizedBox(
              height: 35,
            ),
            //Button
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff689680),
                ),
                child: Text("START TIPPING")),
            //Button
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tipconfirm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff689680),
                ),
                child: Text("Show Success")),
          ],
        ),
      ));
}
