import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Widget build(BuildContext context) => Scaffold(
        // Use a Builder to get a context within the Scaffold.
        body: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'HOME',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: const Color(0xff26c165),
                          letterSpacing: 1.246,
                          fontWeight: FontWeight.w500,
                          height: 1.1428571428571428,
                        ),
                      )),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'TIP',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: const Color(0xff26c165),
                          letterSpacing: 1.246,
                          fontWeight: FontWeight.w500,
                          height: 1.1428571428571428,
                        ),
                      )),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'PROFILES',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: const Color(0xff26c165),
                          letterSpacing: 1.246,
                          fontWeight: FontWeight.w500,
                          height: 1.1428571428571428,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
}
