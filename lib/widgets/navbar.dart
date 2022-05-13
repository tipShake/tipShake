import 'package:app/home.dart';
import 'package:app/tipping/tipstart.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:flutterfire_ui/auth.dart';

Widget navBar(context, snapshot) {
  return FloatingNavBar(
    resizeToAvoidBottomInset: false,
    color: Colors.green,
    selectedIconColor: Colors.white,
    unselectedIconColor: Colors.white.withOpacity(0.6),
    items: [
      FloatingNavBarItem(
          iconData: Icons.home_outlined,
          page: HomePage(user: snapshot.data),
          title: 'Home'),
      FloatingNavBarItem(iconData: Icons.money, page: tipstart(), title: 'Tip'),
      FloatingNavBarItem(
          iconData: Icons.verified_user,
          page: ProfileScreen(),
          title: 'Reminders'),
    ],
    horizontalPadding: 10.0,
    hapticFeedback: true,
    showTitle: true,
  );
}
