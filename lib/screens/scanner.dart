import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../misc/strings.dart';
import 'contacts.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

MobileScannerController cameraController = MobileScannerController();

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 150,
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
        ),
        body: Stack(
          children: [
//THE actual camera portion
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contacts(),
                      ));
                }),
            //Overlay Design
            Center(
              child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
//Leave Alone Just Matches The Top Widget
                  Positioned(
                    top: 46,
                    left: 42,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Bills.Silver,
                        height: 225,
                        width: 500,
                      ),
                    ),
                  ),
//Leave Alone Just Matches The Top Widget
                  Positioned(
                    top: 22,
                    left: 20,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Bills.Silver,
                        height: 225,
                        width: 500,
                      ),
                    ),
                  ),
//Top Widget/Bill
                  Draggable(
                    feedback: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Bills.Silver,
                        height: 225,
                        width: 500,
                      ),
                    ),
                    childWhenDragging: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Bills.Silver,
                        height: 220,
                        width: 490,
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        Bills.Silver,
                        height: 225,
                        width: 500,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ));
  }
}

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    // // Changing the size of scanner cutout dependent on the device size.
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 330.0;
    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
            overlayColour, BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: scanArea,
                width: scanArea,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          foregroundPainter: BorderPainter(),
          child: SizedBox(
            width: scanArea + 25,
            height: scanArea + 25,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
