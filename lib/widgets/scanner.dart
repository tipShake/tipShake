import 'dart:async';

import 'package:app/tipping/tipping.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class Scanner extends StatefulWidget {
  @override
  ScannerState createState() {
    return new ScannerState();
  }
}

class ScannerState extends State<Scanner> {
  String result = "Scan your shakers code";

  Future _scanQR() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult as String;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff23242f),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

              //Description
              Text(
                'Show this Code to another Tipper',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: _scanQR,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff689680),
                  ),
                  child: Text("Scan Shake Code")),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff689680),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => moneyswipe()));
                  },
                  child: Text('Start Tipping'))
            ],
          ),
        ));
  }
}
