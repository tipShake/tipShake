import 'package:app/widgets/scanner.dart';
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
      ),
      body: Center(
          child: Column(
        children: [
          //Description
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
            height: 30,
          ),
          //Description
          Text(
            'Show your Code to another Tipper',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 16,
              color: Color(0xffffffff),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scanner()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff689680),
              ),
              child: Text("START TIPPING")),
          SizedBox(
            height: 5,
          ),
        ],
      )));
}
