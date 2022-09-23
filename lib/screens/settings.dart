import 'package:app/misc/strings.dart';
import 'package:app/screens/security.dart';
import 'package:app/widgets/tipavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.userpic}) : super(key: key);

  final String userpic;
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
          body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //(),

                TipAvatar(
                  userpic: userpic,
                  size: 130,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Profile Settings',
                  style: TextStyle(
                    fontFamily: 'Acumin Pro',
                    fontSize: 20,
                    color: Color(0xff1e4579),
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Card(
              elevation: 0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
//Security
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecurityScreen(),
                      ),
                    ),
                    leading: SvgPicture.asset(Buttons.Security),
                    title: const Text(
                      'Security',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Protect your profile and wallet',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Daily Limit
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: SvgPicture.asset(
                      Logos.XRP,
                      height: 35,
                      width: 35,
                    ),
                    title: Text(
                      'Daily Tipping Limit',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Set your daily tipping limi',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Summ Wallet
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: SvgPicture.asset(Buttons.Wallet),
                    title: Text(
                      'Setup your Xumm wallet',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'setup your crypto wallet',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Change Crypto
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: SvgPicture.asset(Buttons.Crypto),
                    title: Text(
                      'Change Cryptocurrency',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Select your default cryptocurrency',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Change Currency
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: Text(
                      '¥',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 30,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        height: 0.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    title: Text(
                      'Change Currency',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Select your default currency',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Change Language
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Change Language',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Select your default language',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Change Swipe Amount
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    ),
                    leading: SvgPicture.asset(Buttons.SwipeAmount),
                    title: Text(
                      'Change Swipe Amount',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Select your default tip amount',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
//Education
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EducationScreen(),
                      ),
                    ),
                    leading: SvgPicture.asset(Buttons.Education),
                    title: Text(
                      'Education',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro',
                        fontSize: 16,
                        color: const Color(0xff1e4579),
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    subtitle: Text(
                      'Learn more about tip\$hake',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 12,
                        color: const Color(0xff1e4579),
                        height: 1.3333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            //  SignOutButton(),
          ],
        ),
      )),
    );
  }
}

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: ListTile(
            leading: SvgPicture.asset(Buttons.Education),
            title: Text(
              'Education',
              style: TextStyle(
                fontFamily: 'Acumin Pro',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
//Education Pagination
            TextButton(
              onPressed: () {},
              child: Text(
                'Education Pagination',
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
//FAQ
            TextButton(
              onPressed: () {},
              child: Text(
                'FAQ',
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
//LEGAL
            TextButton(
              onPressed: () {},
              child: Text(
                'Legal',
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
