import 'package:app/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipCard extends StatefulWidget {
  const TipCard({Key? key}) : super(key: key);

  @override
  State<TipCard> createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2.0, color: const Color(0xffffffff)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              //User Image
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 2.0, color: const Color(0xffffffff)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network(
                      'https://images.pexels.com/photos/11470891/pexels-photo-11470891.jpeg?cs=srgb&dl=pexels-ashleigh-11470891.jpg&fm=jpg'),
                ),
              ),
              //User Name
              title: Text(
                'UserName',
                style: GoogleFonts.poppins(
                    color: Color(0xffffffff),
                    textStyle: Theme.of(context).textTheme.subtitle1),
              ),
              //Tipped Amount
              subtitle: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff4270b7),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Text(
                    Strings.tippedTrans,
                    style: GoogleFonts.poppins(
                        color: Color(0xffffffff),
                        textStyle: Theme.of(context).textTheme.button),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
