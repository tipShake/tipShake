import 'dart:io';

import 'package:app/misc/controllers.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../misc/strings.dart';

class onboardScreen extends StatefulWidget {
  const onboardScreen({Key? key}) : super(key: key);

  @override
  State<onboardScreen> createState() => _onboardScreenState();
}

class _onboardScreenState extends State<onboardScreen> {
  File? image;
  bool termsAccepted = false;
  bool imageSelected = false;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future pickGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  var _result;

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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: PageView(
          controller: onboardController,
          children: [
//Page 1 - Get User Picture
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (imageSelected == false) {
                      imageSelected = true;

                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 150,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    pickImage();
                                  },
                                  trailing: Icon(Icons.camera_alt),
                                  title: Text('Take A Picture'),
                                ),
                                ListTile(
                                  onTap: (() {
                                    pickGallery();
                                  }),
                                  trailing: Icon(Icons.photo),
                                  title: Text('Browse The Gallery'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      imageSelected = false;
                    }
                  },
                  child: image != null
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff9b9b9b),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                border: Border.all(
                                    width: 5.0, color: const Color(0xffffffff)),
                              ),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: Image.file(image!).image,
                              ),
                            ),
                            Positioned(
                                bottom: -18,
                                child: SvgPicture.asset(Strings.tsIcon))
                          ],
                        )
                      : CircleAvatar(
                          maxRadius: 80,
                          child: Text('Choose New Photo?'),
                        ),
                ),
              ],
            ),

//Page 2 - Get User Handle
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Place Holder Image

                //tipshake ID
                ListTile(
                  // leading: Text('This is the leading'),
                  title: Row(
                    children: const [
                      Text(
                        'create your tip\$hake ID',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  subtitle: TextField(
                    onSubmitted: (String value) async {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.done,
                    controller: usrTipidController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hintText: 'GlobaliD Handle',
                      hintStyle: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 15,
                        color: Color(0x77000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
//Page 3 - Get User Number
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Place Holder Image

                //tipshake ID
                ListTile(
                  // leading: Text('This is the leading'),
                  title: Row(
                    children: const [
                      Text(
                        'Enter your phone number',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  subtitle: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    onSubmitted: (String value) async {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.done,
                    controller: usrNumberController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hintText: '000-000-0000',
                      hintStyle: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 15,
                        color: Color(0x77000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: false),
                  ),
                ),
              ],
            ),
//Page 4 - Get User Prefered Email Address
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Place Holder Image

                ListTile(
                  // leading: Text('This is the leading'),
                  title: Row(
                    children: const [
                      Text(
                        'enter your email address',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  subtitle: TextField(
                    onSubmitted: (String value) async {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.done,
                    controller: usrEmailController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hintText: 'tipshake@outlook.com',
                      hintStyle: const TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 15,
                        color: Color(0x77000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
//Page 5 - Get User Acceptance
            Column(
              children: [
                //Legal Image
                SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: SvgPicture.asset(Images.Legal)),
                //TipShake Logo Icon
                SvgPicture.asset(Logos.TipShakeBlack),
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(
                  width: 325,
                  child: Column(
                    children: const [
                      Text(
                        'LEGAL',
                        style: TextStyle(
                          fontFamily: 'Acumin Pro',
                          fontSize: 16,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 3,
                          shadows: [
                            Shadow(
                              color: Color(0x29000000),
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
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      ExpansionTile(
                        title: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 16,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              )
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        children: [Text('Some Important Text Will Go Here')],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      ExpansionTile(
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 16,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              )
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        children: [Text('Some Important Text Will Go Here')],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

//BottomBar
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Accept
                    ElevatedButton(
                      onPressed: () {
                        termsAccepted = true;
                        onboardController.nextPage(
                            duration: const Duration(microseconds: 3),
                            curve: Curves.easeInBack);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 16,
                            color: Color(0xff6d7278),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          fixedSize:
                              MaterialStateProperty.all(const Size(165, 59)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),

                    //Deny Button
                    ElevatedButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey,
                              content: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Divider(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    Strings.deniedMessage,
                                    style: TextStyle(
                                      fontFamily: 'Acumin Pro',
                                      fontSize: 20,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                      height: 1.45,
                                      shadows: [
                                        Shadow(
                                          color: Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        )
                                      ],
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(Icons.book),
                                  Divider(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text(
                          'Deny',
                          style: TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 16,
                            color: Color(0xff6d7278),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          fixedSize:
                              MaterialStateProperty.all(const Size(165, 59)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
//Page 6 - Select Bill
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Choose Your Bill'),
                      RadioListTile(
                          title: SvgPicture.asset(Bills.Green),
                          value: 1,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
                      RadioListTile(
                          title: SvgPicture.asset(
                            Bills.Pink,
                          ),
                          value: 2,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
                      RadioListTile(
                          title: SvgPicture.asset(Bills.Purple),
                          value: 3,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
                      RadioListTile(
                          title: SvgPicture.asset(Bills.Silver),
                          value: 4,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
//Page 7 - Wallet Options
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  overflowButtonSpacing: 20,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onboardController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: const Size(330, 65),
                      ),
                      child: Text(
                        'Connect Xumm Wallet',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff4270b7),
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
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
                        'Setup Paid Wallet',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff4270b7),
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ],
                )
              ],
            ),
//Page 8 - Fund Account
            Scaffold(
              body: Column(
                children: [
                  const SizedBox(width: double.infinity),
//Xumm Wallet Connection Status
                  Container(
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff00a887)),
                    ),
                    child: const Center(
                      child: Text(
                        'Xumm Wallet Connected',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          height: 1,
                          shadows: [
                            Shadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
//Spacing
                  const SizedBox(
                    height: 25,
                  ),
//XRP Text/Logo Stack
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Acumin Pro',
                            fontSize: 20,
                            color: Color(0xff1e4579),
                            height: 1.5,
                          ),
                          children: const [
                            TextSpan(
                              text: 'How much',
                            ),
                            TextSpan(
                              text: ' XRP',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' would you like to add\nto your                      wallet?',
                            ),
                          ],
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                      Positioned(
                        bottom: -5,
                        child: SvgPicture.asset(Logos.TipShakeRed),
                      ),
                    ],
                  ),
//XRP Amount
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 57,
                        color: const Color(0xffffffff),
                        height: 1.425,
                        shadows: const [
                          Shadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      children: [
                        TextSpan(
                          text: fundingController.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: 'XRP',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
//Spacing
                  const SizedBox(
                    height: 25,
                  ),
//KeyPad
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '1';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '2';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '3';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '4';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '5';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '6';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '7';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '8';
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
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '9';
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
                                  shape:
                                      const CircleBorder(side: BorderSide.none),
                                  primary: const Color(0xff1E4579),
                                ),
                                onPressed: () {
                                  setState(() {
                                    fundingController.text += '.';
                                  });
                                },
                                child: const Icon(Icons.circle)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromRadius(35),
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                primary: const Color(0xff1E4579),
                              ),
                              onPressed: () {
                                setState(() {
                                  fundingController.text += '0';
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
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    fundingController.clear();
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
//Fund Button
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homeScreen(
                                username: usrTipidController.text,
                                accountbalance: fundingController.text,
                                email: usrEmailController.text,
                                phonenumber: usrNumberController.text,
                                userpic: image!.path,
                              ),
                            ),
                          );
                        },
                        icon: const Text('fund account'),
                        label: const Icon(Icons.monetization_on)),
                  ),
                ],
              ),
            ),
//Page 9
          ],
        ),
      ),
    );
  }
}
