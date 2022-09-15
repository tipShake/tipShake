import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../misc/strings.dart';

class TipAvatar extends StatelessWidget {
  const TipAvatar({
    Key? key,
    required this.userpic,
  }) : super(key: key);
  final String userpic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: const Color(0xff818181),
            borderRadius: BorderRadius.all(
              Radius.elliptical(9999.0, 9999.0),
            ),
            border: Border.all(
              width: 5.0,
              color: const Color(0xffffffff),
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              userpic,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          child: SvgPicture.asset(Buttons.Home),
        )
      ],
    );
  }
}
