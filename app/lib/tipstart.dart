import 'package:app/myqr.dart';
import 'package:flutter/material.dart';

class tipstart extends StatefulWidget {
  const tipstart({Key? key}) : super(key: key);

  @override
  _tipstartState createState() => _tipstartState();
}

class _tipstartState extends State<tipstart> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xff23242f),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF23242F),
        toolbarHeight: 90,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 280,
            width: 280,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/qrscanner.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //Description
          SizedBox(
            height: 5,
          ),
          Text(
            'Scan your Shakers Code',
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

          //Button
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xff689680),
              ),
              child: Text("START TIPPING")),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myqr()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff689680),
              ),
              child: Text("MY SHAKERS CODE")),
        ],
      )));
}
