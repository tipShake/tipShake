import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/integers.dart';

class TipSuccess extends StatefulWidget {
  const TipSuccess({Key? key}) : super(key: key);

  @override
  State<TipSuccess> createState() => _TipSuccessState();
}

class _TipSuccessState extends State<TipSuccess> {
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
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 125,
            //User Profile Picture
            title: Column(
              children: [
                //Who you are tipping
                Text(
                  'Tip Sent',
                  style: GoogleFonts.poppins(
                      color: const Color(0xffffffff),
                      textStyle: Theme.of(context).textTheme.button),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              //Tipped Profile Picture
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundColor: Color(0xffFF8000),
                  )
                ],
              ),
              //Success Message
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Success',
                        style: GoogleFonts.poppins(
                            color: const Color(0xffffffff),
                            textStyle: Theme.of(context).textTheme.button),
                      ),
                      Text(
                        'Money Transferred Successfully',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff1E4579),
                            textStyle: Theme.of(context).textTheme.headline5),
                      ),
                    ],
                  ),
                ],
              ),
              //New Balance Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      icon: Icon(Icons.check))
                ],
              ),
            ],
          )),
    );
  }
}
