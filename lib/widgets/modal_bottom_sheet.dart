import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowQr extends StatefulWidget {
  const ShowQr({Key? key}) : super(key: key);

  @override
  State<ShowQr> createState() => _ShowQrState();
}

class _ShowQrState extends State<ShowQr> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: const BoxDecoration(color: Color(0xff292626)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Just for spacing
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                      //First Row -Name -Profile Pic -Tipid!
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //User Name Here
                          Text(
                            'Kenan Lee',
                            style: GoogleFonts.poppins(
                                color: const Color(0xffffffff),
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1),
                          ),
                          //User Image Here
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              //Background of Avatar Pic
                              backgroundColor: Color(0xffFF8000),
                              radius: 50,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/3755708/pexels-photo-3755708.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3755708.jpg&fm=jpg'),
                              ),
                            ),
                          ),
                          //User TipID Here
                          Text(
                            '!BigTipperLee',
                            style: GoogleFonts.poppins(
                                color: const Color(0xffffffff),
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1),
                          ),
                        ],
                      ),
                      //Just for spacing
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 180,
                            width: 180,
                            child: Image(
                                image: AssetImage('assets/images/QRCode.png')),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      //Just for spacing
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                      //Show Code Message
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Show This Code To Tipper',
                            style: GoogleFonts.poppins(
                                color: const Color(0xffffffff),
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1),
                          )
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                );
              });
        },
        icon: const Icon(Icons.qr_code));
  }
}
