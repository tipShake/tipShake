import 'package:app/screens/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

import '../misc/strings.dart';

class TipInteractive extends StatefulWidget {
  const TipInteractive({
    Key? key,
  }) : super(key: key);

  final whototip = 'User Selected Goes Here';
  @override
  State<TipInteractive> createState() => _TipInteractiveState();
}

MobileScannerController cameraController = MobileScannerController();

class _TipInteractiveState extends State<TipInteractive> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 155,
        automaticallyImplyLeading: true,
        leading: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
//User Picture
            CircleAvatar(),
            Positioned(
              left: 60,
              bottom: 60,
              child: Row(
                children: [
//Rignt Angle
                  SvgPicture.asset(
                    Shapes.rightAngle,
                    height: 30,
                    clipBehavior: Clip.none,
                  ),
//USD Amount
                  Text(
                    ' \$00.00',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro',
                      fontSize: 35,
                      color: const Color(0xff4270b7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
//LogoIccon
            Positioned(
              bottom: -15,
              left: 5,
              child: SvgPicture.asset(
                Strings.t$Big,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
//XRP Amount
        title: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Text(
            '0.000000 XRP',
            style: TextStyle(
              fontFamily: 'Acumin Pro',
              fontSize: 16,
              color: const Color(0xff4270b7),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        bottom: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(),
              Text(widget.whototip),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Buttons.Scan,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
//Tipping Amount Area
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              bottom: 10,
              right: 30,
              child: SvgPicture.asset(
                Shapes.tipAngle,
              )),
          Positioned(
            bottom: 10,
            left: 100,
            child: Text(
              'tipping',
              style: TextStyle(
                fontFamily: 'AcuminPro-Regular',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.5714285714285714,
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
          ),
          Positioned(
            bottom: -20,
            right: 80,
            child: Text(
              '0.0 XRP',
              style: TextStyle(
                fontFamily: 'Acumin Pro',
                fontSize: 40,
                color: const Color(0xffffffff),
                letterSpacing: 0.43999999999999995,
                fontWeight: FontWeight.w600,
                height: 0.575,
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
        ],
      ),
      body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
    );
  }

//What's shown when the camera opens. It's just  a sphere!
  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
      geometry: ARKitSphere(radius: 0.1),
    );
    this.arkitController.add(node);
  }
}



// //STATIC BILLS + Tap Functions
// Stack(
//           children: [
// //THE actual camera portion
//             MobileScanner(
//                 allowDuplicates: false,
//                 controller: cameraController,
//                 onDetect: (barcode, args) {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Contacts(),
//                       ));
//                 }),
//             //Overlay Design
//             Center(
//               child: Stack(
//                 fit: StackFit.loose,
//                 clipBehavior: Clip.none,
//                 children: [
// //Leave Alone Just Matches The Top Widget
//                   Positioned(
//                     top: 46,
//                     left: 42,
//                     child: RotatedBox(
//                       quarterTurns: 1,
//                       child: SvgPicture.asset(
//                         Bills.Silver,
//                         height: 225,
//                         width: 500,
//                       ),
//                     ),
//                   ),
// //Leave Alone Just Matches The Top Widget
//                   Positioned(
//                     top: 22,
//                     left: 20,
//                     child: RotatedBox(
//                       quarterTurns: 1,
//                       child: SvgPicture.asset(
//                         Bills.Silver,
//                         height: 225,
//                         width: 500,
//                       ),
//                     ),
//                   ),
// //Top Widget/Bill
//                   Draggable(
//                     feedback: RotatedBox(
//                       quarterTurns: 1,
//                       child: SvgPicture.asset(
//                         Bills.Silver,
//                         height: 225,
//                         width: 500,
//                       ),
//                     ),
//                     childWhenDragging: RotatedBox(
//                       quarterTurns: 1,
//                       child: SvgPicture.asset(
//                         Bills.Silver,
//                         height: 220,
//                         width: 490,
//                       ),
//                     ),
//                     child: RotatedBox(
//                       quarterTurns: 1,
//                       child: SvgPicture.asset(
//                         Bills.Silver,
//                         height: 225,
//                         width: 500,
//                       ),
//                     ),
//                   ),
